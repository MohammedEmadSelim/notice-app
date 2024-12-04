import 'package:factory_method_pattern_with_clean_architecture/core/routes/route_path.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/presentation/screen_ui/create_notice_screen.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/presentaion/screen_ui/home.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    Map? arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutePath.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );
      case RoutePath.createNotice:
        return MaterialPageRoute(
          builder: (_) =>  CreateNoticeScreen(),
        );
      default:
        return null;
    }
  }
}
