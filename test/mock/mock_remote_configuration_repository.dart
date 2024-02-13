import 'package:flutter_flavors/repositories/remote_config_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<RemoteConfigRepository>()])
import 'mock_remote_configuration_repository.mocks.dart';

RemoteConfigRepository createMockRemoteConfigRepository({
  bool defaultShowDaysView = false,
}) {
  final mock = MockRemoteConfigRepository();

  bool showDaysView = defaultShowDaysView;

  when(mock.showDaysView).thenAnswer((realInvocation) {
    return showDaysView;
  });

  when(mock.configure()).thenAnswer((realInvocation) async {
    return;
  });

  return mock;
}
