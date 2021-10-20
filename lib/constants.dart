import 'package:flutter/material.dart';

// Valores que se mantendrán constantes en la app

const primaryColor = Color(0xFFFF7643);
const primaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);

const animationDuration = Duration(milliseconds: 200);

// Form errors
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]+");
const emptyEmailError = "Ingresa tu correo";
const invalidEmailError = "Correo Inválido";
const emptyPasswordError = "Ingresa tu contraseña";
const invalidPasswordError = "Contraseña inválida";
