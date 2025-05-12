import 'package:flutter/cupertino.dart';

import '../screens/login/forget_pass.dart';
import '../screens/login/login_screen.dart';
import '../screens/main_layout/main_layout.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/registration/registration_screen.dart' show RegisterPage;
import '../screens/splash/splash.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String mainLayout = "/mainLayout";
  static const String onboarding = "/onboarding_screen";
  static const String login = "/login_screen";
  static const String register = "/registration_screen";
  static const String forgetten = "/forget_pass";

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => Splash(),
    onboarding: (_) => OnboardingScreen(),
    mainLayout: (_) => MainLayout(),
    login: (_) => LoginPage(),
    register: (_) => RegisterPage(),
    forgetten: (_) => ForgetPasswordPage()
  };
}
