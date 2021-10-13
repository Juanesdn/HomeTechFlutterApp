import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
            alignment: Alignment.center,
            child: Column(
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
              ],
            )));
  }
}
