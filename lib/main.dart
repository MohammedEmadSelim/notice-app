import 'package:easy_localization/easy_localization.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/routes/route.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/presentaion/screen_ui/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: MyApp(
        appRoute: AppRoute(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRoute});
  final AppRoute appRoute;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: AppColors.warning2Color,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.warning2Color
              .withOpacity(0.3), // The selected text background color
          selectionHandleColor: AppColors.warning2Color,
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const MyHomePage(),
      initialRoute: '/',
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
