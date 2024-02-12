import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flavors/utils/white_label_utils.dart';
import 'firebase_options_dev.dart' as dev;
import 'firebase_options_app1.dart' as app1;
import 'firebase_options_app2.dart' as app2;

abstract class FirebaseOptionsFactory {
  FirebaseOptions get options;

  factory FirebaseOptionsFactory() {
    switch (WhiteLabelUtils.getWhiteLabelType()) {
      case WhiteLabelType.application1:
        return _FirebaseOptionsFactoryApp1();
      case WhiteLabelType.application2:
        return _FirebaseOptionsFactoryApp2();
      case WhiteLabelType.devApp:
        return _FirebaseOptionsFactoryDev();
      default:
        throw UnsupportedError('Unsupported white label type');
    }
  }
}

class _FirebaseOptionsFactoryApp1 implements FirebaseOptionsFactory {
  @override
  FirebaseOptions get options => app1.DefaultFirebaseOptions.currentPlatform;
}

class _FirebaseOptionsFactoryApp2 implements FirebaseOptionsFactory {
  @override
  FirebaseOptions get options => app2.DefaultFirebaseOptions.currentPlatform;
}

class _FirebaseOptionsFactoryDev implements FirebaseOptionsFactory {
  @override
  FirebaseOptions get options => dev.DefaultFirebaseOptions.currentPlatform;
}
