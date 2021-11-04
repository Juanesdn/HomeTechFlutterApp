import 'package:flutter/material.dart';
import 'package:hometech_app/constants.dart';
import 'package:hometech_app/screens/payment/payment_screen.dart';

import 'range_calendar.dart';

class CalendarPlanningScreen extends StatefulWidget {
  const CalendarPlanningScreen({Key? key}) : super(key: key);

  @override
  _CalendarPlanningScreenState createState() => _CalendarPlanningScreenState();
}

class _CalendarPlanningScreenState extends State<CalendarPlanningScreen> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  defaultText(String labelText) => Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          child: Text(
            labelText,
            textAlign: TextAlign.left,
            style: labelText == "Planea tu cita"
                ? titleTextStyle()
                : subtitleTextStyle(),
          ),
        ),
      );
  defaultButton(String labelText) => Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          gradient: labelText == "Cancelar" ? null : primaryGradientColor,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            minimumSize: const Size(163, 58),
            primary: labelText == "Cancelar"
                ? Color(0xFFF2F2F2)
                : Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () => setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentScreen()));
          }),
          child: Text(
            labelText,
            style: labelText == "Cancelar"
                ? TextStyle(color: Color(0xFFB0B0B0))
                : TextStyle(color: Color(0xFFF7F7F8)),
          ),
        ),
      );

  titleTextStyle() => TextStyle(
        color: Color(0xFF2B2B2B),
        fontSize: 34,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.41,
      );

  subtitleTextStyle() => TextStyle(
        color: Color(0xFFABABB5),
        fontSize: 17,
        letterSpacing: -0.41,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    defaultText("Planea tu cita"),
                    defaultText("¿Cuando podemos vernos?"),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              RangeCalendar(),
              SizedBox(height: 12.0),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    defaultButton("Cancelar"),
                    SizedBox(
                      width: 15,
                    ),
                    defaultButton("Planea"),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
