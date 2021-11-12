import 'package:flutter/material.dart';
import 'package:hometech_app/screens/login/widgets/sign_form.dart';
import 'package:hometech_app/screens/register/register_screen.dart';
import 'package:get/get.dart';
import 'package:hometech_app/controller/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthController());
    //Firebase.initializeApp();

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (20 / 812.0) * MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Bienvenido de vuelta",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          (28 / 812.0) * MediaQuery.of(context).size.width,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Inicia sesión con tu correo y contraseña \no utiliza alguna red social",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                SignForm(),
                SizedBox(
                  height: (20 / 812.0) * MediaQuery.of(context).size.height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿No tienes una cuenta? ",
                      style: TextStyle(
                        fontSize:
                            (16 / 812.0) * MediaQuery.of(context).size.width,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        RegisterScreen.routeName,
                      ),
                      child: Text("Registrate",
                          style: TextStyle(
                              fontSize: (16 / 812.0) *
                                  MediaQuery.of(context).size.width,
                              color: primaryColor)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
