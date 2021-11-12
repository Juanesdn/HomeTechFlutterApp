import 'package:flutter/material.dart';

import 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: const Body());
  }

  AppBar buildAppBar() => AppBar(title: const Text("Iniciar Sesión"));
}
