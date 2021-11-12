import 'package:flutter/material.dart';
import 'package:hometech_app/size_config.dart';
import 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: FutureBuilder<String>(
        builder: (context, AsyncSnapshot<String> snapshot) {
          Widget hijo;
          hijo = const Body();
          return SafeArea(
            child: hijo,
          );
        },
      ),
      key: Key("loginScaffold"),
    );
  }

  AppBar buildAppBar() => AppBar(
        title: const Text("Iniciar Sesión"),
      );
}
