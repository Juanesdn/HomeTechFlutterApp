import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometech_app/helpers/showLoading.dart';
import 'package:hometech_app/screens/admin/welcome_admin/welcome_admin_screen.dart';
import 'package:hometech_app/screens/homepage/homepage.dart';
import 'package:hometech_app/screens/login/login_screen.dart';
import 'package:hometech_app/screens/map/map_screen.dart';
import 'package:hometech_app/screens/technicians/technicians_screen.dart';
import 'package:hometech_app/screens/welcome/welcome_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController celular = TextEditingController();
  TextEditingController edad = TextEditingController();
  TextEditingController experiencia = TextEditingController();
  TextEditingController localizacion = TextEditingController();
  TextEditingController acercaDe = TextEditingController();
  TextEditingController puntaje = TextEditingController();
  TextEditingController precioPorHora = TextEditingController();

  late Rx<User?> _user;

  User? get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    _user = Rxn<User>(_auth.currentUser);
    _user.bindStream(_auth.userChanges());
    ever(_user, _setInitialScreen);
  }

  Future<void> _clearTextControllers() async {
    email.clear();
    password.clear();
    fullName.clear();
    celular.clear();
    edad.clear();
    experiencia.clear();
    localizacion.clear();
    acercaDe.clear();
    puntaje.clear();
    precioPorHora.clear();
  }

  void _setInitialScreen(User? user) async {
    if (user != null) {
      String userType = await getUserType(user);
      if (userType == "client") {
        Get.offAll(() => const HomePage());
      } else if (userType == "admin") {
        Get.offAll(() => const WelcomeAdminScreen());
      } else if (userType == "technician") {
        Get.offAll(() => TechniciansScreen(
              category: '',
            ));
      }
    } else {
      Get.offAll(() => const WelcomeScreen());
    }
  }

  Future<String> getUserType(firebaseUser) async {
    Map<String, dynamic>? user = await _db
        .collection("Users")
        .doc(firebaseUser.uid.toString())
        .get()
        .then((value) => value.data());

    return user?["type"] ?? "";
  }

  Future<String> getUserFullname() async {
    Map<String, dynamic>? currUser = await _db
        .collection("Users")
        .doc(user!.uid.toString())
        .get()
        .then((value) => value.data());

    return currUser?["fullname"] ?? "";
  }

  void createUser() async {
    try {
      showLoading();
      await _auth.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());

      await _db.collection("Users").doc(user!.uid.toString()).set({
        "email": email.text.trim(),
        "fullname": fullName.text,
        "type": "client"
      });

      await _clearTextControllers();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error creating account", e.message ?? "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void createTechnician(specialization) async {
    try {
      showLoading();
      await _auth.createUserWithEmailAndPassword(
          email: email.text.trim(), password: "contraseñatecnico");

      await _db.collection("Users").doc(user!.uid.toString()).set({
        "email": email.text.trim(),
        "fullname": fullName.text.trim(),
        "type": "technician",
        "celular": celular.text.trim(),
        "especialidad": specialization,
        "experiencia": experiencia.text.trim(),
        "localizacion": localizacion.text.trim(),
        "acercaDe": acercaDe.text.trim(),
        "puntaje": 0,
        "precioPorHora": precioPorHora.text.trim(),
      });
      await _clearTextControllers();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error creating account", e.message ?? "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void login() async {
    try {
      showLoading();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      await _clearTextControllers();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error logging in", e.message ?? "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error signing out", e.message ?? "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
