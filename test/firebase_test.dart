import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hometech_app/main.dart';

import './mock.dart'; // from: https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_auth/firebase_auth/test/mock.dart

import '../lib/main.dart';
import '../lib/screens/login/login_screen.dart';
import '../lib/screens/login/widgets/body.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Instance firebase', (WidgetTester tester) async {
    final Body authService = Body();
    // Tests to write
  });
}
