import 'package:flutter/material.dart';
import 'package:hometech_app/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('test',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  )),
            ),
            body: Center(child: LoginScreen())));
  }
}
