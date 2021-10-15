import 'package:flutter/material.dart';
import 'package:hometech_app/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  passwordIconButton() => IconButton(
        color: primaryColor,
        icon: _isPasswordVisible
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off),
        onPressed: () =>
            setState(() => _isPasswordVisible = !_isPasswordVisible),
      );

  defaultInputDecoration(String label) => InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        fillColor: Color(0xFFF0F0F0),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: primaryColor),
        ),
        labelStyle: TextStyle(color: Color(0xFFAEAEB2)),
        labelText: label,
        suffixIcon:
            label == "Password" ? passwordIconButton() : SizedBox.shrink(),
      );

  fullnameTextFormField() => TextFormField(
        maxLines: 1,
        style: TextStyle(
          foreground: null,
          color: Color(0xFF2B2B2B),
        ),
        decoration: defaultInputDecoration("Fullname"),
      );

  emailTextFormField() => TextFormField(
        maxLines: 1,
        style: TextStyle(
          foreground: null,
          color: Color(0xFF2B2B2B),
        ),
        decoration: defaultInputDecoration("Email"),
      );

  passwordTextFormField() => TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: !_isPasswordVisible,
        maxLines: 1,
        style: TextStyle(
          foreground: null,
          color: Color(0xFF2B2B2B),
        ),
        decoration: defaultInputDecoration("Password"),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
                width: (MediaQuery.of(context).size.width) / 2,
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFF6F7FA)),
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Empecemos aquí",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: "Roboto",
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.41,
                          ),
                        ),
                        Text(
                          "Registrate para empezar",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF7A7A7A),
                            fontFamily: "Roboto",
                            fontSize: 17,
                            letterSpacing: -0.41,
                          ),
                        ),
                        fullnameTextFormField(),
                        emailTextFormField(),
                        passwordTextFormField(),
                      ],
                    )))));
  }
}
