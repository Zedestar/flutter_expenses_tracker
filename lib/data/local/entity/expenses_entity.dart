import 'package:drift/drift.dart';
import 'package:uuid/v4.dart';

class ExpensesTable extends Table {
  TextColumn get id => text()
      .clientDefault(() => UuidV4().toString())
      .named("id")
      .customConstraint("PRIMARY kEY")();
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
