import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavors/app.dart';
import 'package:flutter_flavors/common/event_with_label/events_with_label_cubit.dart';
import 'package:flutter_flavors/database/repositories/events_with_label_repository.dart';
import 'package:flutter_flavors/repositories/remote_config_repository.dart';

import 'mock/mock_event_with_label_repository.dart';
import 'mock/mock_remote_configuration_repository.dart';

Widget createWidgetWithProviders(
  Widget child, {
  EventsWithLabelRepository? eventsRepository,
  RemoteConfigRepository? remoteConfigsRepository,
}) {
  eventsRepository ??= createMockEventWithLabelRepository();
  remoteConfigsRepository ??= createMockRemoteConfigRepository();

  return MultiBlocProvider(
    providers: [
      RepositoryProvider<EventsWithLabelRepository>(
          create: (context) => eventsRepository!),
      RepositoryProvider<RemoteConfigRepository>(
        create: (context) => remoteConfigsRepository!,
      ),
      BlocProvider<EventsWithLabelCubit>(
        create: (context) =>
            EventsWithLabelCubit(repository: eventsRepository!),
      ),
    ],
    child: child,
  );
}
