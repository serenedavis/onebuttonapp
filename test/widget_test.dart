import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onebuttonapp/main.dart';

void main() {
  testWidgets('Single button can be pressed without changing the screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);
    expect(tester.widget<ElevatedButton>(button).onPressed, isNotNull);

    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(button, findsOneWidget);
    expect(find.text('Press me'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
