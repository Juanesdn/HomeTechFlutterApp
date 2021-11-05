import "package:flutter/widgets.dart";

import 'screens/admin/welcome_admin/welcome_admin_screen.dart';
import 'screens/homepage/homepage.dart';
import 'screens/register/register_screen.dart';
import 'screens/technicians/technicians_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomePage.routeName: (context) => const HomePage(),
  WelcomeAdminScreen.routeName: (context) => const WelcomeAdminScreen(),
  TechniciansScreen.routeName: (context) => TechniciansScreen(),
};
