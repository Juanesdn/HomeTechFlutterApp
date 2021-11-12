// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hometech_app/main.dart';

import 'package:get/get.dart';
import '../lib/screens/login/login_screen.dart';
import '../lib/screens/login/widgets/body.dart';

void main() {
  testWidgets('login found', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(
      GetMaterialApp(
        home: LoginScreen(),
      ),
    );

    await tester.pump();

    expect(find.byKey(Key('loginScaffold')), findsOneWidget);
  });
}
