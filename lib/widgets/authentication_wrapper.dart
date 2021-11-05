import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hometech_app/screens/admin/welcome_admin/welcome_admin_screen.dart';
import 'package:hometech_app/screens/homepage/homepage.dart';
import 'package:hometech_app/screens/login/login_screen.dart';
import 'package:hometech_app/screens/technicians/technicians_screen.dart';
import 'package:hometech_app/screens/welcome/welcome_screen.dart';
import 'package:provider/src/provider.dart';

import '../size_config.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  String _typeOfUser = "";

  Future<String> getUserType(firebaseUser) async {
    Map<String, dynamic>? user = await FirebaseFirestore.instance
        .collection("Users")
        .doc(firebaseUser.uid.toString())
        .get()
        .then((value) => value.data());

    return user?["type"] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    print("firebase user $firebaseUser");

    if (firebaseUser != null) {
      Future<String> userType = getUserType(firebaseUser);
      userType.then((value) => _typeOfUser = value);
      if (_typeOfUser == "client") {
        return const HomePage();
      } else if (_typeOfUser == "admin") {
        return const WelcomeAdminScreen();
      } else if (_typeOfUser == "technician") {
        return TechniciansScreen();
      }
    }
    return const WelcomeScreen();
  }
}
