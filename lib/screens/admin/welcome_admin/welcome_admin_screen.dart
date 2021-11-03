import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hometech_app/constants.dart';

class WelcomeAdminScreen extends StatefulWidget {
  const WelcomeAdminScreen({Key? key}) : super(key: key);
  @override
  _WelcomeAdminScreenState createState() => _WelcomeAdminScreenState();
}

class _WelcomeAdminScreenState extends State<WelcomeAdminScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  void nada() {}

  defaultButton(String labelText) => Padding(
        padding: EdgeInsets.all(18),
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            gradient: primaryGradientColor,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              minimumSize: const Size(265, 58),
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () => nada(),
            child: Text(
              labelText,
              style: TextStyle(color: Color(0xFFF7F7F8)),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bienvenido de vuelta",
                      style: TextStyle(
                        color: Color(0xFF2B2B2B),
                        backgroundColor: Colors.transparent,
                        fontSize: 34,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ],
                ),
                defaultButton("Ver usuarios"),
                defaultButton("Ver tecnicos"),
                defaultButton("Ver problemas"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
