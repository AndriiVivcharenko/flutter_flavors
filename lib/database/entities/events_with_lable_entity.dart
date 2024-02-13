import 'package:drift/drift.dart';
import 'package:flutter_flavors/database/entities/base_entity.dart';

class EventWithLabelEntity extends BaseEntity {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get start => dateTime()();

  IntColumn get durationMs => integer()();

  TextColumn get title => text()();

  IntColumn get labelIndex => integer()();
}
