import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometech_app/controller/auth_controller.dart';
import 'package:hometech_app/widgets/custom_icon.dart';
import 'package:hometech_app/widgets/default_button.dart';
import 'package:hometech_app/widgets/form_errors.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];
  final _authController = Get.find<AuthController>();

  void loginUser() {
    _authController.login();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(height: 20),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(children: const [
            Text("¿Olvidaste tu contraseña?",
                style: TextStyle(decoration: TextDecoration.underline))
          ]),
          FormErrors(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
              text: "Iniciar Sesión",
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  loginUser();
                }
              },
              color: Colors.white)
        ]));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        controller: _authController.password,
        obscureText: true,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(emptyPasswordError)) {
            setState(() {
              errors.remove(emptyPasswordError);
            });
          } else if (value.length >= 8 &&
              errors.contains(invalidPasswordError)) {
            setState(() {
              errors.remove(invalidPasswordError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(emptyPasswordError)) {
            setState(() {
              errors.add(emptyPasswordError);
            });
          } else if (value.length < 8 &&
              !errors.contains(invalidPasswordError)) {
            setState(() {
              errors.add(invalidPasswordError);
            });
          }
          return null;
        },
        onSaved: (newValue) => _authController.password.text = newValue!,
        decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: "Contraseña",
            hintText: "Ingresa tu contraseña",
            suffixIcon: CustomSuffixIcon(icon: Icon(Icons.lock))));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        controller: _authController.email,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => _authController.email.text = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(emptyEmailError)) {
            setState(() {
              errors.remove(emptyEmailError);
            });
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(invalidEmailError)) {
            setState(() {
              errors.remove(invalidEmailError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(emptyEmailError)) {
            setState(() {
              errors.add(emptyEmailError);
            });
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(invalidEmailError)) {
            setState(() {
              errors.add(invalidEmailError);
            });
          }
          return null;
        },
        decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: "Correo Electrónico",
            hintText: "Ingresa tu correo electrónico",
            suffixIcon: CustomSuffixIcon(icon: Icon(Icons.email))));
  }
}
