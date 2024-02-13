import 'package:flutter_flavors/common/event_with_label/event_with_label.dart';
import 'package:flutter_flavors/database/app_database.dart';
import 'package:flutter_flavors/database/repositories/base_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter_flavors/database/repositories/events_with_label_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventsWithLabelRepository>()])
import 'mock_event_with_label_repository.mocks.dart';

EventsWithLabelRepository createMockEventWithLabelRepository() {
  final List<EventWithLabel> database = [];
  int idIncrement = 1;

  final mock = MockEventsWithLabelRepository();

  when(mock.create(any)).thenAnswer((realInvocation) async {
    final domain = realInvocation.positionalArguments[0] as EventWithLabel;
    database.add(
      EventWithLabel(
          id: idIncrement++,
          start: domain.start,
          duration: domain.duration,
          title: domain.title,
          label: domain.label),
    );

    return database.last;
  });

  when(mock.update(any)).thenAnswer((realInvocation) async {
    final domain = realInvocation.positionalArguments[0] as EventWithLabel;
    final index = database.indexWhere((element) => element.id == domain.id);
    if (index == -1) {
      return null;
    }
    database[index] = domain;
    return database[index];
  });

  when(mock.delete(any)).thenAnswer((realInvocation) async {
    final domain = realInvocation.positionalArguments[0] as EventWithLabel;
    final index = database.indexWhere((element) => element.id == domain.id);
    if (index == -1) {
      return null;
    }
    return database.removeAt(index);
  });

  when(mock.get(any)).thenAnswer((realInvocation) async {
    final id = realInvocation.positionalArguments[0] as int;
    return database.firstWhereOrNull((element) => element.id == id);
  });

  when(mock.getAll()).thenAnswer((realInvocation) async {
    return List.from(database);
  });

  return mock;
}
