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

  // ==================== Courses ====================

  String get coursesPageTitle => 'استكشف الكورسات';
  String get coursesSearchHint => 'ابحث عن كورس...';
  String get coursesEmptyState => 'لا توجد كورسات متاحة';
  String get coursesRetry => 'إعادة المحاولة';

  // Filter bar
  String get coursesFilterAll => 'الكل';
  String get coursesFilterSecondGrade => 'الصف الثاني';
  String get coursesFilterThirdGrade => 'الصف الثالث';

  // Course card
  String get courseCardStudentsSuffix => 'طالب';
  String get courseCardHoursSuffix => 'ساعة';
  String get courseCardCurrencySuffix => 'ج.م';
  String get courseCardFree => 'مجاني';
  String get courseCardViewContent => 'عرض المحتوى';
  String get courseCardFreeEnroll => 'تسجيل مجاني';
  String get courseCardBuy => 'شراء الكورس';

  // Course failure messages
  String get courseFailureNetwork => 'تأكد من اتصالك بالإنترنت';
  String get courseFailureTimeout => 'انتهت مهلة الاتصال بالخادم';
  String get courseFailureResourceExhausted => 'تم تجاوز الحد المسموح للطلبات';
  String get courseFailureUnknown => 'حدث خطأ غير متوقع';

  // ==================== My Courses ====================
  String get myCoursesPageTitle => 'كورساتي';
  String get myCoursesFilterAll => 'الكل';
  String get myCoursesFilterInProgress => 'قيد التقدم';
  String get myCoursesFilterCompleted => 'مكتملة';
  String get myCoursesStatusInProgress => 'قيد التقدم';
  String get myCoursesStatusCompleted => 'مكتملة';
  String get myCoursesEmptyTitle => 'ابدأ رحلتك التعليمية';
  String get myCoursesEmptySubtitle => 'لم تسجّل في أي كورس بعد';
  String get myCoursesEmptyCompleted => 'لم تُكمل أي كورس بعد';
  String get myCoursesEmptyInProgress => 'لا توجد كورسات قيد التقدم';
  String get myCoursesEmptyExploreButton => 'استكشاف الكورسات';
  String get myCoursesContinueButton => 'متابعة';
  String get myCoursesViewCertificate => 'عرض الشهادة';
  String get myCoursesLessonSuffix => 'درس';

  // ==================== Course Details & Lessons ====================
  String get courseDetailsTabCurriculum => 'المحتوى';
  String get courseDetailsTabOverview => 'التفاصيل';
  String get courseDetailsTabReviews => 'التقييمات';
  String get courseDetailsNoContent => 'لا يوجد محتوى متاح حالياً';
  String get courseDetailsAbout => 'عن الكورس';
  String get courseDetailsDefaultDescription =>
      'شرح تفصيلي وشامل لمقرر الأحياء مع التركيز على الفهم والتطبيق العملي وحل الأسئلة والامتحانات التدريبية للتفوق في الثانوية العامة.';
  String get courseDetailsWhatYouWillGet => 'ماذا ستحصل في هذا الكورس؟';
  String get courseDetailsFeatureVideos => 'فيديوهات شرح بجودة عالية';
  String get courseDetailsFeaturePdfs => 'مذكرات وملخصات بصيغة PDF';
  String get courseDetailsFeatureQuizzes => 'اختبارات تقييمية بعد كل درس';
  String get courseDetailsFeatureAccess =>
      'وصول غير محدود للمحتوى في أي وقت';
  String get courseDetailsReviewsBasedOn => 'بناءً على 128 تقييم';
  String get courseDetailsContinueLearning => 'متابعة التعلم';
  String get courseMinutesSuffix => 'دقيقة';
  String get courseLessonsSuffix => 'دروس';
  String get courseQuestionsSuffix => 'أسئلة';
  String get courseEducationalFile => 'ملف تعليمي';
  String get courseMegabyteSuffix => 'ميجابايت';

  // Lesson Pages & Navigation
  String get lessonTypeNotSupported => 'نوع الدرس غير مدعوم';
  String get pdfLessonPrefix => 'درس PDF';
  String get quizLessonPrefix => 'اختبار';
  String get lessonAttachmentsTitle => 'المرفقات';
  String get lessonDefaultAttachmentName => 'ملخص الدرس.pdf';
  String get lessonNavigationPrevious => 'الدرس السابق';
  String get lessonNavigationNext => 'الدرس التالي';
  String get videoLessonDefaultDescription =>
      'في هذا الدرس، سنقوم بشرح وتفصيل المحتوى التعليمي مع توضيح أهم النقاط الأساسية والتطبيقية لمساعدتك على التفوق.';
  String get videoLessonCompleted => 'تم الإكمال بنجاح';
  String get videoLessonMarkAsCompleted => 'تمييز كمكتمل';

  // Video Player
  String get videoPlayerError => 'تعذر تشغيل الفيديو';
  String get videoPlayerUnmute => 'إلغاء كتم الصوت';
  String get videoPlayerMute => 'كتم الصوت';
  String get videoPlayerPlaybackSpeed => 'سرعة التشغيل';
}
