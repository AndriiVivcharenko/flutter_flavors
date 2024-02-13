import 'package:drift/drift.dart';
import 'package:flutter_customizable_calendar/flutter_customizable_calendar.dart';
import 'package:flutter_flavors/common/event_with_label/event_label.dart';
import 'package:flutter_flavors/database/app_database.dart';

class EventWithLabel extends EditableCalendarEvent {
  const EventWithLabel(
      {required super.id,
      required super.start,
      required super.duration,
      required this.title,
      required this.label});

  final String title;
  final EventLabel label;

  @override
  EditableCalendarEvent copyWith({DateTime? start, Duration? duration}) {
    return EventWithLabel(
      id: id,
      start: start ?? this.start,
      duration: duration ?? this.duration,
      label: label,
      title: title,
    );
  }

  factory EventWithLabel.fromDrift(EventWithLabelEntityData entity) {
    return EventWithLabel(
      id: entity.id,
      start: entity.start,
      duration: Duration(milliseconds: entity.durationMs),
      title: entity.title,
      label: EventLabel.values[entity.labelIndex],
    );
  }

  EventWithLabelEntityCompanion toDrift({
    bool update = false,
    bool create = false,
  }) {
    if (create) {
      return EventWithLabelEntityCompanion.insert(
        start: start,
        durationMs: duration.inMilliseconds,
        title: title,
        labelIndex: label.index,
      );
    } else if (update) {
      return EventWithLabelEntityCompanion(
        id: Value(id as int),
        start: Value(start),
        durationMs: Value(duration.inMilliseconds),
        title: Value(title),
        labelIndex: Value(label.index),
        // createdAt: Value(DateTime.now()),
        // updatedAt: Value(DateTime.now()),
      );
    } else {
      throw Exception('You must specify either update or create');
    }
  }


}
