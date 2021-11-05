import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hometech_app/screens/admin/welcome_admin/welcome_admin_screen.dart';
import 'package:hometech_app/screens/homepage/homepage.dart';
import 'package:hometech_app/screens/login/login_screen.dart';
import 'package:hometech_app/screens/technicians/technicians_screen.dart';

class AuthenticationService with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = "";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String _typeOfUser = "";

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  Stream<User?> get authState => firebaseAuth.authStateChanges();

  void setLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<String> getUserType(firebaseUser) async {
    Map<String, dynamic>? user = await FirebaseFirestore.instance
        .collection("Users")
        .doc(firebaseUser.uid.toString())
        .get()
        .then((value) => value.data());

    return user?["type"] ?? "";
  }

  Future signOut(BuildContext context) async {
    await firebaseAuth.signOut();
    Navigator.popAndPushNamed(context, LoginScreen.routeName);
    notifyListeners();
  }

  Future signIn(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      UserCredential auth = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = auth.user;

      Future<String> userType = getUserType(user);
      setLoading(false);
      await userType.then((value) => _typeOfUser = value);

      if (_typeOfUser == "client") {
        Navigator.popAndPushNamed(context, HomePage.routeName);
      } else if (_typeOfUser == "admin") {
        Navigator.popAndPushNamed(context, WelcomeAdminScreen.routeName);
      } else if (_typeOfUser == "technician") {
        Navigator.popAndPushNamed(context, TechniciansScreen.routeName);
      }
      return user;
    } on SocketException {
      setLoading(false);
      setErrorMessage("No internet connection, please connect to internet");
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      setErrorMessage(e.message);
    }
    notifyListeners();
  }

  Future signUp(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      UserCredential auth = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = auth.user;
      Future<String> userType = getUserType(user);

      setLoading(false);

      await userType.then((value) => _typeOfUser = value);
      if (_typeOfUser == "client") {
        Navigator.popAndPushNamed(context, HomePage.routeName);
      } else if (_typeOfUser == "admin") {
        Navigator.popAndPushNamed(context, WelcomeAdminScreen.routeName);
      } else if (_typeOfUser == "technician") {
        Navigator.popAndPushNamed(context, TechniciansScreen.routeName);
      }
      return user;
    } on SocketException {
      setLoading(false);
      setErrorMessage("No internet connection, please connect to internet");
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      setErrorMessage(e.message);
    }
    notifyListeners();
  }
}
