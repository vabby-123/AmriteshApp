import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/home_screen.dart';
import '../screens/profile_and_history.dart';

class NavigationManager {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rpHomeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case rpProfileHistory:
        return MaterialPageRoute(
            builder: (context) => const ProfileAndHistory());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
