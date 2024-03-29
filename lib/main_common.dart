import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavors/app.dart';
import 'package:flutter_flavors/database/app_database.dart';
import 'package:flutter_flavors/database/repositories/events_with_label_repository.dart';
import 'package:flutter_flavors/repositories/remote_config_repository.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void mainCommon(Future Function() init) async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await init();

  final remoteConfigsRepository =
      RemoteConfigRepository(remoteConfig: FirebaseRemoteConfig.instance);
  await remoteConfigsRepository.configure();

  FlutterNativeSplash.remove();

  runApp(
    MultiBlocProvider(
      providers: [
        RepositoryProvider<RemoteConfigRepository>(
          create: (context) => remoteConfigsRepository,
        ),
        RepositoryProvider<AppDatabase>(
          create: (context) => AppDatabase(),
          lazy: false,
        ),
        RepositoryProvider<EventsWithLabelRepository>(
          create: (context) => EventsWithLabelRepository(
            database: context.read<AppDatabase>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
