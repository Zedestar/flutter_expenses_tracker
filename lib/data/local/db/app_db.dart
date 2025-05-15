import 'dart:io';
import 'package:expenses_tracker/data/local/entity/expenses_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'expensesDatabase.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [ExpensesTable])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // The method for listing all the expenses present in the database
  Future<List<ExpensesTableData>> getAllExpenses() async {
    return await select(expensesTable).get();
  }

  // The method for getting a single expense by its ID
  Future<ExpensesTableData> getExpenseById(String id) async {
    return await (select(expensesTable)..where((item) => item.id.equals(id)))
        .getSingle();
  }

  // The method for deleting an expense by its ID
  Future<int> deleteExpense(String id) async {
    return await (delete(expensesTable)..where((item) => item.id.equals(id)))
        .go();
  }

  // Method for inserting the new expense
  Future<int> insertingNewExpense(ExpensesTableCompanion entity) async {
    return await into(expensesTable).insert(entity);
  }

  Future<bool> updatingTheExpenses(ExpensesTableCompanion entity) async {
    return await update(expensesTable).replace(entity);
  }
}
