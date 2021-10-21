import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hometech_app/constants.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

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
          onPressed: () =>
              setState(() => _isPasswordVisible = _isPasswordVisible),
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
        child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "El rey del party",
                          textAlign: TextAlign.left,
                          style: cardNameTextStyle(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$ 67.567,25",
                          textAlign: TextAlign.left,
                          style: cardBalanceTextStyle(),
                        ),
                      ],
                    ),
                    mastercardLogo(),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "5282 3456 7890 1289",
                      textAlign: TextAlign.left,
                      style: cardBottomTextStyle(),
                    ),
                    Text(
                      "09/25",
                      textAlign: TextAlign.right,
                      style: cardBottomTextStyle(),
                    ),
                  ],
                )
              ],
            )),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gasto total",
                  textAlign: TextAlign.left,
                  style: gastoTotalTextStyle(),
                ),
                Text(
                  "\$ 13.00,45",
                  textAlign: TextAlign.right,
                  style: gastoTotalTextStyle(),
                ),
              ],
            ),
          ),
          Container(
            decoration: greyBorderBoxDecoration(),
            child: conceptoANDdescuentoRow(
                "1", "Primer concepto", "\$ 2.5000,45", "Concepto"),
          ),
          Container(
            decoration: greyBorderBoxDecoration(),
            child: conceptoANDdescuentoRow(
                "1", "Primer descuento", "-\$ 12.000,45", "Descuento"),
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
                defaultText("Pago"),
                defaultText("Antes de enviar al tecnico"),
                cardContainer(),
                gastoTotalColum(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    defaultButton("Cancelar"),
                    SizedBox(
                      width: 15,
                    ),
                    defaultButton("Pagar"),
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
