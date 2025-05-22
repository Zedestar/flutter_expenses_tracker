import 'package:drift/drift.dart';

class RecordType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get recordName =>
      text().withLength(min: 1, max: 100).named("record_name")();
  TextColumn get recordDescription =>
      text().withLength(min: 1, max: 200).named("record_decription")();
  DateTimeColumn get recordTimeCreated =>
      dateTime().named("record_time_created")();
}

class ExpensesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get expensesName =>
      text().withLength(min: 1, max: 100).named("expsenses_name")();
  TextColumn get expensesCategory =>
      text().withLength(min: 1, max: 100).named("expenses_caegory")();
  RealColumn get expensesAmount => real().named("expenses_amount")();
  TextColumn get expensesDescription => text()
      .withLength(min: 1, max: 100)
      .named("expenses_description")
      .nullable()();
  DateTimeColumn get expensesDate => dateTime().named("expenses_date")();

  // Connecting the expenses table to the record type table
  IntColumn get ofRecordTypeId => integer()
      .references(
        RecordType,
        #id,
        onDelete: KeyAction.cascade,
      )
      .nullable()
      .named("of_record_type_id")();
}

class IncomeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get incomeName =>
      text().withLength(min: 1, max: 100).named("income_name")();
  TextColumn get incomeDescription =>
      text().withLength(min: 1, max: 200).named("income_description")();
  TextColumn get incomeCategory =>
      text().withLength(min: 1, max: 100).named("income_category")();
  RealColumn get incomeAmount => real().named("income_amount")();
  DateTimeColumn get incomeDate => dateTime().named("income_date")();

  // Connecting the income table to the record type table
  IntColumn get ofRecordTypeId => integer()
      .references(RecordType, #id, onDelete: KeyAction.cascade)
      .nullable()
      .named("of_record_type_id")();
}
