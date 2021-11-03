import 'package:flutter/material.dart';
import 'package:hometech_app/screens/login/widgets/sign_form.dart';
import 'package:hometech_app/screens/register/register_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(children: [
            Text(
              "Bienvenido de vuelta",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Inicia sesión con tu correo y contraseña \no utiliza alguna red social",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            const SignForm(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("¿No tienes una cuenta? ",
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(
                    context, RegisterScreen.routeName),
                child: Text("Registrate",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: primaryColor)),
              )
            ])
          ]),
        ),
      ),
    ));
  }
}
