import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometech_app/controller/auth_controller.dart';
import 'package:hometech_app/screens/welcome/welcome_screen.dart';

import 'controller/request_controller.dart';
import 'routes.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => RequestController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _firebaseInit = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInit,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("There was an error loading the app");
        } else if (snapshot.hasData) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Hometech',
            theme: theme(),
            home: WelcomeScreen(),
            routes: routes,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
