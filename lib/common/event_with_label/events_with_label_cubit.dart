import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_customizable_calendar/flutter_customizable_calendar.dart';
import 'package:meta/meta.dart';

part 'events_with_label_state.dart';

class EventsWithLabelCubit extends Cubit<EventsWithLabelState> {
  EventsWithLabelCubit() : super(EventsWithLabelInitial());

  void init() {
    final List<FloatingCalendarEvent> events = [];

    emit(EventsWithLabelInitialized(events: events));
  }

  void updateEvent(FloatingCalendarEvent value) {
    final state = this.state;
    if (state is EventsWithLabelInitialized) {
      final events = state.events;
      events.removeWhere((element) => element.id == value.id);

      emit(EventsWithLabelInitialized(events: [
        ...events,
        value,
      ]));
    }
  }

  void addEvent(FloatingCalendarEvent value) {
    final state = this.state;
    if (state is EventsWithLabelInitialized) {
      final events = state.events;
      events.add(value);
      emit(EventsWithLabelInitialized(events: events));
    }
  }
}
