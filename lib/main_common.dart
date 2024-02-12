
import 'package:flutter/material.dart';
import 'package:flutter_flavors/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void mainCommon(Future Function() init) async {
  final WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await init();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}
