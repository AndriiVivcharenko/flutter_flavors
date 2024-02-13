import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test app flavor app1', (widgetTester) async {
    expect(appFlavor, 'app1');
  });
}
