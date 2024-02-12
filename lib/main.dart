import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavors/app.dart';
import 'package:flutter_flavors/pages/home_page.dart';
import 'package:flutter_flavors/utils/white_label_utils.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_flavors/firebase_options_factory.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: FirebaseOptionsFactory().options,
  );

  FlutterNativeSplash.remove();
  runApp(const MyApp());
}
