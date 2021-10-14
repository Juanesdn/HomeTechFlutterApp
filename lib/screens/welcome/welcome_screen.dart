import 'package:flutter/material.dart';
import 'package:hometech_app/screens/welcome/widgets/body.dart';
import 'package:hometech_app/size_config.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcome";

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(key: Key("BodyWelcome")),
    );
  }
}
