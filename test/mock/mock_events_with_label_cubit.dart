import 'package:flutter_flavors/common/event_with_label/events_with_label_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'mock_event_with_label_repository.dart';

@GenerateNiceMocks([MockSpec<EventsWithLabelCubit>()])
import 'mock_events_with_label_cubit.mocks.dart';

EventsWithLabelCubit createMockEventsWithLabelCubit() {
  final mock = MockEventsWithLabelCubit();

  final repository = createMockEventWithLabelRepository();

  EventsWithLabelState currentState = EventsWithLabelInitial();

  when(mock.init()).thenAnswer((realInvocation) async {
    final events = await repository.getAll();
    currentState = EventsWithLabelInitialized(events: events);
  });

  when(mock.state).thenAnswer((realInvocation) {
    return currentState;
  });

  when(mock.repository).thenReturn(repository);

  when(mock.addEvent(any)).thenAnswer((realInvocation) async {
    await repository.create(realInvocation.positionalArguments[0]);
    final events = await repository.getAll();
    currentState = EventsWithLabelInitialized(events: events);
  });

  when(mock.updateEvent(any)).thenAnswer((realInvocation) async {
    await repository.update(realInvocation.positionalArguments[0]);
    final events = await repository.getAll();
    currentState = EventsWithLabelInitialized(events: events);
  });

  when(mock.deleteEvent(any)).thenAnswer((realInvocation) async {
    await repository.delete(realInvocation.positionalArguments[0]);
    final events = await repository.getAll();
    currentState = EventsWithLabelInitialized(events: events);
  });

  return mock;
}
