import 'package:flutter/material.dart';
import 'package:weather/ui/pages/error_page/error_page.dart';
import 'package:weather/ui/pages/home_page/home_page.dart';
import 'package:weather/ui/pages/search_page/search_page.dart';
import 'package:weather/ui/routes/app_routes.dart';

class AppNavigator {
  static String initRoute = AppRoutes.home;
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.home: (_) => const HomePage(),
      AppRoutes.search: (_) => const SearchPage(),
    };
  }

  static Route generate(RouteSettings settings) {
    final settingsRoute = RouteSettings(
      name: '/404',
      arguments: settings.arguments,
    );
    return MaterialPageRoute(
      settings: settingsRoute,
      builder: (_) => const ErroPage(),
    );
  }
}
