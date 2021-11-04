import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Altura proporcional para cada pantalla
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;

  // 812 es la altura del layout utilizada en el diseño
  return (inputHeight / 812.0) * screenHeight;
}

// Anchura poporcional para cada pantalla
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;

  // 375 es la anchura del layout utilizada en el diseño
  return (inputWidth / 375.0) * screenWidth;
}
