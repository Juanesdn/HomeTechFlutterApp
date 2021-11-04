import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hometech_app/screens/homepage/homepage.dart';
import 'package:hometech_app/screens/login/login_screen.dart';
import 'package:hometech_app/screens/welcome/welcome_screen.dart';
import 'package:provider/src/provider.dart';

import '../size_config.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    print("firebase user $firebaseUser");

    if (firebaseUser != null) {
      return const HomePage();
    }
    return const WelcomeScreen();
  }
}
