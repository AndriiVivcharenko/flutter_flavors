import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_customizable_calendar/flutter_customizable_calendar.dart';
import 'package:flutter_flavors/common/event_with_label/event_with_label.dart';
import 'package:flutter_flavors/database/repositories/events_with_label_repository.dart';
import 'package:meta/meta.dart';

part 'events_with_label_state.dart';

class EventsWithLabelCubit extends Cubit<EventsWithLabelState> {
  EventsWithLabelCubit({
    required this.repository,
  }) : super(EventsWithLabelInitial());

  final EventsWithLabelRepository repository;

  Future<void> init() async {
    emit(EventsWithLabelLoading());

    final List<FloatingCalendarEvent> events =
        (await repository.getAll()) ?? [];

    emit(EventsWithLabelInitialized(events: events));
  }

  void updateEvent(FloatingCalendarEvent value) async {
    final state = this.state;
    if (state is EventsWithLabelInitialized) {
      final events = state.events;
      events.removeWhere((element) => element.id == value.id);
      await repository.update(value as EventWithLabel);

      emit(EventsWithLabelInitialized(events: [
        ...events,
        value,
      ]));
    }
  }

  void addEvent(FloatingCalendarEvent value) async {
    final state = this.state;
    if (state is EventsWithLabelInitialized) {
      final events = state.events;
      events.add(value);
      await repository.create(value as EventWithLabel);
      emit(EventsWithLabelInitialized(events: events));
    }
  }
}
