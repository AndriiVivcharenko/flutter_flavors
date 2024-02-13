import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavors/app.dart';
import 'package:flutter_flavors/common/event_with_label/event_label.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common_tests.dart';

void main() {
  testWidgets('Test app flavor app1', (widgetTester) async {
    expect(appFlavor, 'app1');
  });

  testWidgets('Test label dropdown is not preset', (widgetTester) async {
    await widgetTester.pumpWidget(createWidgetWithProviders(const MyApp()));
    await widgetTester.pumpAndSettle();

    final byIcon = find.byIcon(Icons.add_outlined);
    expect(byIcon, findsOneWidget);

    await widgetTester.tap(byIcon);

    await widgetTester.pumpAndSettle();

    final dropdown = find.byType(DropdownButton<EventLabel>);

    expect(dropdown, findsNothing);
  });
}
