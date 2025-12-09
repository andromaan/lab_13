import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lab_13/lib/main_dev.dart';

void main() {
  testWidgets('App renders dev environment', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Dev Environment'), findsOneWidget);
  });
}
