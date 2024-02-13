import 'package:flutter/services.dart';

enum WhiteLabelType {
  devApp,
  application1,
  application2,
}

class WhiteLabelUtils {
  static String getWhiteLabelName(WhiteLabelType type) {
    switch (type) {
      case WhiteLabelType.application1:
        return 'Application 1';
      case WhiteLabelType.application2:
        return 'Application 2';
      default:
        return 'Main App';
    }
  }

  static String getAssetsPath() {
    switch (getWhiteLabelType()) {
      case WhiteLabelType.application1:
        return 'assets/app1';
      case WhiteLabelType.application2:
        return 'assets/app2';
      case WhiteLabelType.devApp:
        return 'assets/dev';
    }
  }

  static WhiteLabelType getWhiteLabelType() {
    switch (appFlavor) {
      case 'app1':
        return WhiteLabelType.application1;
      case 'app2':
        return WhiteLabelType.application2;
      case 'dev':
      default:
        return WhiteLabelType.devApp;
    }
  }

  static String getBackendUrl() {
    switch (getWhiteLabelType()) {
      case WhiteLabelType.application1:
        return 'https://app1.example.com';
      case WhiteLabelType.application2:
        return 'https://app2.example.com';
      case WhiteLabelType.devApp:
        return 'http://localhost:3000';
    }
  }

}
