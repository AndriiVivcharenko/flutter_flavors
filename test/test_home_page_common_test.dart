// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavors/app.dart';
import 'package:flutter_flavors/common/event_with_label/event_label.dart';
import 'package:flutter_flavors/common/event_with_label/event_with_label.dart';
import 'package:flutter_flavors/common/event_with_label/events_with_label_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common_tests.dart';
import 'mock/mock_event_with_label_repository.dart';
import 'mock/mock_remote_configuration_repository.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {});

  blocTest<EventsWithLabelCubit, EventsWithLabelState>(
    'Empty events are initialized',
    build: () =>
        EventsWithLabelCubit(repository: createMockEventWithLabelRepository()),
    act: (bloc) async {
      await bloc.init();
    },
    expect: () => <EventsWithLabelState>[
      EventsWithLabelLoading(),
      EventsWithLabelInitialized(events: const []),
    ],
  );

  final testEvent1 = EventWithLabel(
    id: 1,
    label: EventLabel.family,
    start: DateTime.now(),
    title: 'Test',
    duration: const Duration(minutes: 30),
  );

  final testEvent2 = EventWithLabel(
    id: 2,
    label: EventLabel.work,
    start: DateTime.now(),
    title: 'Test',
    duration: const Duration(minutes: 30),
  );

  blocTest<EventsWithLabelCubit, EventsWithLabelState>(
    'Events are added',
    build: () =>
        EventsWithLabelCubit(repository: createMockEventWithLabelRepository()),
    wait: const Duration(milliseconds: 500),
    act: (bloc) async {
      await bloc.init();
      await bloc.addEvent(testEvent1);
      await bloc.addEvent(testEvent2);
    },
    expect: () => <EventsWithLabelState>[
      EventsWithLabelLoading(),
      EventsWithLabelInitialized(events: [testEvent1, testEvent2]),
    ],
  );

  blocTest<EventsWithLabelCubit, EventsWithLabelState>(
    'Events are deleted',
    build: () =>
        EventsWithLabelCubit(repository: createMockEventWithLabelRepository()),
    wait: const Duration(milliseconds: 500),
    act: (bloc) async {
      await bloc.init();
      await bloc.addEvent(testEvent1);
      await bloc.addEvent(testEvent2);

      await bloc.deleteEvent(testEvent1);
      await bloc.deleteEvent(testEvent2);
    },
    expect: () => <EventsWithLabelState>[
      EventsWithLabelLoading(),
      EventsWithLabelInitialized(events: []),
    ],
  );

  blocTest<EventsWithLabelCubit, EventsWithLabelState>(
    'Events are updated',
    build: () =>
        EventsWithLabelCubit(repository: createMockEventWithLabelRepository()),
    act: (bloc) async {
      await bloc.init();
      await bloc.addEvent(testEvent1);

      final updatedEvent =
          testEvent1.copyWith(duration: const Duration(hours: 2));
      await bloc.updateEvent(updatedEvent);
    },
    wait: const Duration(milliseconds: 500),
    expect: () => <EventsWithLabelState>[
      EventsWithLabelLoading(),
      EventsWithLabelInitialized(events: []),
      EventsWithLabelInitialized(events: [
        testEvent1.copyWith(duration: const Duration(hours: 2)),
      ]),
    ],
  );

  testWidgets('Test add event', (widgetTester) async {
    final eventsRepository = createMockEventWithLabelRepository();

    await widgetTester.pumpWidget(createWidgetWithProviders(const MyApp(),
        eventsRepository: eventsRepository));
    await widgetTester.pumpAndSettle();

    expect(await eventsRepository.getAll(), []);

    final byIcon = find.byIcon(Icons.add_outlined);
    expect(byIcon, findsOneWidget);

    await widgetTester.tap(byIcon);

    await widgetTester.pumpAndSettle();

    final addButton = find.byType(FloatingActionButton);

    expect(addButton, findsOneWidget);
    await widgetTester.tap(addButton);

    await widgetTester.pumpAndSettle();

    expect(await eventsRepository.getAll(), hasLength(1));
  });

  testWidgets('Test days view disabled', (widgetTester) async {
    final eventsRepository = createMockEventWithLabelRepository();
    final remoteConfigsRepository = createMockRemoteConfigRepository(
      defaultShowDaysView: false,
    );

    final testEvent = EventWithLabel(
      id: 1,
      label: EventLabel.family,
      start: DateTime.now(),
      title: 'Test',
      duration: const Duration(minutes: 30),
    );

    eventsRepository.create(testEvent);

    await widgetTester.pumpWidget(createWidgetWithProviders(const MyApp(),
        eventsRepository: eventsRepository,
        remoteConfigsRepository: remoteConfigsRepository));
    await widgetTester.pumpAndSettle();

    final event = find.text(testEvent.title);

    expect(event, findsOneWidget);

    await widgetTester.tapAt(widgetTester.getCenter(event));

    await widgetTester.pumpAndSettle();

    final backButton = find.textContaining("Back");

    expect(backButton, findsNothing);
  });

  testWidgets('Test days view enabled', (widgetTester) async {
    final eventsRepository = createMockEventWithLabelRepository();
    final remoteConfigsRepository = createMockRemoteConfigRepository(
      defaultShowDaysView: true,
    );

    final testEvent = EventWithLabel(
      id: 1,
      label: EventLabel.family,
      start: DateTime.now(),
      title: 'Test',
      duration: const Duration(minutes: 30),
    );

    eventsRepository.create(testEvent);

    await widgetTester.pumpWidget(createWidgetWithProviders(const MyApp(),
        eventsRepository: eventsRepository,
        remoteConfigsRepository: remoteConfigsRepository));
    await widgetTester.pumpAndSettle();

    final event = find.text(testEvent.title);

    expect(event, findsOneWidget);

    await widgetTester.tapAt(widgetTester.getCenter(event));

    await widgetTester.pumpAndSettle();

    final backButton = find.textContaining("Back");

    expect(backButton, findsOneWidget);
  });
}
