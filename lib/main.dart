import 'package:easy_localization/easy_localization.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/routes/route.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/service_locator/service_locators.dart' as di;
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/cache_helper.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/observer.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/user_state.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/presentation/screen_ui/auth_screen.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/presentaion/controller/get_notices_cuibt/get_notices_cubit.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/presentaion/screen_ui/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await di.init();
  await CacheHelper.init();
  Bloc.observer =CustomBlocObserver();
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
    return BlocProvider(
      create: (context) => GetNoticesCubit()..getNotices(),
      child: MaterialApp(
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
        home: UserState.isSignUp()? const MyHomePage():const AuthScreen(),
        // initialRoute: '/',
        onGenerateRoute: appRoute.generateRoute,
      ),
    );
  }
}
