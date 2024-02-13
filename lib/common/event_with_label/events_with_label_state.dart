part of 'events_with_label_cubit.dart';

@immutable
abstract class EventsWithLabelState extends Equatable {}

class EventsWithLabelInitial extends EventsWithLabelState {
  @override
  List<Object?> get props => [];
}

class EventsWithLabelLoading extends EventsWithLabelState {
  @override
  List<Object?> get props => [];
}

class EventsWithLabelInitialized extends EventsWithLabelState {
  EventsWithLabelInitialized({
    required this.events,
  });

  final List<FloatingCalendarEvent> events;

  EventsWithLabelInitialized copyWith({
    List<FloatingCalendarEvent>? events,
  }) {
    return EventsWithLabelInitialized(
      events: events ?? this.events,
    );
  }

  @override
  List<Object?> get props => [events];
}
