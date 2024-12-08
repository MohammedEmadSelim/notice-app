
abstract class Validator {
  static const String _emailRegExp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  // static const String _mobileNoRegExp = r'^(?:[+0][0-9])?[0-9]{11}$';
  // static const String _egyptMobileNoRegExp = r'^01[0125][0-9]{8}$';
  // static const String _cardNoRegExp = r'^(?:[0-9])?[0-9]{16}$';
  // static const String _cvvNoRegExp = r'^(?:[0-9])?[0-9]{3}$';
  static const String _otpRegExp = r'^(?:[0-9])?[0-9]{4}$';
  static const String _idRegExp = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]";

  static String? idValidator(String? id) {
    if (id!.trim().isEmpty) return 'ID is Required.';
    if (!RegExp(_idRegExp).hasMatch(id)) return 'Invalid format.';
    return null;
  }

  static String? nameValidator(String? name) {
    if (name!.trim().isEmpty) return 'Name is Required.';
    if (name.length < 2) return 'Name must be at least 2 characters.';
    if (name.length > 50) return 'Name must be at most 50 character.';
    return null;
  }

  static String? customTextValidator(String? name, {required String title}) {
    if (name!.trim().isEmpty) return '${title} is Required.';
    if (name.length < 2) return '${title} must be at least 2 characters.';
    if (name.length > 50) return '${title} must be at most 50 character.';
    return null;
  }

  static String? emailValidator(String? email) {
    if (email!.trim().isEmpty) return 'ID is Required.';
    if (!RegExp(_emailRegExp).hasMatch(email)) return 'Invalid format.';
    return null;
  }

  static String? phoneValidator(String? mobileNo) {
    if (mobileNo!.trim().isEmpty) return 'Phone number is Required.';
    if (mobileNo.trim().length < 8 || mobileNo.trim().length > 15)
      return 'Invalid phone number.';
    // if (!RegExp(_egyptMobileNoRegExp).hasMatch(mobileNo)) return 'Invalid phone number.';
    return null;
  }

  static String? nationalIdValidator(String? nationalId) {
    if (nationalId == null || nationalId.trim().isEmpty)
      return 'nationalId is Required';
    if (nationalId.length > 10 || nationalId.length < 10)
      return 'natioanl id must be exactly 10 digits';
    return null;
  }

  static String? otpValidator(String? otpCode) {
    if (otpCode!.trim().isEmpty) return 'Please enter OTP code.';
    if (!RegExp(_otpRegExp).hasMatch(otpCode))
      return 'OTP must be 4 digits (only numbers).';
    return null;
  }

  static String? addressValidator(String? address) {
    if (address!.trim().isEmpty) return 'Address is Required.';
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) return 'Password is Required.';
    if (password.length < 8) return 'Password must be at least 8 characters.';
    if (password.length > 100)
      return 'Password must be at most 1000 character.';
    return null;
  }

  static String? confirmPasswordValidator(
      String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password is Required';
    } else if (confirmPassword != password) return 'Password isn\'t identical.';
    return null;
  }

  static String? passwordLoginValidator(String? password) {
    if (password!.trim().isEmpty) return 'Password is Required.';
    return null;
  }

  static String? pinCodeValidator(String? pinCode) {
    int repeatedCounter = 1;
    int sequentialCounter = 1;
    for (int i = 0; i < pinCode!.length - 1; i++) {
      int currentDigit = int.parse(pinCode[i]);
      int nextDigit = int.parse(pinCode[i + 1]);
      if (currentDigit == nextDigit) repeatedCounter++;
      if ((currentDigit + 1) == nextDigit) sequentialCounter++;
    }
    if (repeatedCounter == 6) return 'Repeated numbers not allowed.';
    if (sequentialCounter == 6) return 'Sequential numbers not allowed.';
    return null;
  }

  static String? textValidator(String? bankId) {
    if (bankId!.trim().isEmpty) return 'Please, select the bank.';
    return null;
  }

  static String? requiredFild(String? fieldText,
      {String? fieldName, String? errorText}) {
    String validationText =
        errorText ?? '${fieldName ?? 'This field'} is required';
    return fieldText!.trim().isEmpty ? validationText : null;
  }
  //
  // static String? validateBankSelection(String? selectedBank) {
  //   return selectedBank == null || selectedBank.isEmpty
  //       ? AppStrings.bankRequired
  //       : null;
  // }
  //
  // static String? validateSaudiIban(String? iban) {
  //   final saudiIbanRegex = RegExp(r'^SA\d{2}\d{2}\d{2}\d{18}$');
  //   return iban == null || iban.isEmpty
  //       ? AppStrings.ibanRequired
  //       : saudiIbanRegex.hasMatch(iban)
  //           ? null
  //           : AppStrings.validateSaudiIban;
  // }
}
