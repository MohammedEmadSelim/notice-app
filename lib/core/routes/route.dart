import 'package:factory_method_pattern_with_clean_architecture/core/routes/route_path.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/presentation/screen_ui/auth_screen.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/presentation/screen_ui/create_notice_screen.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/update_notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/presentation/screen_ui/edit_notice_screen.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/presentaion/screen_ui/home.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case RoutePath.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );
      case RoutePath.createNotice:
        return MaterialPageRoute(
          builder: (_) => CreateNoticeScreen(),
        );
      case RoutePath.editNoticeScreen:
        return MaterialPageRoute(
          builder: (_) => EditNoticeScreen(notice: arguments as UpdateNotice),
        );
      case RoutePath.authScreen:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        );
      default:
        return null;
    }
  }
}
