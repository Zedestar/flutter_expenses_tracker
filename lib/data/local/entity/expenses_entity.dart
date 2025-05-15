import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

class ExpensesTable extends Table {
  // TextColumn get id => text()
  //     .clientDefault(() => const Uuid().v4())
  //     .named("id")
  //     // .customConstraint("PRIMARY KEY")
  //     .isPrimaryKey()();
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
}
