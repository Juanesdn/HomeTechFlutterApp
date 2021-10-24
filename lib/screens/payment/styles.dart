import 'package:flutter/material.dart';

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
