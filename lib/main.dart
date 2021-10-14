import 'package:flutter/material.dart';
import 'package:hometech_app/constants.dart';
import 'package:hometech_app/screens/welcome/welcome_screen.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hometech',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(bodyText1: TextStyle(color: textColor)),
        ),
        initialRoute: WelcomeScreen.routeName,
        routes: routes);
  }
}
