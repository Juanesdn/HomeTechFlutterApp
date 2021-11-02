import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hometech_app/constants.dart';

class EditTechnicianScreen extends StatefulWidget {
  const EditTechnicianScreen({Key? key}) : super(key: key);

  @override
  _EditTechnicianScreenState createState() => _EditTechnicianScreenState();
}

class _EditTechnicianScreenState extends State<EditTechnicianScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  defaultTextFormField(String label) => TextFormField(
        maxLines: 1,
        style: TextStyle(
          foreground: null,
          color: Color(0xFF2B2B2B),
        ),
        decoration: defaultInputDecoration(label),
      );

  defaultInputDecoration(String label) => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        fillColor: Color(0xFFF0F0F0),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: primaryColor),
        ),
        labelStyle: TextStyle(
          color: Color(0xFFAEAEB2),
        ),
        labelText: label,
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
                defaultTextFormField("Fullname"),
                defaultTextFormField("Email"),
                defaultTextFormField("Celular"),
                Row(
                  children: [
                    Expanded(
                      child: defaultTextFormField("Edad"),
                    ),
                    Expanded(
                      child: defaultTextFormField("Experiencia"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
