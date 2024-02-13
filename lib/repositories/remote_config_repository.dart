import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_flavors/utils/white_label_utils.dart';

class RemoteConfigRepository {
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfigRepository({
    required this.remoteConfig,
  });

  static const String _showDaysViewKey = 'show_days_view';

  bool get showDaysView => remoteConfig.getBool(_showDaysViewKey);

  Future<void> configure() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    switch (WhiteLabelUtils.getWhiteLabelType()) {
      case WhiteLabelType.devApp:
        await remoteConfig.setDefaults({
          _showDaysViewKey: true,
        });
        break;
      case WhiteLabelType.application1:
        await remoteConfig.setDefaults({
          _showDaysViewKey: false,
        });
        break;
      case WhiteLabelType.application2:
        await remoteConfig.setDefaults({
          _showDaysViewKey: true,
        });
        break;
    }

    await remoteConfig.fetchAndActivate();
  }

  String getWelcomeMessage() {
    return remoteConfig.getString('welcome_message');
  }
}
