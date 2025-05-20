import 'dart:io';
import 'package:expenses_tracker/data/local/entity/expenses_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'expensesDatabase.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [ExpensesTable, RecordType])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from == 1 && to == 2) {
            await m.createTable(recordType);

            await m.addColumn(
              expensesTable,
              expensesTable.ofRecordTypeId,
            );
          }
        },
      );

  // The method for listing all the expenses present in the database
  // Future<List<ExpensesTableData>> getAllExpenses() async {
  //   return await select(expensesTable).get();
  // }

  // ####################### EXPENSE-DATA TABLE QUERIES ########################

  Stream<List<ExpensesTableData>> getAllExpenses() {
    return (select(expensesTable)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.expensesDate)]))
        .watch();
  }

  Future<ExpensesTableData> getExpenseById(int id) async {
    return await (select(expensesTable)..where((item) => item.id.equals(id)))
        .getSingle();
  }

  Future<int> deleteExpense(int id) async {
    return await (delete(expensesTable)..where((item) => item.id.equals(id)))
        .go();
  }

  Future<int> insertingNewExpense(ExpensesTableCompanion entity) async {
    return await into(expensesTable).insert(entity);
  }

  Future<bool> updatingTheExpenses(ExpensesTableCompanion entity) async {
    return await update(expensesTable).replace(entity);
  }

// ##################### RECORD TYPE-DATA TABLE QUERIES ######################
}
