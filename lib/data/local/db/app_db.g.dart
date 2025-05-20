// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $RecordTypeTable extends RecordType
    with TableInfo<$RecordTypeTable, RecordTypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordTypeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _recordNameMeta =
      const VerificationMeta('recordName');
  @override
  late final GeneratedColumn<String> recordName = GeneratedColumn<String>(
      'record_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _recordDescriptionMeta =
      const VerificationMeta('recordDescription');
  @override
  late final GeneratedColumn<String> recordDescription =
      GeneratedColumn<String>('record_decription', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 200),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _recordTimeCreatedMeta =
      const VerificationMeta('recordTimeCreated');
  @override
  late final GeneratedColumn<DateTime> recordTimeCreated =
      GeneratedColumn<DateTime>('record_time_created', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, recordName, recordDescription, recordTimeCreated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'record_type';
  @override
  VerificationContext validateIntegrity(Insertable<RecordTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('record_name')) {
      context.handle(
          _recordNameMeta,
          recordName.isAcceptableOrUnknown(
              data['record_name']!, _recordNameMeta));
    } else if (isInserting) {
      context.missing(_recordNameMeta);
    }
    if (data.containsKey('record_decription')) {
      context.handle(
          _recordDescriptionMeta,
          recordDescription.isAcceptableOrUnknown(
              data['record_decription']!, _recordDescriptionMeta));
    } else if (isInserting) {
      context.missing(_recordDescriptionMeta);
    }
    if (data.containsKey('record_time_created')) {
      context.handle(
          _recordTimeCreatedMeta,
          recordTimeCreated.isAcceptableOrUnknown(
              data['record_time_created']!, _recordTimeCreatedMeta));
    } else if (isInserting) {
      context.missing(_recordTimeCreatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecordTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordTypeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      recordName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_name'])!,
      recordDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}record_decription'])!,
      recordTimeCreated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}record_time_created'])!,
    );
  }

  @override
  $RecordTypeTable createAlias(String alias) {
    return $RecordTypeTable(attachedDatabase, alias);
  }
}

class RecordTypeData extends DataClass implements Insertable<RecordTypeData> {
  final int id;
  final String recordName;
  final String recordDescription;
  final DateTime recordTimeCreated;
  const RecordTypeData(
      {required this.id,
      required this.recordName,
      required this.recordDescription,
      required this.recordTimeCreated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['record_name'] = Variable<String>(recordName);
    map['record_decription'] = Variable<String>(recordDescription);
    map['record_time_created'] = Variable<DateTime>(recordTimeCreated);
    return map;
  }

  RecordTypeCompanion toCompanion(bool nullToAbsent) {
    return RecordTypeCompanion(
      id: Value(id),
      recordName: Value(recordName),
      recordDescription: Value(recordDescription),
      recordTimeCreated: Value(recordTimeCreated),
    );
  }

  factory RecordTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordTypeData(
      id: serializer.fromJson<int>(json['id']),
      recordName: serializer.fromJson<String>(json['recordName']),
      recordDescription: serializer.fromJson<String>(json['recordDescription']),
      recordTimeCreated:
          serializer.fromJson<DateTime>(json['recordTimeCreated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recordName': serializer.toJson<String>(recordName),
      'recordDescription': serializer.toJson<String>(recordDescription),
      'recordTimeCreated': serializer.toJson<DateTime>(recordTimeCreated),
    };
  }

  RecordTypeData copyWith(
          {int? id,
          String? recordName,
          String? recordDescription,
          DateTime? recordTimeCreated}) =>
      RecordTypeData(
        id: id ?? this.id,
        recordName: recordName ?? this.recordName,
        recordDescription: recordDescription ?? this.recordDescription,
        recordTimeCreated: recordTimeCreated ?? this.recordTimeCreated,
      );
  RecordTypeData copyWithCompanion(RecordTypeCompanion data) {
    return RecordTypeData(
      id: data.id.present ? data.id.value : this.id,
      recordName:
          data.recordName.present ? data.recordName.value : this.recordName,
      recordDescription: data.recordDescription.present
          ? data.recordDescription.value
          : this.recordDescription,
      recordTimeCreated: data.recordTimeCreated.present
          ? data.recordTimeCreated.value
          : this.recordTimeCreated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecordTypeData(')
          ..write('id: $id, ')
          ..write('recordName: $recordName, ')
          ..write('recordDescription: $recordDescription, ')
          ..write('recordTimeCreated: $recordTimeCreated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, recordName, recordDescription, recordTimeCreated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordTypeData &&
          other.id == this.id &&
          other.recordName == this.recordName &&
          other.recordDescription == this.recordDescription &&
          other.recordTimeCreated == this.recordTimeCreated);
}

class RecordTypeCompanion extends UpdateCompanion<RecordTypeData> {
  final Value<int> id;
  final Value<String> recordName;
  final Value<String> recordDescription;
  final Value<DateTime> recordTimeCreated;
  const RecordTypeCompanion({
    this.id = const Value.absent(),
    this.recordName = const Value.absent(),
    this.recordDescription = const Value.absent(),
    this.recordTimeCreated = const Value.absent(),
  });
  RecordTypeCompanion.insert({
    this.id = const Value.absent(),
    required String recordName,
    required String recordDescription,
    required DateTime recordTimeCreated,
  })  : recordName = Value(recordName),
        recordDescription = Value(recordDescription),
        recordTimeCreated = Value(recordTimeCreated);
  static Insertable<RecordTypeData> custom({
    Expression<int>? id,
    Expression<String>? recordName,
    Expression<String>? recordDescription,
    Expression<DateTime>? recordTimeCreated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recordName != null) 'record_name': recordName,
      if (recordDescription != null) 'record_decription': recordDescription,
      if (recordTimeCreated != null) 'record_time_created': recordTimeCreated,
    });
  }

  RecordTypeCompanion copyWith(
      {Value<int>? id,
      Value<String>? recordName,
      Value<String>? recordDescription,
      Value<DateTime>? recordTimeCreated}) {
    return RecordTypeCompanion(
      id: id ?? this.id,
      recordName: recordName ?? this.recordName,
      recordDescription: recordDescription ?? this.recordDescription,
      recordTimeCreated: recordTimeCreated ?? this.recordTimeCreated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recordName.present) {
      map['record_name'] = Variable<String>(recordName.value);
    }
    if (recordDescription.present) {
      map['record_decription'] = Variable<String>(recordDescription.value);
    }
    if (recordTimeCreated.present) {
      map['record_time_created'] = Variable<DateTime>(recordTimeCreated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordTypeCompanion(')
          ..write('id: $id, ')
          ..write('recordName: $recordName, ')
          ..write('recordDescription: $recordDescription, ')
          ..write('recordTimeCreated: $recordTimeCreated')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTableTable extends ExpensesTable
    with TableInfo<$ExpensesTableTable, ExpensesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  static const VerificationMeta _ofRecordTypeIdMeta =
      const VerificationMeta('ofRecordTypeId');
  @override
  late final GeneratedColumn<int> ofRecordTypeId = GeneratedColumn<int>(
      'of_record_type_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES record_type (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        expensesName,
        expensesCategory,
        expensesAmount,
        expensesDescription,
        expensesDate,
        ofRecordTypeId
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
    if (data.containsKey('of_record_type_id')) {
      context.handle(
          _ofRecordTypeIdMeta,
          ofRecordTypeId.isAcceptableOrUnknown(
              data['of_record_type_id']!, _ofRecordTypeIdMeta));
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
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
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
      ofRecordTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}of_record_type_id']),
    );
  }

  @override
  $ExpensesTableTable createAlias(String alias) {
    return $ExpensesTableTable(attachedDatabase, alias);
  }
}

class ExpensesTableData extends DataClass
    implements Insertable<ExpensesTableData> {
  final int id;
  final String expensesName;
  final String expensesCategory;
  final double expensesAmount;
  final String? expensesDescription;
  final DateTime expensesDate;
  final int? ofRecordTypeId;
  const ExpensesTableData(
      {required this.id,
      required this.expensesName,
      required this.expensesCategory,
      required this.expensesAmount,
      this.expensesDescription,
      required this.expensesDate,
      this.ofRecordTypeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['expsenses_name'] = Variable<String>(expensesName);
    map['expenses_caegory'] = Variable<String>(expensesCategory);
    map['expenses_amount'] = Variable<double>(expensesAmount);
    if (!nullToAbsent || expensesDescription != null) {
      map['expenses_description'] = Variable<String>(expensesDescription);
    }
    map['expenses_date'] = Variable<DateTime>(expensesDate);
    if (!nullToAbsent || ofRecordTypeId != null) {
      map['of_record_type_id'] = Variable<int>(ofRecordTypeId);
    }
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
      ofRecordTypeId: ofRecordTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(ofRecordTypeId),
    );
  }

  factory ExpensesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpensesTableData(
      id: serializer.fromJson<int>(json['id']),
      expensesName: serializer.fromJson<String>(json['expensesName']),
      expensesCategory: serializer.fromJson<String>(json['expensesCategory']),
      expensesAmount: serializer.fromJson<double>(json['expensesAmount']),
      expensesDescription:
          serializer.fromJson<String?>(json['expensesDescription']),
      expensesDate: serializer.fromJson<DateTime>(json['expensesDate']),
      ofRecordTypeId: serializer.fromJson<int?>(json['ofRecordTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'expensesName': serializer.toJson<String>(expensesName),
      'expensesCategory': serializer.toJson<String>(expensesCategory),
      'expensesAmount': serializer.toJson<double>(expensesAmount),
      'expensesDescription': serializer.toJson<String?>(expensesDescription),
      'expensesDate': serializer.toJson<DateTime>(expensesDate),
      'ofRecordTypeId': serializer.toJson<int?>(ofRecordTypeId),
    };
  }

  ExpensesTableData copyWith(
          {int? id,
          String? expensesName,
          String? expensesCategory,
          double? expensesAmount,
          Value<String?> expensesDescription = const Value.absent(),
          DateTime? expensesDate,
          Value<int?> ofRecordTypeId = const Value.absent()}) =>
      ExpensesTableData(
        id: id ?? this.id,
        expensesName: expensesName ?? this.expensesName,
        expensesCategory: expensesCategory ?? this.expensesCategory,
        expensesAmount: expensesAmount ?? this.expensesAmount,
        expensesDescription: expensesDescription.present
            ? expensesDescription.value
            : this.expensesDescription,
        expensesDate: expensesDate ?? this.expensesDate,
        ofRecordTypeId:
            ofRecordTypeId.present ? ofRecordTypeId.value : this.ofRecordTypeId,
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
      ofRecordTypeId: data.ofRecordTypeId.present
          ? data.ofRecordTypeId.value
          : this.ofRecordTypeId,
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
          ..write('expensesDate: $expensesDate, ')
          ..write('ofRecordTypeId: $ofRecordTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, expensesName, expensesCategory,
      expensesAmount, expensesDescription, expensesDate, ofRecordTypeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpensesTableData &&
          other.id == this.id &&
          other.expensesName == this.expensesName &&
          other.expensesCategory == this.expensesCategory &&
          other.expensesAmount == this.expensesAmount &&
          other.expensesDescription == this.expensesDescription &&
          other.expensesDate == this.expensesDate &&
          other.ofRecordTypeId == this.ofRecordTypeId);
}

class ExpensesTableCompanion extends UpdateCompanion<ExpensesTableData> {
  final Value<int> id;
  final Value<String> expensesName;
  final Value<String> expensesCategory;
  final Value<double> expensesAmount;
  final Value<String?> expensesDescription;
  final Value<DateTime> expensesDate;
  final Value<int?> ofRecordTypeId;
  const ExpensesTableCompanion({
    this.id = const Value.absent(),
    this.expensesName = const Value.absent(),
    this.expensesCategory = const Value.absent(),
    this.expensesAmount = const Value.absent(),
    this.expensesDescription = const Value.absent(),
    this.expensesDate = const Value.absent(),
    this.ofRecordTypeId = const Value.absent(),
  });
  ExpensesTableCompanion.insert({
    this.id = const Value.absent(),
    required String expensesName,
    required String expensesCategory,
    required double expensesAmount,
    this.expensesDescription = const Value.absent(),
    required DateTime expensesDate,
    this.ofRecordTypeId = const Value.absent(),
  })  : expensesName = Value(expensesName),
        expensesCategory = Value(expensesCategory),
        expensesAmount = Value(expensesAmount),
        expensesDate = Value(expensesDate);
  static Insertable<ExpensesTableData> custom({
    Expression<int>? id,
    Expression<String>? expensesName,
    Expression<String>? expensesCategory,
    Expression<double>? expensesAmount,
    Expression<String>? expensesDescription,
    Expression<DateTime>? expensesDate,
    Expression<int>? ofRecordTypeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (expensesName != null) 'expsenses_name': expensesName,
      if (expensesCategory != null) 'expenses_caegory': expensesCategory,
      if (expensesAmount != null) 'expenses_amount': expensesAmount,
      if (expensesDescription != null)
        'expenses_description': expensesDescription,
      if (expensesDate != null) 'expenses_date': expensesDate,
      if (ofRecordTypeId != null) 'of_record_type_id': ofRecordTypeId,
    });
  }

  ExpensesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? expensesName,
      Value<String>? expensesCategory,
      Value<double>? expensesAmount,
      Value<String?>? expensesDescription,
      Value<DateTime>? expensesDate,
      Value<int?>? ofRecordTypeId}) {
    return ExpensesTableCompanion(
      id: id ?? this.id,
      expensesName: expensesName ?? this.expensesName,
      expensesCategory: expensesCategory ?? this.expensesCategory,
      expensesAmount: expensesAmount ?? this.expensesAmount,
      expensesDescription: expensesDescription ?? this.expensesDescription,
      expensesDate: expensesDate ?? this.expensesDate,
      ofRecordTypeId: ofRecordTypeId ?? this.ofRecordTypeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (ofRecordTypeId.present) {
      map['of_record_type_id'] = Variable<int>(ofRecordTypeId.value);
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
          ..write('ofRecordTypeId: $ofRecordTypeId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $RecordTypeTable recordType = $RecordTypeTable(this);
  late final $ExpensesTableTable expensesTable = $ExpensesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [recordType, expensesTable];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('record_type',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('expenses_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$RecordTypeTableCreateCompanionBuilder = RecordTypeCompanion Function({
  Value<int> id,
  required String recordName,
  required String recordDescription,
  required DateTime recordTimeCreated,
});
typedef $$RecordTypeTableUpdateCompanionBuilder = RecordTypeCompanion Function({
  Value<int> id,
  Value<String> recordName,
  Value<String> recordDescription,
  Value<DateTime> recordTimeCreated,
});

final class $$RecordTypeTableReferences
    extends BaseReferences<_$AppDb, $RecordTypeTable, RecordTypeData> {
  $$RecordTypeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExpensesTableTable, List<ExpensesTableData>>
      _expensesTableRefsTable(_$AppDb db) =>
          MultiTypedResultKey.fromTable(db.expensesTable,
              aliasName: $_aliasNameGenerator(
                  db.recordType.id, db.expensesTable.ofRecordTypeId));

  $$ExpensesTableTableProcessedTableManager get expensesTableRefs {
    final manager = $$ExpensesTableTableTableManager($_db, $_db.expensesTable)
        .filter((f) => f.ofRecordTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RecordTypeTableFilterComposer
    extends Composer<_$AppDb, $RecordTypeTable> {
  $$RecordTypeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recordName => $composableBuilder(
      column: $table.recordName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recordDescription => $composableBuilder(
      column: $table.recordDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get recordTimeCreated => $composableBuilder(
      column: $table.recordTimeCreated,
      builder: (column) => ColumnFilters(column));

  Expression<bool> expensesTableRefs(
      Expression<bool> Function($$ExpensesTableTableFilterComposer f) f) {
    final $$ExpensesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expensesTable,
        getReferencedColumn: (t) => t.ofRecordTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableTableFilterComposer(
              $db: $db,
              $table: $db.expensesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecordTypeTableOrderingComposer
    extends Composer<_$AppDb, $RecordTypeTable> {
  $$RecordTypeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recordName => $composableBuilder(
      column: $table.recordName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recordDescription => $composableBuilder(
      column: $table.recordDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get recordTimeCreated => $composableBuilder(
      column: $table.recordTimeCreated,
      builder: (column) => ColumnOrderings(column));
}

class $$RecordTypeTableAnnotationComposer
    extends Composer<_$AppDb, $RecordTypeTable> {
  $$RecordTypeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get recordName => $composableBuilder(
      column: $table.recordName, builder: (column) => column);

  GeneratedColumn<String> get recordDescription => $composableBuilder(
      column: $table.recordDescription, builder: (column) => column);

  GeneratedColumn<DateTime> get recordTimeCreated => $composableBuilder(
      column: $table.recordTimeCreated, builder: (column) => column);

  Expression<T> expensesTableRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableTableAnnotationComposer a) f) {
    final $$ExpensesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expensesTable,
        getReferencedColumn: (t) => t.ofRecordTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.expensesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecordTypeTableTableManager extends RootTableManager<
    _$AppDb,
    $RecordTypeTable,
    RecordTypeData,
    $$RecordTypeTableFilterComposer,
    $$RecordTypeTableOrderingComposer,
    $$RecordTypeTableAnnotationComposer,
    $$RecordTypeTableCreateCompanionBuilder,
    $$RecordTypeTableUpdateCompanionBuilder,
    (RecordTypeData, $$RecordTypeTableReferences),
    RecordTypeData,
    PrefetchHooks Function({bool expensesTableRefs})> {
  $$RecordTypeTableTableManager(_$AppDb db, $RecordTypeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecordTypeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecordTypeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecordTypeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> recordName = const Value.absent(),
            Value<String> recordDescription = const Value.absent(),
            Value<DateTime> recordTimeCreated = const Value.absent(),
          }) =>
              RecordTypeCompanion(
            id: id,
            recordName: recordName,
            recordDescription: recordDescription,
            recordTimeCreated: recordTimeCreated,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String recordName,
            required String recordDescription,
            required DateTime recordTimeCreated,
          }) =>
              RecordTypeCompanion.insert(
            id: id,
            recordName: recordName,
            recordDescription: recordDescription,
            recordTimeCreated: recordTimeCreated,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecordTypeTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({expensesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (expensesTableRefs) db.expensesTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expensesTableRefs)
                    await $_getPrefetchedData<RecordTypeData, $RecordTypeTable,
                            ExpensesTableData>(
                        currentTable: table,
                        referencedTable: $$RecordTypeTableReferences
                            ._expensesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecordTypeTableReferences(db, table, p0)
                                .expensesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.ofRecordTypeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RecordTypeTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $RecordTypeTable,
    RecordTypeData,
    $$RecordTypeTableFilterComposer,
    $$RecordTypeTableOrderingComposer,
    $$RecordTypeTableAnnotationComposer,
    $$RecordTypeTableCreateCompanionBuilder,
    $$RecordTypeTableUpdateCompanionBuilder,
    (RecordTypeData, $$RecordTypeTableReferences),
    RecordTypeData,
    PrefetchHooks Function({bool expensesTableRefs})>;
typedef $$ExpensesTableTableCreateCompanionBuilder = ExpensesTableCompanion
    Function({
  Value<int> id,
  required String expensesName,
  required String expensesCategory,
  required double expensesAmount,
  Value<String?> expensesDescription,
  required DateTime expensesDate,
  Value<int?> ofRecordTypeId,
});
typedef $$ExpensesTableTableUpdateCompanionBuilder = ExpensesTableCompanion
    Function({
  Value<int> id,
  Value<String> expensesName,
  Value<String> expensesCategory,
  Value<double> expensesAmount,
  Value<String?> expensesDescription,
  Value<DateTime> expensesDate,
  Value<int?> ofRecordTypeId,
});

final class $$ExpensesTableTableReferences
    extends BaseReferences<_$AppDb, $ExpensesTableTable, ExpensesTableData> {
  $$ExpensesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RecordTypeTable _ofRecordTypeIdTable(_$AppDb db) =>
      db.recordType.createAlias($_aliasNameGenerator(
          db.expensesTable.ofRecordTypeId, db.recordType.id));

  $$RecordTypeTableProcessedTableManager? get ofRecordTypeId {
    final $_column = $_itemColumn<int>('of_record_type_id');
    if ($_column == null) return null;
    final manager = $$RecordTypeTableTableManager($_db, $_db.recordType)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ofRecordTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExpensesTableTableFilterComposer
    extends Composer<_$AppDb, $ExpensesTableTable> {
  $$ExpensesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
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

  $$RecordTypeTableFilterComposer get ofRecordTypeId {
    final $$RecordTypeTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ofRecordTypeId,
        referencedTable: $db.recordType,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordTypeTableFilterComposer(
              $db: $db,
              $table: $db.recordType,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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
  ColumnOrderings<int> get id => $composableBuilder(
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

  $$RecordTypeTableOrderingComposer get ofRecordTypeId {
    final $$RecordTypeTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ofRecordTypeId,
        referencedTable: $db.recordType,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordTypeTableOrderingComposer(
              $db: $db,
              $table: $db.recordType,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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
  GeneratedColumn<int> get id =>
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

  $$RecordTypeTableAnnotationComposer get ofRecordTypeId {
    final $$RecordTypeTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ofRecordTypeId,
        referencedTable: $db.recordType,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordTypeTableAnnotationComposer(
              $db: $db,
              $table: $db.recordType,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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
    (ExpensesTableData, $$ExpensesTableTableReferences),
    ExpensesTableData,
    PrefetchHooks Function({bool ofRecordTypeId})> {
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
            Value<int> id = const Value.absent(),
            Value<String> expensesName = const Value.absent(),
            Value<String> expensesCategory = const Value.absent(),
            Value<double> expensesAmount = const Value.absent(),
            Value<String?> expensesDescription = const Value.absent(),
            Value<DateTime> expensesDate = const Value.absent(),
            Value<int?> ofRecordTypeId = const Value.absent(),
          }) =>
              ExpensesTableCompanion(
            id: id,
            expensesName: expensesName,
            expensesCategory: expensesCategory,
            expensesAmount: expensesAmount,
            expensesDescription: expensesDescription,
            expensesDate: expensesDate,
            ofRecordTypeId: ofRecordTypeId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String expensesName,
            required String expensesCategory,
            required double expensesAmount,
            Value<String?> expensesDescription = const Value.absent(),
            required DateTime expensesDate,
            Value<int?> ofRecordTypeId = const Value.absent(),
          }) =>
              ExpensesTableCompanion.insert(
            id: id,
            expensesName: expensesName,
            expensesCategory: expensesCategory,
            expensesAmount: expensesAmount,
            expensesDescription: expensesDescription,
            expensesDate: expensesDate,
            ofRecordTypeId: ofRecordTypeId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExpensesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({ofRecordTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (ofRecordTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ofRecordTypeId,
                    referencedTable:
                        $$ExpensesTableTableReferences._ofRecordTypeIdTable(db),
                    referencedColumn: $$ExpensesTableTableReferences
                        ._ofRecordTypeIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
    (ExpensesTableData, $$ExpensesTableTableReferences),
    ExpensesTableData,
    PrefetchHooks Function({bool ofRecordTypeId})>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$RecordTypeTableTableManager get recordType =>
      $$RecordTypeTableTableManager(_db, _db.recordType);
  $$ExpensesTableTableTableManager get expensesTable =>
      $$ExpensesTableTableTableManager(_db, _db.expensesTable);
}
