import 'package:flutter/services.dart';

enum WhileLabelType {
  devApp,
  application1,
  application2,
}

class WhiteLabelUtils {
  static String getWhiteLabelName(WhileLabelType type) {
    switch (type) {
      case WhileLabelType.application1:
        return 'Application 1';
      case WhileLabelType.application2:
        return 'Application 2';
      default:
        return 'Main App';
    }
  }

  static String getAssetsPath() {
    switch (getWhiteLabelType()) {
      case WhileLabelType.application1:
        return 'assets/app1';
      case WhileLabelType.application2:
        return 'assets/app2';
      case WhileLabelType.devApp:
        return 'assets/dev';
    }
  }

  static WhileLabelType getWhiteLabelType() {
    switch (appFlavor) {
      case 'app1':
        return WhileLabelType.application1;
      case 'app2':
        return WhileLabelType.application2;
      case 'dev':
      default:
        return WhileLabelType.devApp;
    }
  }
}
