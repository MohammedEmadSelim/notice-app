import 'package:easy_localization/easy_localization.dart';

class AppValidators {
  static textEmptyValidation({required String value}) {
    if (value.isEmpty) {
      return "${"please".tr()} ${"enter".tr()} ${"password".tr()}";
    }
  }
static phoneNumberValidation({required String value}) {
  String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(phonePattern);
  if (value.isEmpty) {
    return"${"please".tr()} ${"enter".tr()} ${"phone_number".tr()} ${"or".tr()} ${"email".tr()}";
  } else if (!regExp.hasMatch(value) && value.length < 10) {
    return"${"phone_number".tr()} ${"at_least_10_numbers".tr()}";
  } else if ( value.length == 10 && !value.startsWith("05")) {
    return"${"please".tr()} ${"enter".tr()} ${"phone_number".tr()} ${"correctly".tr()}";
  }else if ( value.length > 10 && (!value.startsWith("05") || value.startsWith("05"))) {
    return"${"please".tr()} ${"enter".tr()} ${"phone_number".tr()} ${"correctly".tr()}";

  }
}
  static loginEmilOrPhoneValidation({required String value}) {
    if(value.startsWith("0")|| value.startsWith("1")
        || value.startsWith("2") || value.startsWith("3")
        || value.startsWith("4") || value.startsWith("5")
        || value.startsWith("6") || value.startsWith("7")
        || value.startsWith("8") || value.startsWith("9")){
      return phoneNumberValidation(value:value);
    }else {
      return emailValidation(value:value);
    }
  }
  static emailValidation({required String value}) {
    String emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailPattern);
    if (value.isEmpty) {
      return"${"please".tr()} ${"enter".tr()} ${"phone_number".tr()} ${"or".tr()} ${"email".tr()}";
    } else if (!regExp.hasMatch(value) && !value.contains("@") || !value.contains(".com")) {
      return"${"please".tr()} ${"enter".tr()} ${"email".tr()} ${"correctly".tr()}";

    }
  }

}