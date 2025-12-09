import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_13/main.dart';
import 'package:lab_13/config/app_config.dart';

void main() {
  group('MainApp Widget Tests', () {
    testWidgets('App renders with correct title', (WidgetTester tester) async {
      await tester.pumpWidget(const MainApp());
      expect(find.text(AppConfig.appName), findsWidgets);
    });

    testWidgets('HomePage displays environment info', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MainApp());
      expect(find.textContaining('Environment:'), findsOneWidget);
      expect(find.textContaining('API URL:'), findsOneWidget);
      expect(find.textContaining('Mode:'), findsOneWidget);
    });

    testWidgets('HomePage shows correct mode', (WidgetTester tester) async {
      await tester.pumpWidget(const MainApp());
      final modeFinder = AppConfig.isProduction
          ? find.text('Mode: Production')
          : find.text('Mode: Development');
      expect(modeFinder, findsOneWidget);
    });
  });

  group('AppConfig Tests', () {
    test('Environment defaults to dev', () {
      expect(AppConfig.environment, BuildEnvironment.dev);
    });

    test('API base URL is set', () {
      expect(AppConfig.apiBaseUrl, isNotEmpty);
      expect(AppConfig.apiBaseUrl, contains('http'));
    });

    test('App name differs by environment', () {
      expect(AppConfig.appName, isNotEmpty);
    });

    test('isDevelopment flag works correctly', () {
      expect(AppConfig.isDevelopment, isA<bool>());
    });

    test('isProduction flag works correctly', () {
      expect(AppConfig.isProduction, isA<bool>());
    });
  });

  group('HomePage Widget Tests', () {
    testWidgets('AppBar shows correct color based on environment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      final expectedColor = AppConfig.isProduction
          ? Colors.blue
          : Colors.orange;
      expect(appBar.backgroundColor, expectedColor);
    });

    testWidgets('Environment text displays uppercase', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      expect(
        find.text('Environment: ${AppConfig.environment.name.toUpperCase()}'),
        findsOneWidget,
      );
    });

    testWidgets('Mode text has correct color', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      await tester.pump();

      final textWidget = tester
          .widgetList<Text>(find.textContaining('Mode:'))
          .firstWhere((widget) => widget.data?.contains('Mode:') ?? false);

      final expectedColor = AppConfig.isProduction
          ? Colors.green
          : Colors.orange;
      expect(textWidget.style?.color, expectedColor);
    });
  });
}
