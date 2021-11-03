import "package:flutter/widgets.dart";

import 'screens/welcome/welcome_screen.dart';
import 'screens/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
};
