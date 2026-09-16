// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

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

  @override
  String get exAuthInvalidCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة';

  @override
  String get exAuthEmailAlreadyInUse => 'البريد الإلكتروني مستخدم بالفعل';

  @override
  String get exAuthWeakPassword => 'كلمة المرور ضعيفة';

  @override
  String get exAuthNetworkError => 'خطأ في الشبكة، يرجى المحاولة مرة أخرى';

  @override
  String get exAuthTooManyRequests => 'طلبات كثيرة، يرجى المحاولة لاحقًا';

  @override
  String get exAuthUnknownPrefix => 'خطأ غير معروف';

  @override
  String get nameApp => 'بيولوجي';

  @override
  String get nameAppEn => 'BIOLOGI';

  @override
  String get nameFieldLabel => 'الاسم الكامل';

  @override
  String get nameFieldHint => 'أدخل اسمك الكامل';

  @override
  String get emailFieldLabel => 'البريد الإلكتروني';

  @override
  String get emailFieldHint => 'ادخل البريد الإلكتروني';

  @override
  String get passwordFieldLabel => 'كلمة المرور';

  @override
  String get passwordFieldHint => '••••••••';

  @override
  String get phoneFieldLabel => 'رقم الهاتف';

  @override
  String get phoneFieldHint => 'أدخل رقم الهاتف';

  @override
  String get validationEnterEmail => 'من فضلك أدخل البريد الإلكتروني';

  @override
  String get validationEmailInvalid => 'البريد الإلكتروني غير صالح';

  @override
  String get validationEnterPassword => 'من فضلك أدخل كلمة المرور';

  @override
  String get validationPasswordMinLength =>
      'كلمة المرور يجب أن تكون 6 أحرف على الأقل';

  @override
  String get validationEnterPasswordConfirm => 'من فضلك أكد كلمة المرور';

  @override
  String get validationPasswordMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get validationEnterName => 'من فضلك أدخل الاسم';

  @override
  String get validationNameTooShort => 'الاسم يجب أن يكون 3 أحرف على الأقل';

  @override
  String get validationEnterFieldPrefix => 'من فضلك أدخل ';

  @override
  String get validationFieldMustBeIntSuffix => ' يجب أن يكون رقمًا';

  @override
  String get validationEnterPrice => 'من فضلك أدخل السعر';

  @override
  String get validationPriceMustBeNumber => 'السعر يجب أن يكون رقمًا';

  @override
  String get validationPriceMustBeGreaterThanZero =>
      'السعر يجب أن يكون أكبر من صفر';

  @override
  String get validationEnterPhone => 'من فضلك أدخل رقم الهاتف';

  @override
  String get validationPhoneInvalid => 'رقم الهاتف غير صالح';

  @override
  String get loginWelcome => 'مرحباً بعودتك';

  @override
  String get loginSubtitle => 'سجّل دخولك للمتابعة';

  @override
  String get formLoginPage => 'تسجيل الدخول';

  @override
  String get formLoginPageForgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get formLoginPageCreateAccount => 'إنشاء حساب جديد';

  @override
  String get formForgetPageTitle => 'استعادة الحساب';

  @override
  String get formForgetPageForgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get formForgetPageDescription =>
      'دخل بريدك الإلكتروني وسنرسل لك رابط لإعادة تعيين كلمة المرور.';

  @override
  String get formForgetPageBackToLogin => 'العودة لتسجيل الدخول';

  @override
  String get formForgetPageSendRecoveryLink => 'إرسال رابط الاستعادة';

  @override
  String get formRegisterPageTitle => 'إنشاء حساب';

  @override
  String get formRegisterPageSubtitle => 'انضم إلى منصة بيولوجي التعليمية';

  @override
  String get formRegisterPageTermsPrefix => 'أوافق على ';

  @override
  String get formRegisterPageTermsAndPrivacy =>
      'الشروط والأحكام وسياسة الخصوصية';

  @override
  String get formRegisterPageAlreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get formEmailVerificationPageTitle => 'التحقق من البريد';

  @override
  String get formEmailVerificationPageHeading => 'تحقق من بريدك الإلكتروني';

  @override
  String get formEmailVerificationPageSentTo => 'أرسلنا رابط التفعيل إلى';

  @override
  String get formEmailVerificationPageDescription =>
      'الرجاء الضغط على الرابط الموجود في رسالة البريد\nالإلكتروني لتفعيل حسابك.';

  @override
  String get formEmailVerificationPageSuccess => 'تم إرسال رابط بنجاح';

  @override
  String get formEmailVerificationPageResend => 'إعادة إرسال الرابط';

  @override
  String get formForgetPageSuccessMessage =>
      'تم إرسال رابط استعادة كلمة المرور إلى بريدك الإلكتروني بنجاح.';

  @override
  String get coursesPageTitle => 'استكشف الكورسات';

  @override
  String get coursesSearchHint => 'ابحث عن كورس...';

  @override
  String get coursesEmptyState => 'لا توجد كورسات متاحة';

  @override
  String get coursesRetry => 'إعادة المحاولة';

  @override
  String get coursesFilterAll => 'الكل';

  @override
  String get coursesFilterSecondGrade => 'الصف الثاني';

  @override
  String get coursesFilterThirdGrade => 'الصف الثالث';

  @override
  String get courseCardStudentsSuffix => 'طالب';

  @override
  String get courseCardHoursSuffix => 'ساعة';

  @override
  String get courseCardCurrencySuffix => 'ج.م';

  @override
  String get courseCardFree => 'مجاني';

  @override
  String get courseCardViewContent => 'عرض المحتوى';

  @override
  String get courseCardFreeEnroll => 'تسجيل مجاني';

  @override
  String get courseCardBuy => 'شراء الكورس';

  @override
  String get courseFailureNetwork => 'تأكد من اتصالك بالإنترنت';

  @override
  String get courseFailureTimeout => 'انتهت مهلة الاتصال بالخادم';

  @override
  String get courseFailureResourceExhausted => 'تم تجاوز الحد المسموح للطلبات';

  @override
  String get courseFailureUnknown => 'حدث خطأ غير متوقع';

  @override
  String get myCoursesPageTitle => 'كورساتي';

  @override
  String get myCoursesFilterAll => 'الكل';

  @override
  String get myCoursesFilterInProgress => 'قيد التقدم';

  @override
  String get myCoursesFilterCompleted => 'مكتملة';

  @override
  String get myCoursesStatusInProgress => 'قيد التقدم';

  @override
  String get myCoursesStatusCompleted => 'مكتملة';

  @override
  String get myCoursesEmptyTitle => 'ابدأ رحلتك التعليمية';

  @override
  String get myCoursesEmptySubtitle => 'لم تسجّل في أي كورس بعد';

  @override
  String get myCoursesEmptyCompleted => 'لم تُكمل أي كورس بعد';

  @override
  String get myCoursesEmptyInProgress => 'لا توجد كورسات قيد التقدم';

  @override
  String get myCoursesEmptyExploreButton => 'استكشاف الكورسات';

  @override
  String get myCoursesContinueButton => 'متابعة';

  @override
  String get myCoursesViewCertificate => 'عرض الشهادة';

  @override
  String get myCoursesLessonSuffix => 'درس';

  @override
  String get courseDetailsTabCurriculum => 'المحتوى';

  @override
  String get courseDetailsTabOverview => 'التفاصيل';

  @override
  String get courseDetailsTabReviews => 'التقييمات';

  @override
  String get courseDetailsNoContent => 'لا يوجد محتوى متاح حالياً';

  @override
  String get courseDetailsAbout => 'عن الكورس';

  @override
  String get courseDetailsDefaultDescription =>
      'شرح تفصيلي وشامل لمقرر الأحياء مع التركيز على الفهم والتطبيق العملي وحل الأسئلة والامتحانات التدريبية للتفوق في الثانوية العامة.';

  @override
  String get courseDetailsWhatYouWillGet => 'ماذا ستحصل في هذا الكورس؟';

  @override
  String get courseDetailsFeatureVideos => 'فيديوهات شرح بجودة عالية';

  @override
  String get courseDetailsFeaturePdfs => 'مذكرات وملخصات بصيغة PDF';

  @override
  String get courseDetailsFeatureQuizzes => 'اختبارات تقييمية بعد كل درس';

  @override
  String get courseDetailsFeatureAccess => 'وصول غير محدود للمحتوى في أي وقت';

  @override
  String get courseDetailsReviewsBasedOn => 'بناءً على 128 تقييم';

  @override
  String get courseDetailsContinueLearning => 'متابعة التعلم';

  @override
  String get courseMinutesSuffix => 'دقيقة';

  @override
  String get courseLessonsSuffix => 'دروس';

  @override
  String get courseQuestionsSuffix => 'أسئلة';

  @override
  String get courseEducationalFile => 'ملف تعليمي';

  @override
  String get courseMegabyteSuffix => 'ميجابايت';

  @override
  String get lessonTypeNotSupported => 'نوع الدرس غير مدعوم';

  @override
  String get pdfLessonPrefix => 'درس PDF';

  @override
  String get quizLessonPrefix => 'اختبار';

  @override
  String get lessonAttachmentsTitle => 'المرفقات';

  @override
  String get lessonDefaultAttachmentName => 'ملخص الدرس.pdf';

  @override
  String get lessonNavigationPrevious => 'الدرس السابق';

  @override
  String get lessonNavigationNext => 'الدرس التالي';

  @override
  String get videoLessonDefaultDescription =>
      'في هذا الدرس، سنقوم بشرح وتفصيل المحتوى التعليمي مع توضيح أهم النقاط الأساسية والتطبيقية لمساعدتك على التفوق.';

  @override
  String get videoLessonCompleted => 'تم الإكمال بنجاح';

  @override
  String get videoLessonMarkAsCompleted => 'تمييز كمكتمل';

  @override
  String get videoPlayerError => 'تعذر تشغيل الفيديو';

  @override
  String get videoPlayerUnmute => 'إلغاء كتم الصوت';

  @override
  String get videoPlayerMute => 'كتم الصوت';

  @override
  String get videoPlayerPlaybackSpeed => 'سرعة التشغيل';

  @override
  String get bottomNavHome => 'الرئيسية';

  @override
  String get bottomNavCourses => 'الكورسات';

  @override
  String get bottomNavMyCourses => 'كورساتي';

  @override
  String get bottomNavProfile => 'الملف الشخصي';

  @override
  String get profileUpdateSuccess => 'تم تحديث البيانات بنجاح';

  @override
  String get profilePersonalInfo => 'المعلومات الشخصية';

  @override
  String get profileName => 'الاسم';

  @override
  String get profileEmail => 'البريد الإلكتروني';

  @override
  String get profilePhone => 'الهاتف';

  @override
  String get profileAboutPlatform => 'عن المنصة';

  @override
  String get profileAboutDescription =>
      'منصة تعليمية متخصصة في شرح مادة الأحياء للمرحلة الثانوية بطريقة حديثة ومبسطة تجمع بين المحتوى العلمي الدقيق وأساليب التعلم التفاعلي.';

  @override
  String get profileMission => 'مهمتنا: تبسيط العلوم لكل طالب';

  @override
  String get profileLearnMore => 'اعرف المزيد';

  @override
  String get profileLogout => 'تسجيل الخروج';

  @override
  String get profileDefaultGrade => 'الصف الثالث الثانوي';

  @override
  String get profileDefaultName => 'أحمد محمد';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsNotifications => 'تفضيلات الإشعارات';

  @override
  String get settingsDarkMode => 'الوضع الداكن';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsArabic => 'العربية';

  @override
  String get editNameTitle => 'تعديل الاسم';

  @override
  String get editCurrentNamePrefix => 'الاسم الحالي: ';

  @override
  String get editNewName => 'الاسم الجديد';

  @override
  String get editSaveChanges => 'حفظ التغييرات';

  @override
  String get editCancel => 'إلغاء';

  @override
  String get validationEnterNewName => 'من فضلك أدخل الاسم الجديد';

  @override
  String get validationNameMinChars => 'الاسم يجب أن يكون 3 أحرف على الأقل';

  @override
  String get enrollmentUnauthorized => 'يرجى تسجيل الدخول لعرض دوراتك';

  @override
  String get lessonProgress => 'الدرس';

  @override
  String get reviewName1 => 'أحمد محمد';

  @override
  String get reviewComment1 => 'شرح ممتاز جداً ومبسط ومفهوم!';

  @override
  String get reviewTime1 => 'منذ يومين';

  @override
  String get reviewName2 => 'سارة علي';

  @override
  String get reviewComment2 => 'المذكرات والأسئلة ساعدتني جداً في المراجعة.';

  @override
  String get reviewTime2 => 'منذ أسبوع';

  @override
  String get defaultInitials => 'أح';

  @override
  String get orDividerText => 'أو';
}
