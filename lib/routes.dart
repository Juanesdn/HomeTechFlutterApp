import "package:flutter/widgets.dart";

import 'screens/welcome/welcome_screen.dart';
import 'screens/login/login_screen.dart';

import 'screens/admin/welcome_admin/welcome_admin_screen.dart';

import 'screens/admin/edit_technician/edit_technician_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  WelcomeScreen.routeName: (context) => const EditTechnicianScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
};
