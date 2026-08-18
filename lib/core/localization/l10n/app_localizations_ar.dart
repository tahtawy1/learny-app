// ignore: unused_import

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);
  static final AppLocalizationsAr instance = AppLocalizationsAr();
  @override
  String get unknownError => 'حدث خطأ غير معروف، يرجى المحاولة مرة أخرى.';

  @override
  String get unexpectedError => 'حدث خطأ غير متوقع.';

  @override
  String get cacheError => 'فشل في تحميل البيانات المخزنة.';

  @override
  String get networkError => 'يرجى التحقق من اتصالك بالإنترنت.';

  @override
  String get serverError => 'خطأ في الخادم، يرجى المحاولة لاحقًا.';

  @override
  String get authError => 'فشل في التحقق من الهوية، يرجى المحاولة مرة أخرى.';

  String get exAuthInvalidCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة';
  String get exAuthEmailAlreadyInUse => 'البريد الإلكتروني مستخدم بالفعل';
  String get exAuthWeakPassword => 'كلمة المرور ضعيفة';
  String get exAuthNetworkError => 'خطأ في الشبكة، يرجى المحاولة مرة أخرى';
  String get exAuthTooManyRequests => 'طلبات كثيرة، يرجى المحاولة لاحقًا';
  String get exAuthUnknownPrefix => 'خطأ غير معروف';
  String get nameApp => "بيولوجي";

  String get nameAppEn => "BIOLOGI";
  String get nameFieldLabel => "الاسم الكامل";
  String get nameFieldHint => "أدخل اسمك الكامل";
  String get emailFieldLabel => "البريد الإلكتروني";
  String get emailFieldHint => "ادخل البريد الإلكتروني";
  String get passwordFieldLabel => "كلمة المرور";
  String get passwordFieldHint => "••••••••";
  String get phoneFieldLabel => "رقم الهاتف";
  String get phoneFieldHint => "أدخل رقم الهاتف";
  String get validationEnterEmail => "من فضلك أدخل البريد الإلكتروني";
  String get validationEmailInvalid => "البريد الإلكتروني غير صالح";

  String get validationEnterPassword => "من فضلك أدخل كلمة المرور";
  String get validationPasswordMinLength =>
      "كلمة المرور يجب أن تكون 6 أحرف على الأقل";

  String get validationEnterPasswordConfirm => "من فضلك أكد كلمة المرور";
  String get validationPasswordMismatch => "كلمتا المرور غير متطابقتين";

  String get validationEnterName => "من فضلك أدخل الاسم";
  String get validationNameTooShort => "الاسم يجب أن يكون 3 أحرف على الأقل";

  String get validationEnterFieldPrefix => "من فضلك أدخل ";
  String get validationFieldMustBeIntSuffix => " يجب أن يكون رقمًا";

  String get validationEnterPrice => "من فضلك أدخل السعر";
  String get validationPriceMustBeNumber => "السعر يجب أن يكون رقمًا";
  String get validationPriceMustBeGreaterThanZero =>
      "السعر يجب أن يكون أكبر من صفر";
  String get validationEnterPhone => "من فضلك أدخل رقم الهاتف";
  String get validationPhoneInvalid => "رقم الهاتف غير صالح";
  String get loginWelcome => "مرحباً بعودتك";
  String get loginSubtitle => "سجّل دخولك للمتابعة";
  String get formLoginPage => "تسجيل الدخول";
  String get formLoginPageForgotPassword => "هل نسيت كلمة المرور؟";
  String get formLoginPageCreateAccount => "إنشاء حساب جديد";
  String get formForgetPageTitle => "استعادة الحساب";

  String get formForgetPageForgotPassword => "نسيت كلمة المرور؟";

  String get formForgetPageDescription =>
      "دخل بريدك الإلكتروني وسنرسل لك رابط لإعادة تعيين كلمة المرور.";

  String get formForgetPageBackToLogin => "العودة لتسجيل الدخول";

  String get formForgetPageSendRecoveryLink => "إرسال رابط الاستعادة";
  String get formRegisterPageTitle => "إنشاء حساب";

  String get formRegisterPageSubtitle => "انضم إلى منصة بيولوجي التعليمية";
  String get formRegisterPageTermsPrefix => "أوافق على ";

  String get formRegisterPageTermsAndPrivacy =>
      "الشروط والأحكام وسياسة الخصوصية";

  String get formRegisterPageAlreadyHaveAccount => "لديك حساب بالفعل؟ ";

  String get formEmailVerificationPageTitle => "التحقق من البريد";

  String get formEmailVerificationPageHeading => "تحقق من بريدك الإلكتروني";

  String get formEmailVerificationPageSentTo => "أرسلنا رابط التفعيل إلى";

  String get formEmailVerificationPageDescription =>
      "الرجاء الضغط على الرابط الموجود في رسالة البريد\n"
      "الإلكتروني لتفعيل حسابك.";

  String get formEmailVerificationPageSuccess => "تم إرسال رابط بنجاح";

  String get formEmailVerificationPageResend => "إعادة إرسال الرابط";
  String get formForgetPageSuccessMessage =>
      "تم إرسال رابط استعادة كلمة المرور إلى بريدك الإلكتروني بنجاح.";
}
