import 'package:learny/core/localization/l10n/app_localizations_ar.dart';

class AppValidators {
  // ================= Email =================
  static String? email(String? val) {
    if (val == null || val.trim().isEmpty) {
      return AppLocalizationsAr.instance.validationEnterEmail;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(val)) {
      return AppLocalizationsAr.instance.validationEmailInvalid;
    }

    return null;
  }

  // ================= Password =================
  static String? password(String? val) {
    if (val == null || val.isEmpty) {
      return AppLocalizationsAr.instance.validationEnterPassword;
    }

    if (val.length < 6) {
      return AppLocalizationsAr.instance.validationPasswordMinLength;
    }

    return null;
  }

  // ================= Confirm Password =================
  static String? confirmPassword(String? val, String password) {
    if (val == null || val.isEmpty) {
      return AppLocalizationsAr.instance.validationEnterPasswordConfirm;
    }

    if (val != password) {
      return AppLocalizationsAr.instance.validationPasswordMismatch;
    }

    return null;
  }

  // ================= Name =================
  static String? name(String? val) {
    if (val == null || val.trim().isEmpty) {
      return AppLocalizationsAr.instance.validationEnterName;
    }

    if (val.length < 3) {
      return AppLocalizationsAr.instance.validationNameTooShort;
    }

    return null;
  }

  // ─── Required Field ───
  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "${AppLocalizationsAr.instance.validationEnterFieldPrefix}$fieldName";
    }
    return null;
  }

  // ─── Number Validator ───
  static String? number(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "${AppLocalizationsAr.instance.validationEnterFieldPrefix}$fieldName";
    }
    if (double.tryParse(value) == null) {
      return "$fieldName${AppLocalizationsAr.instance.validationFieldMustBeIntSuffix}";
    }
    return null;
  }

  // ─── Price Validator ───
  static String? price(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizationsAr.instance.validationEnterPrice;
    }
    final number = double.tryParse(value);
    if (number == null) {
      return AppLocalizationsAr.instance.validationPriceMustBeNumber;
    }
    if (number <= 0) {
      return AppLocalizationsAr.instance.validationPriceMustBeGreaterThanZero;
    }
    return null;
  }

  // ================= Phone =================
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizationsAr.instance.validationEnterPhone;
    }

    final phone = value.trim();

    final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');

    if (!phoneRegex.hasMatch(phone)) {
      return AppLocalizationsAr.instance.validationPhoneInvalid;
    }

    return null;
  }
}
