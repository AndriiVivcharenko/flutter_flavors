// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EventWithLabelEntityTable extends EventWithLabelEntity
    with TableInfo<$EventWithLabelEntityTable, EventWithLabelEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventWithLabelEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _durationMsMeta =
      const VerificationMeta('durationMs');
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
      'duration_ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _labelIndexMeta =
      const VerificationMeta('labelIndex');
  @override
  late final GeneratedColumn<int> labelIndex = GeneratedColumn<int>(
      'label_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, start, durationMs, title, labelIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_with_label_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<EventWithLabelEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
          _durationMsMeta,
          durationMs.isAcceptableOrUnknown(
              data['duration_ms']!, _durationMsMeta));
    } else if (isInserting) {
      context.missing(_durationMsMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('label_index')) {
      context.handle(
          _labelIndexMeta,
          labelIndex.isAcceptableOrUnknown(
              data['label_index']!, _labelIndexMeta));
    } else if (isInserting) {
      context.missing(_labelIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventWithLabelEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventWithLabelEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start'])!,
      durationMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_ms'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      labelIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}label_index'])!,
    );
  }

  @override
  $EventWithLabelEntityTable createAlias(String alias) {
    return $EventWithLabelEntityTable(attachedDatabase, alias);
  }
}

class EventWithLabelEntityData extends DataClass
    implements Insertable<EventWithLabelEntityData> {
  final int id;
  final DateTime start;
  final int durationMs;
  final String title;
  final int labelIndex;
  const EventWithLabelEntityData(
      {required this.id,
      required this.start,
      required this.durationMs,
      required this.title,
      required this.labelIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start'] = Variable<DateTime>(start);
    map['duration_ms'] = Variable<int>(durationMs);
    map['title'] = Variable<String>(title);
    map['label_index'] = Variable<int>(labelIndex);
    return map;
  }

  EventWithLabelEntityCompanion toCompanion(bool nullToAbsent) {
    return EventWithLabelEntityCompanion(
      id: Value(id),
      start: Value(start),
      durationMs: Value(durationMs),
      title: Value(title),
      labelIndex: Value(labelIndex),
    );
  }

  factory EventWithLabelEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventWithLabelEntityData(
      id: serializer.fromJson<int>(json['id']),
      start: serializer.fromJson<DateTime>(json['start']),
      durationMs: serializer.fromJson<int>(json['durationMs']),
      title: serializer.fromJson<String>(json['title']),
      labelIndex: serializer.fromJson<int>(json['labelIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'start': serializer.toJson<DateTime>(start),
      'durationMs': serializer.toJson<int>(durationMs),
      'title': serializer.toJson<String>(title),
      'labelIndex': serializer.toJson<int>(labelIndex),
    };
  }

  EventWithLabelEntityData copyWith(
          {int? id,
          DateTime? start,
          int? durationMs,
          String? title,
          int? labelIndex}) =>
      EventWithLabelEntityData(
        id: id ?? this.id,
        start: start ?? this.start,
        durationMs: durationMs ?? this.durationMs,
        title: title ?? this.title,
        labelIndex: labelIndex ?? this.labelIndex,
      );
  @override
  String toString() {
    return (StringBuffer('EventWithLabelEntityData(')
          ..write('id: $id, ')
          ..write('start: $start, ')
          ..write('durationMs: $durationMs, ')
          ..write('title: $title, ')
          ..write('labelIndex: $labelIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, start, durationMs, title, labelIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventWithLabelEntityData &&
          other.id == this.id &&
          other.start == this.start &&
          other.durationMs == this.durationMs &&
          other.title == this.title &&
          other.labelIndex == this.labelIndex);
}

class EventWithLabelEntityCompanion
    extends UpdateCompanion<EventWithLabelEntityData> {
  final Value<int> id;
  final Value<DateTime> start;
  final Value<int> durationMs;
  final Value<String> title;
  final Value<int> labelIndex;
  const EventWithLabelEntityCompanion({
    this.id = const Value.absent(),
    this.start = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.title = const Value.absent(),
    this.labelIndex = const Value.absent(),
  });
  EventWithLabelEntityCompanion.insert({
    this.id = const Value.absent(),
    required DateTime start,
    required int durationMs,
    required String title,
    required int labelIndex,
  })  : start = Value(start),
        durationMs = Value(durationMs),
        title = Value(title),
        labelIndex = Value(labelIndex);
  static Insertable<EventWithLabelEntityData> custom({
    Expression<int>? id,
    Expression<DateTime>? start,
    Expression<int>? durationMs,
    Expression<String>? title,
    Expression<int>? labelIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (start != null) 'start': start,
      if (durationMs != null) 'duration_ms': durationMs,
      if (title != null) 'title': title,
      if (labelIndex != null) 'label_index': labelIndex,
    });
  }

  EventWithLabelEntityCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? start,
      Value<int>? durationMs,
      Value<String>? title,
      Value<int>? labelIndex}) {
    return EventWithLabelEntityCompanion(
      id: id ?? this.id,
      start: start ?? this.start,
      durationMs: durationMs ?? this.durationMs,
      title: title ?? this.title,
      labelIndex: labelIndex ?? this.labelIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (labelIndex.present) {
      map['label_index'] = Variable<int>(labelIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventWithLabelEntityCompanion(')
          ..write('id: $id, ')
          ..write('start: $start, ')
          ..write('durationMs: $durationMs, ')
          ..write('title: $title, ')
          ..write('labelIndex: $labelIndex')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $EventWithLabelEntityTable eventWithLabelEntity =
      $EventWithLabelEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [eventWithLabelEntity];
}
