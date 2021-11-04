import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hometech_app/screens/login/login_screen.dart';
import 'package:hometech_app/screens/welcome/welcome_screen.dart';
import 'package:hometech_app/widgets/error_alert.dart';
import 'package:provider/provider.dart';
import 'package:hometech_app/widgets/authentication_wrapper.dart';

import 'routes.dart';
import 'services/authentication_service.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          return const ErrorAlert();
        } else if (snapshot.hasData) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<AuthenticationService>.value(
                    value: AuthenticationService()),
                StreamProvider(
                  create: (context) =>
                      context.read<AuthenticationService>().authState,
                  initialData: null,
                ),
              ],
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Hometech',
                  theme: theme(),
                  home: const AuthenticationWrapper(),
                  routes: routes));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
