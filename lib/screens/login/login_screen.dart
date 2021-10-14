import 'package:flutter/material.dart';

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
            height: (MediaQuery.of(context).size.height),
            width: MediaQuery.of(context).size.width,
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Empecemos aquí",
                  style: TextStyle(
                      fontSize: 34,
                      color: Color(0x2B2B2B),
                      letterSpacing: -0.41,
                      fontFamily: "Roboto"),
                ),
                Text(
                  "Registrate para empezar",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0x7A7A7A),
                      letterSpacing: -0.41,
                      fontFamily: "Roboto"),
                ),
                TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Fullname",
                      border: InputBorder.none,
                    )),
                TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: InputBorder.none,
                    )),
                TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: InputBorder.none,
                    )),
              ],
            )));
  }
}
