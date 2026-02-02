import 'package:easy_localization/easy_localization.dart';
import 'package:cliniq/core/constants/locale_keys.dart';

class Validators {
  static String? validateNormalText(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationFieldIsRequired.tr();
    }
    return null;
  }

  static String? validateEmail(
    String? value, {
    bool isForgetPasswordValidation = false,
  }) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      if (isForgetPasswordValidation) {
        return LocaleKeys.validationEnterYourEmailToResetPassword.tr();
      }
      return LocaleKeys.validationEmailIsRequired.tr();
    } else if (!regex.hasMatch(value)) {
      return LocaleKeys.validationInvalidEmail.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationPasswordIsRequired.tr();
    } else if (value.length < 8) {
      return LocaleKeys.validationPasswordTooShort.tr();
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return LocaleKeys.validationPasswordMustContainLowercase.tr();
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return LocaleKeys.validationPasswordMustContainUppercase.tr();
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return LocaleKeys.validationPasswordMustContainNumber.tr();
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationConfirmPasswordIsRequired.tr();
    } else if (password == null || password.isEmpty) {
      return LocaleKeys.validationPasswordIsRequired.tr();
    } else if (value != password) {
      return LocaleKeys.validationPasswordsDoNotMatch.tr();
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, {bool isRequired = true}) {
    const phonePattern = r'^\+?[0-9]{11}$';
    final regex = RegExp(phonePattern);

    if (value == null || value.isEmpty) {
      if (isRequired) {
        return LocaleKeys.validationPhoneIsRequired.tr();
      } else {
        return null;
      }
    } else if (!regex.hasMatch(value)) {
      return LocaleKeys.validationInvalidPhone.tr();
    }
    return null;
  }

  static String? validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationBirthDateIsRequired.tr();
    }

    try {
      final date = DateFormat('dd-MM-yyyy').parseStrict(value);
      final now = DateTime.now();

      if (date.isAfter(now)) {
        return LocaleKeys.validationInvalidBirthDate.tr();
      }

      int age = now.year - date.year;
      if (now.month < date.month ||
          (now.month == date.month && now.day < date.day)) {
        age--;
      }

      if (age < 14) return LocaleKeys.validationAgeTooYoung.tr();
      if (age > 120) return LocaleKeys.validationAgeTooOld.tr();
    } catch (_) {
      return LocaleKeys.validationInvalidBirthDate.tr();
    }

    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationAgeIsRequired.tr();
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0) {
      return LocaleKeys.validationInvalidAge.tr();
    }
    if (age < 14) {
      return LocaleKeys.validationAgeTooYoung.tr();
    }
    if (age > 120) {
      return LocaleKeys.validationAgeTooOld.tr();
    }
    return null;
  }

  static String? validateNationalId(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final regex = RegExp(r'^[0-9]{14}$');
    if (!regex.hasMatch(value)) {
      return LocaleKeys.validationInvalidNationalId.tr();
    }

    return null;
  }

  static String? validateGovernorate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.validationGovernorateIsRequired.tr();
    }
    if (value.trim().length > 30) {
      return LocaleKeys.validationGovernorateTooLong.tr();
    }
    return null;
  }
}
