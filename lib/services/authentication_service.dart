import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hometech_app/screens/homepage/homepage.dart';
import 'package:hometech_app/screens/login/login_screen.dart';

class AuthenticationService with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = "";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
      setLoading(false);
      Navigator.popAndPushNamed(context, HomePage.routeName);
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
      setLoading(false);
      Navigator.popAndPushNamed(context, HomePage.routeName);
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
