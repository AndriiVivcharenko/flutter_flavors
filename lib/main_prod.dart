
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flavors/main_common.dart';
import 'package:flutter_flavors/firebase_options_factory.dart';
void main() {
  mainCommon(() async {
    await Firebase.initializeApp(
      options: FirebaseOptionsFactory().options,
    );
  });
}
