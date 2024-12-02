import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class LocalizationInterFace {
  static void customSetLocale(String language, BuildContext context){}
}

class LocalizationsImplementation extends LocalizationInterFace {
  @override
  static void customSetLocale(String language, BuildContext context) {
    switch (language) {
      case 'ar':
        context.setLocale(Locale('ar'));
        break;
        case 'en':
          context.setLocale(Locale('en'));
    }
  }
}
