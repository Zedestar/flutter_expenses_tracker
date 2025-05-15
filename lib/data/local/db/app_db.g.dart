// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $ExpensesTableTable extends ExpensesTable
    with TableInfo<$ExpensesTableTable, ExpensesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY',
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _expensesNameMeta =
      const VerificationMeta('expensesName');
  @override
  late final GeneratedColumn<String> expensesName = GeneratedColumn<String>(
      'expsenses_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _expensesCategoryMeta =
      const VerificationMeta('expensesCategory');
  @override
  late final GeneratedColumn<String> expensesCategory = GeneratedColumn<String>(
      'expenses_caegory', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _expensesAmountMeta =
      const VerificationMeta('expensesAmount');
  @override
  late final GeneratedColumn<double> expensesAmount = GeneratedColumn<double>(
      'expenses_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _expensesDescriptionMeta =
      const VerificationMeta('expensesDescription');
  @override
  late final GeneratedColumn<String> expensesDescription =
      GeneratedColumn<String>('expenses_description', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 100),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _expensesDateMeta =
      const VerificationMeta('expensesDate');
  @override
  late final GeneratedColumn<DateTime> expensesDate = GeneratedColumn<DateTime>(
      'expenses_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        expensesName,
        expensesCategory,
        expensesAmount,
        expensesDescription,
        expensesDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses_table';
  @override
  VerificationContext validateIntegrity(Insertable<ExpensesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('expsenses_name')) {
      context.handle(
          _expensesNameMeta,
          expensesName.isAcceptableOrUnknown(
              data['expsenses_name']!, _expensesNameMeta));
    } else if (isInserting) {
      context.missing(_expensesNameMeta);
    }
    if (data.containsKey('expenses_caegory')) {
      context.handle(
          _expensesCategoryMeta,
          expensesCategory.isAcceptableOrUnknown(
              data['expenses_caegory']!, _expensesCategoryMeta));
    } else if (isInserting) {
      context.missing(_expensesCategoryMeta);
    }
    if (data.containsKey('expenses_amount')) {
      context.handle(
          _expensesAmountMeta,
          expensesAmount.isAcceptableOrUnknown(
              data['expenses_amount']!, _expensesAmountMeta));
    } else if (isInserting) {
      context.missing(_expensesAmountMeta);
    }
    if (data.containsKey('expenses_description')) {
      context.handle(
          _expensesDescriptionMeta,
          expensesDescription.isAcceptableOrUnknown(
              data['expenses_description']!, _expensesDescriptionMeta));
    }
    if (data.containsKey('expenses_date')) {
      context.handle(
          _expensesDateMeta,
          expensesDate.isAcceptableOrUnknown(
              data['expenses_date']!, _expensesDateMeta));
    } else if (isInserting) {
      context.missing(_expensesDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpensesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpensesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      expensesName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}expsenses_name'])!,
      expensesCategory: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}expenses_caegory'])!,
      expensesAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}expenses_amount'])!,
      expensesDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}expenses_description']),
      expensesDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}expenses_date'])!,
    );
  }

  @override
  $ExpensesTableTable createAlias(String alias) {
    return $ExpensesTableTable(attachedDatabase, alias);
  }
}

class ExpensesTableData extends DataClass
    implements Insertable<ExpensesTableData> {
  final String id;
  final String expensesName;
  final String expensesCategory;
  final double expensesAmount;
  final String? expensesDescription;
  final DateTime expensesDate;
  const ExpensesTableData(
      {required this.id,
      required this.expensesName,
      required this.expensesCategory,
      required this.expensesAmount,
      this.expensesDescription,
      required this.expensesDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['expsenses_name'] = Variable<String>(expensesName);
    map['expenses_caegory'] = Variable<String>(expensesCategory);
    map['expenses_amount'] = Variable<double>(expensesAmount);
    if (!nullToAbsent || expensesDescription != null) {
      map['expenses_description'] = Variable<String>(expensesDescription);
    }
    map['expenses_date'] = Variable<DateTime>(expensesDate);
    return map;
  }

  ExpensesTableCompanion toCompanion(bool nullToAbsent) {
    return ExpensesTableCompanion(
      id: Value(id),
      expensesName: Value(expensesName),
      expensesCategory: Value(expensesCategory),
      expensesAmount: Value(expensesAmount),
      expensesDescription: expensesDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(expensesDescription),
      expensesDate: Value(expensesDate),
    );
  }

  factory ExpensesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpensesTableData(
      id: serializer.fromJson<String>(json['id']),
      expensesName: serializer.fromJson<String>(json['expensesName']),
      expensesCategory: serializer.fromJson<String>(json['expensesCategory']),
      expensesAmount: serializer.fromJson<double>(json['expensesAmount']),
      expensesDescription:
          serializer.fromJson<String?>(json['expensesDescription']),
      expensesDate: serializer.fromJson<DateTime>(json['expensesDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'expensesName': serializer.toJson<String>(expensesName),
      'expensesCategory': serializer.toJson<String>(expensesCategory),
      'expensesAmount': serializer.toJson<double>(expensesAmount),
      'expensesDescription': serializer.toJson<String?>(expensesDescription),
      'expensesDate': serializer.toJson<DateTime>(expensesDate),
    };
  }

  ExpensesTableData copyWith(
          {String? id,
          String? expensesName,
          String? expensesCategory,
          double? expensesAmount,
          Value<String?> expensesDescription = const Value.absent(),
          DateTime? expensesDate}) =>
      ExpensesTableData(
        id: id ?? this.id,
        expensesName: expensesName ?? this.expensesName,
        expensesCategory: expensesCategory ?? this.expensesCategory,
        expensesAmount: expensesAmount ?? this.expensesAmount,
        expensesDescription: expensesDescription.present
            ? expensesDescription.value
            : this.expensesDescription,
        expensesDate: expensesDate ?? this.expensesDate,
      );
  ExpensesTableData copyWithCompanion(ExpensesTableCompanion data) {
    return ExpensesTableData(
      id: data.id.present ? data.id.value : this.id,
      expensesName: data.expensesName.present
          ? data.expensesName.value
          : this.expensesName,
      expensesCategory: data.expensesCategory.present
          ? data.expensesCategory.value
          : this.expensesCategory,
      expensesAmount: data.expensesAmount.present
          ? data.expensesAmount.value
          : this.expensesAmount,
      expensesDescription: data.expensesDescription.present
          ? data.expensesDescription.value
          : this.expensesDescription,
      expensesDate: data.expensesDate.present
          ? data.expensesDate.value
          : this.expensesDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesTableData(')
          ..write('id: $id, ')
          ..write('expensesName: $expensesName, ')
          ..write('expensesCategory: $expensesCategory, ')
          ..write('expensesAmount: $expensesAmount, ')
          ..write('expensesDescription: $expensesDescription, ')
          ..write('expensesDate: $expensesDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, expensesName, expensesCategory,
      expensesAmount, expensesDescription, expensesDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpensesTableData &&
          other.id == this.id &&
          other.expensesName == this.expensesName &&
          other.expensesCategory == this.expensesCategory &&
          other.expensesAmount == this.expensesAmount &&
          other.expensesDescription == this.expensesDescription &&
          other.expensesDate == this.expensesDate);
}

class ExpensesTableCompanion extends UpdateCompanion<ExpensesTableData> {
  final Value<String> id;
  final Value<String> expensesName;
  final Value<String> expensesCategory;
  final Value<double> expensesAmount;
  final Value<String?> expensesDescription;
  final Value<DateTime> expensesDate;
  final Value<int> rowid;
  const ExpensesTableCompanion({
    this.id = const Value.absent(),
    this.expensesName = const Value.absent(),
    this.expensesCategory = const Value.absent(),
    this.expensesAmount = const Value.absent(),
    this.expensesDescription = const Value.absent(),
    this.expensesDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesTableCompanion.insert({
    this.id = const Value.absent(),
    required String expensesName,
    required String expensesCategory,
    required double expensesAmount,
    this.expensesDescription = const Value.absent(),
    required DateTime expensesDate,
    this.rowid = const Value.absent(),
  })  : expensesName = Value(expensesName),
        expensesCategory = Value(expensesCategory),
        expensesAmount = Value(expensesAmount),
        expensesDate = Value(expensesDate);
  static Insertable<ExpensesTableData> custom({
    Expression<String>? id,
    Expression<String>? expensesName,
    Expression<String>? expensesCategory,
    Expression<double>? expensesAmount,
    Expression<String>? expensesDescription,
    Expression<DateTime>? expensesDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (expensesName != null) 'expsenses_name': expensesName,
      if (expensesCategory != null) 'expenses_caegory': expensesCategory,
      if (expensesAmount != null) 'expenses_amount': expensesAmount,
      if (expensesDescription != null)
        'expenses_description': expensesDescription,
      if (expensesDate != null) 'expenses_date': expensesDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? expensesName,
      Value<String>? expensesCategory,
      Value<double>? expensesAmount,
      Value<String?>? expensesDescription,
      Value<DateTime>? expensesDate,
      Value<int>? rowid}) {
    return ExpensesTableCompanion(
      id: id ?? this.id,
      expensesName: expensesName ?? this.expensesName,
      expensesCategory: expensesCategory ?? this.expensesCategory,
      expensesAmount: expensesAmount ?? this.expensesAmount,
      expensesDescription: expensesDescription ?? this.expensesDescription,
      expensesDate: expensesDate ?? this.expensesDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (expensesName.present) {
      map['expsenses_name'] = Variable<String>(expensesName.value);
    }
    if (expensesCategory.present) {
      map['expenses_caegory'] = Variable<String>(expensesCategory.value);
    }
    if (expensesAmount.present) {
      map['expenses_amount'] = Variable<double>(expensesAmount.value);
    }
    if (expensesDescription.present) {
      map['expenses_description'] = Variable<String>(expensesDescription.value);
    }
    if (expensesDate.present) {
      map['expenses_date'] = Variable<DateTime>(expensesDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesTableCompanion(')
          ..write('id: $id, ')
          ..write('expensesName: $expensesName, ')
          ..write('expensesCategory: $expensesCategory, ')
          ..write('expensesAmount: $expensesAmount, ')
          ..write('expensesDescription: $expensesDescription, ')
          ..write('expensesDate: $expensesDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $ExpensesTableTable expensesTable = $ExpensesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [expensesTable];
}

typedef $$ExpensesTableTableCreateCompanionBuilder = ExpensesTableCompanion
    Function({
  Value<String> id,
  required String expensesName,
  required String expensesCategory,
  required double expensesAmount,
  Value<String?> expensesDescription,
  required DateTime expensesDate,
  Value<int> rowid,
});
typedef $$ExpensesTableTableUpdateCompanionBuilder = ExpensesTableCompanion
    Function({
  Value<String> id,
  Value<String> expensesName,
  Value<String> expensesCategory,
  Value<double> expensesAmount,
  Value<String?> expensesDescription,
  Value<DateTime> expensesDate,
  Value<int> rowid,
});

class $$ExpensesTableTableFilterComposer
    extends Composer<_$AppDb, $ExpensesTableTable> {
  $$ExpensesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get expensesName => $composableBuilder(
      column: $table.expensesName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get expensesCategory => $composableBuilder(
      column: $table.expensesCategory,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get expensesAmount => $composableBuilder(
      column: $table.expensesAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get expensesDescription => $composableBuilder(
      column: $table.expensesDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expensesDate => $composableBuilder(
      column: $table.expensesDate, builder: (column) => ColumnFilters(column));
}

class $$ExpensesTableTableOrderingComposer
    extends Composer<_$AppDb, $ExpensesTableTable> {
  $$ExpensesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get expensesName => $composableBuilder(
      column: $table.expensesName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get expensesCategory => $composableBuilder(
      column: $table.expensesCategory,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get expensesAmount => $composableBuilder(
      column: $table.expensesAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get expensesDescription => $composableBuilder(
      column: $table.expensesDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expensesDate => $composableBuilder(
      column: $table.expensesDate,
      builder: (column) => ColumnOrderings(column));
}

class $$ExpensesTableTableAnnotationComposer
    extends Composer<_$AppDb, $ExpensesTableTable> {
  $$ExpensesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get expensesName => $composableBuilder(
      column: $table.expensesName, builder: (column) => column);

  GeneratedColumn<String> get expensesCategory => $composableBuilder(
      column: $table.expensesCategory, builder: (column) => column);

  GeneratedColumn<double> get expensesAmount => $composableBuilder(
      column: $table.expensesAmount, builder: (column) => column);

  GeneratedColumn<String> get expensesDescription => $composableBuilder(
      column: $table.expensesDescription, builder: (column) => column);

  GeneratedColumn<DateTime> get expensesDate => $composableBuilder(
      column: $table.expensesDate, builder: (column) => column);
}

class $$ExpensesTableTableTableManager extends RootTableManager<
    _$AppDb,
    $ExpensesTableTable,
    ExpensesTableData,
    $$ExpensesTableTableFilterComposer,
    $$ExpensesTableTableOrderingComposer,
    $$ExpensesTableTableAnnotationComposer,
    $$ExpensesTableTableCreateCompanionBuilder,
    $$ExpensesTableTableUpdateCompanionBuilder,
    (
      ExpensesTableData,
      BaseReferences<_$AppDb, $ExpensesTableTable, ExpensesTableData>
    ),
    ExpensesTableData,
    PrefetchHooks Function()> {
  $$ExpensesTableTableTableManager(_$AppDb db, $ExpensesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> expensesName = const Value.absent(),
            Value<String> expensesCategory = const Value.absent(),
            Value<double> expensesAmount = const Value.absent(),
            Value<String?> expensesDescription = const Value.absent(),
            Value<DateTime> expensesDate = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpensesTableCompanion(
            id: id,
            expensesName: expensesName,
            expensesCategory: expensesCategory,
            expensesAmount: expensesAmount,
            expensesDescription: expensesDescription,
            expensesDate: expensesDate,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String expensesName,
            required String expensesCategory,
            required double expensesAmount,
            Value<String?> expensesDescription = const Value.absent(),
            required DateTime expensesDate,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpensesTableCompanion.insert(
            id: id,
            expensesName: expensesName,
            expensesCategory: expensesCategory,
            expensesAmount: expensesAmount,
            expensesDescription: expensesDescription,
            expensesDate: expensesDate,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExpensesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $ExpensesTableTable,
    ExpensesTableData,
    $$ExpensesTableTableFilterComposer,
    $$ExpensesTableTableOrderingComposer,
    $$ExpensesTableTableAnnotationComposer,
    $$ExpensesTableTableCreateCompanionBuilder,
    $$ExpensesTableTableUpdateCompanionBuilder,
    (
      ExpensesTableData,
      BaseReferences<_$AppDb, $ExpensesTableTable, ExpensesTableData>
    ),
    ExpensesTableData,
    PrefetchHooks Function()>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$ExpensesTableTableTableManager get expensesTable =>
      $$ExpensesTableTableTableManager(_db, _db.expensesTable);
}
