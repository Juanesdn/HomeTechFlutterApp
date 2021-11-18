import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometech_app/constants.dart';
import 'package:hometech_app/controller/auth_controller.dart';
import 'package:hometech_app/controller/request_controller.dart';
import 'package:hometech_app/screens/calendarPlanning/calendar_planning_screen.dart';
import 'package:hometech_app/screens/success/success_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _isPasswordVisible = false;

  final _requestController = Get.find<RequestController>();
  final _authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  defaultButton(String labelText, VoidCallback onPress) => Container(
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
          onPressed: onPress,
          child: Text(
            labelText,
            style: labelText == "Cancelar"
                ? TextStyle(color: Color(0xFFB0B0B0))
                : TextStyle(color: Color(0xFFF7F7F8)),
          ),
        ),
      );

  cardContainer() => Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          gradient: secundaryGradientColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 280),
                          child: FutureBuilder<String>(
                              future: _authController.getUserFullname(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Cargando...",
                                      textAlign: TextAlign.left,
                                      style: cardNameTextStyle());
                                } else {
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}',
                                        textAlign: TextAlign.left,
                                        style: cardNameTextStyle());
                                  } else {
                                    return Text('${snapshot.data}',
                                        textAlign: TextAlign.left,
                                        style: cardNameTextStyle());
                                  }
                                }
                              })),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        "\$ 67.567,25",
                        textAlign: TextAlign.left,
                        style: cardBalanceTextStyle(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: mastercardLogo(),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "**** **** **** 1289",
                    textAlign: TextAlign.left,
                    style: cardBottomTextStyle(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "09/25",
                    textAlign: TextAlign.right,
                    style: cardBottomTextStyle(),
                  ),
                ),
              ],
            )
          ],
        ),
      );

  visaLogo() => Image.asset(
        "assets/images/Visa_logo.png",
        height: 29.9,
        width: 48.54,
      );

  mastercardLogo() => Image.asset(
        "assets/images/Mastercard_logo.png",
        height: 29.9,
        width: 48.54,
      );

  defaultText(String labelText) => Padding(
        padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
        child: Text(
          labelText,
          textAlign: TextAlign.left,
          style: labelText == "Pago" ? titleTextStyle() : subtitleTextStyle(),
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

  cardNameTextStyle() => TextStyle(
        color: Color.fromARGB(150, 255, 255, 255),
        fontSize: 13,
        letterSpacing: 2.15,
      );

  cardBalanceTextStyle() => TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.92,
      );

  cardBottomTextStyle() => TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 15,
        letterSpacing: 0.54,
      );

  gastoTotalTextStyle() => TextStyle(
        color: Color(0xFF2B2B2B),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );

  conceptoANDdescuentoTextStyle() => TextStyle(
        color: Color(0xFF6F7985),
        fontSize: 17,
        letterSpacing: -0.41,
      );

  valorConceptoTextStyle(String tipo) => TextStyle(
        color: tipo == "Concepto" ? Color(0xFF2B2B2B) : Color(0xFFFB724C),
        fontSize: 17,
        letterSpacing: -0.41,
      );

  greyBorderBoxDecoration() => BoxDecoration(
        border: Border.all(
          color: Color(0xFFECEEF1),
        ),
      );

  conceptoANDdescuentoRow(
          String indice, String texto, String valor, String tipo) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              numberedCircleIcon(indice, tipo),
              SizedBox(
                width: 10,
              ),
              Text(
                texto,
                textAlign: TextAlign.left,
                style: conceptoANDdescuentoTextStyle(),
              ),
            ],
          ),
          Text(
            valor,
            textAlign: TextAlign.right,
            style: valorConceptoTextStyle(tipo),
          ),
        ],
      );

  gastoTotalColum() => Column(
        children: [
          Container(
            decoration: greyBorderBoxDecoration(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gasto total",
                    textAlign: TextAlign.left,
                    style: gastoTotalTextStyle(),
                  ),
                  Text(
                    "\$ ${_requestController.technicianCostPerHour}",
                    textAlign: TextAlign.right,
                    style: gastoTotalTextStyle(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: greyBorderBoxDecoration(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: conceptoANDdescuentoRow(
                  "1", "Primer concepto", "\$ 2.5000,45", "Concepto"),
            ),
          ),
          Container(
            decoration: greyBorderBoxDecoration(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: conceptoANDdescuentoRow(
                  "1", "Primer descuento", "-\$ 12.000,45", "Descuento"),
            ),
          ),
        ],
      );

  numberedCircleIcon(String numero, String tipo) => Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        decoration: new BoxDecoration(
          color: tipo == "Concepto" ? Color(0xFF2B2B2B) : Color(0xFFFB724C),
          shape: BoxShape.circle,
        ),
        child: Container(
          alignment: Alignment.center,
          width: 15,
          height: 15,
          decoration: new BoxDecoration(
            color: tipo == "Concepto" ? Colors.white : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              numero,
              style: TextStyle(
                color: tipo == "Concepto" ? Color(0xFF2B2B2B) : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  avatarCircular1() => CircleAvatar(
        backgroundColor: Colors.grey,
        minRadius: 12,
        child: Center(
          child: Text(
            "1",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8,
            ),
          ),
        ),
      );

  avatarCircular2() => CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 12,
        child: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 8,
          child: Center(
            child: SizedBox(
              width: 10,
              height: 10,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
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
                  defaultText("Pago"),
                  defaultText("Antes de enviar al tecnico"),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: cardContainer(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: gastoTotalColum(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        defaultButton("Cancelar", () {
                          Get.offAll(const CalendarPlanningScreen());
                        }),
                        SizedBox(
                          width: 15,
                        ),
                        defaultButton("Pagar", () {
                          _requestController.createRequest();
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
