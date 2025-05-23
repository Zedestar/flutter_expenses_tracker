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

@DriftDatabase(tables: [ExpensesTable, RecordType, IncomeTable])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 3;

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
          if (from == 2 && to == 3) {
            await m.createTable(incomeTable);
          }
        },
      );

  // The method for listing all the expenses present in the database
  // Future<List<ExpensesTableData>> getAllExpenses() async {
  //   return await select(expensesTable).get();
  // }

  // ####################### EXPENSE-DATA TABLE QUERIES ########################

  Stream<List<ExpensesTableData>> getAllExpenses(int recordTypeId) {
    return (select(expensesTable)
          ..where((item) => item.ofRecordTypeId.equals(recordTypeId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)]))
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

  Stream<List<RecordTypeData>> getAllRecordTypes() {
    return (select(recordType)..orderBy([(item) => OrderingTerm.desc(item.id)]))
        .watch();
  }

  Future<int> insertingNewRecordType(RecordTypeCompanion entity) async {
    return await into(recordType).insert(entity);
  }

  // ##################### RECORD TYPE-DATA TABLE QUERIES ######################
  Stream<List<IncomeTableData>> getAllIncome(int recordTypeId) {
    return (select(incomeTable)
          ..where((item) => item.ofRecordTypeId.equals(recordTypeId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)]))
        .watch();
  }

  Future<IncomeTableData> getIcomeById(int id) async {
    return await (select(incomeTable)..where((item) => item.id.equals(id)))
        .getSingle();
  }

  Future<int> insertingNewIncome(IncomeTableCompanion entity) async {
    return await into(incomeTable).insert(entity);
  }

  Future<int> deleteIncome(int incomeId) async {
    return await (delete(incomeTable)
          ..where((item) => item.id.equals(incomeId)))
        .go();
  }

  Future<bool> updateIncomeItem(IncomeTableCompanion entity) async {
    return await update(incomeTable).replace(entity);
  }
}
