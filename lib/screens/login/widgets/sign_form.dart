import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hometech_app/screens/homepage/homepage.dart';
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
  late String email;
  late String password;
  bool rememberPassword = false;
  final List<String> errors = [];
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() async {
    CollectionReference colRef =
        FirebaseFirestore.instance.collection("usuarios");
    QuerySnapshot users = await colRef.get();
    if (users.docs.length > 0) {
      for (var doc in users.docs) {
        print(doc);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(children: [
            Checkbox(
                value: rememberPassword,
                activeColor: primaryColor,
                onChanged: (value) {
                  setState(() {
                    rememberPassword = value!;
                  });
                }),
            const Text("Recuerdame"),
            const Spacer(),
            const Text("¿Olvidaste tu contraseña?",
                style: TextStyle(decoration: TextDecoration.underline))
          ]),
          FormErrors(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
              text: "Iniciar Sesión",
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
                loginUser();
              },
              color: Colors.white)
        ]));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        controller: passwordController,
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
        onSaved: (newValue) => password = newValue!,
        decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: "Contraseña",
            hintText: "Ingresa tu contraseña",
            suffixIcon: CustomSuffixIcon(icon: Icon(Icons.lock))));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue!,
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
