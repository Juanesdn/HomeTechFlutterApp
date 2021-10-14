import 'package:flutter/material.dart';
import 'package:hometech_app/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
                width: (MediaQuery.of(context).size.width) / 2,
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xF6F7FA)),
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Empecemos aquí",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 34,
                              color: Color(0x000000),
                              letterSpacing: -0.41,
                              fontFamily: "Roboto"),
                        ),
                        Text(
                          "Registrate para empezar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(0x7A7A7A),
                              letterSpacing: -0.41,
                              fontFamily: "Roboto"),
                        ),
                        TextFormField(
                            maxLines: 1,
                            style: TextStyle(
                              foreground: null,
                              color: Color(0x2B2B2B),
                            ),
                            decoration: InputDecoration(
                              fillColor: Color(0xF0F0F0),
                              filled: true,
                              labelText: "Fullname",
                            )),
                        TextFormField(
                            maxLines: 1,
                            style: TextStyle(
                              foreground: null,
                              color: Color(0x2B2B2B),
                            ),
                            decoration: InputDecoration(
                              fillColor: Color(0xF0F0F0),
                              filled: true,
                              labelText: "Email",
                            )),
                        TextFormField(
                            maxLines: 1,
                            style: TextStyle(
                              foreground: null,
                              color: Color(0x2B2B2B),
                            ),
                            decoration: InputDecoration(
                              fillColor: Color(0xF0F0F0),
                              filled: true,
                              labelText: "Password",
                            )),
                      ],
                    )))));
  }
}
