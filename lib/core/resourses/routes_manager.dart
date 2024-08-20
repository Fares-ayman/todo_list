import 'package:flutter/material.dart';
import 'package:get_x_to_do_list/modules/home/presentation/pages/home_page.dart';

// make like comments

class AppRoutesName {
  static const String homePage = "home_page";
}

class AppRoute {
  // ignore: body_might_complete_normally_nullable
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
    }
  }
}
