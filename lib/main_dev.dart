import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flavors/main_common.dart';

import 'firebase_options_dev.dart';
void main() async {
  mainCommon(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });
}
