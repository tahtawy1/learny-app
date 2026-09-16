import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred, please try again.'**
  String get unknownError;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get unexpectedError;

  /// No description provided for @cacheError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load cached data.'**
  String get cacheError;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection.'**
  String get networkError;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error, please try again later.'**
  String get serverError;

  /// No description provided for @authError.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed, please try again.'**
  String get authError;

  /// No description provided for @exAuthInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get exAuthInvalidCredentials;

  /// No description provided for @exAuthEmailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'Email is already in use'**
  String get exAuthEmailAlreadyInUse;

  /// No description provided for @exAuthWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is too weak'**
  String get exAuthWeakPassword;

  /// No description provided for @exAuthNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error, please try again'**
  String get exAuthNetworkError;

  /// No description provided for @exAuthTooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'Too many requests, please try later'**
  String get exAuthTooManyRequests;

  /// No description provided for @exAuthUnknownPrefix.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get exAuthUnknownPrefix;

  /// No description provided for @nameApp.
  ///
  /// In en, this message translates to:
  /// **'Biologi'**
  String get nameApp;

  /// No description provided for @nameAppEn.
  ///
  /// In en, this message translates to:
  /// **'BIOLOGI'**
  String get nameAppEn;

  /// No description provided for @nameFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get nameFieldLabel;

  /// No description provided for @nameFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get nameFieldHint;

  /// No description provided for @emailFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailFieldLabel;

  /// No description provided for @emailFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailFieldHint;

  /// No description provided for @passwordFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordFieldLabel;

  /// No description provided for @passwordFieldHint.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get passwordFieldHint;

  /// No description provided for @phoneFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneFieldLabel;

  /// No description provided for @phoneFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get phoneFieldHint;

  /// No description provided for @validationEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get validationEnterEmail;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get validationEmailInvalid;

  /// No description provided for @validationEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get validationEnterPassword;

  /// No description provided for @validationPasswordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get validationPasswordMinLength;

  /// No description provided for @validationEnterPasswordConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get validationEnterPasswordConfirm;

  /// No description provided for @validationPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get validationPasswordMismatch;

  /// No description provided for @validationEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get validationEnterName;

  /// No description provided for @validationNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters'**
  String get validationNameTooShort;

  /// No description provided for @validationEnterFieldPrefix.
  ///
  /// In en, this message translates to:
  /// **'Please enter '**
  String get validationEnterFieldPrefix;

  /// No description provided for @validationFieldMustBeIntSuffix.
  ///
  /// In en, this message translates to:
  /// **' must be a number'**
  String get validationFieldMustBeIntSuffix;

  /// No description provided for @validationEnterPrice.
  ///
  /// In en, this message translates to:
  /// **'Please enter the price'**
  String get validationEnterPrice;

  /// No description provided for @validationPriceMustBeNumber.
  ///
  /// In en, this message translates to:
  /// **'Price must be a number'**
  String get validationPriceMustBeNumber;

  /// No description provided for @validationPriceMustBeGreaterThanZero.
  ///
  /// In en, this message translates to:
  /// **'Price must be greater than zero'**
  String get validationPriceMustBeGreaterThanZero;

  /// No description provided for @validationEnterPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get validationEnterPhone;

  /// No description provided for @validationPhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get validationPhoneInvalid;

  /// No description provided for @loginWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginWelcome;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue'**
  String get loginSubtitle;

  /// No description provided for @formLoginPage.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get formLoginPage;

  /// No description provided for @formLoginPageForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get formLoginPageForgotPassword;

  /// No description provided for @formLoginPageCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get formLoginPageCreateAccount;

  /// No description provided for @formForgetPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Recovery'**
  String get formForgetPageTitle;

  /// No description provided for @formForgetPageForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get formForgetPageForgotPassword;

  /// No description provided for @formForgetPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we will send you a link to reset your password.'**
  String get formForgetPageDescription;

  /// No description provided for @formForgetPageBackToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Sign In'**
  String get formForgetPageBackToLogin;

  /// No description provided for @formForgetPageSendRecoveryLink.
  ///
  /// In en, this message translates to:
  /// **'Send Recovery Link'**
  String get formForgetPageSendRecoveryLink;

  /// No description provided for @formRegisterPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get formRegisterPageTitle;

  /// No description provided for @formRegisterPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join Biologi educational platform'**
  String get formRegisterPageSubtitle;

  /// No description provided for @formRegisterPageTermsPrefix.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get formRegisterPageTermsPrefix;

  /// No description provided for @formRegisterPageTermsAndPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions and Privacy Policy'**
  String get formRegisterPageTermsAndPrivacy;

  /// No description provided for @formRegisterPageAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get formRegisterPageAlreadyHaveAccount;

  /// No description provided for @formEmailVerificationPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get formEmailVerificationPageTitle;

  /// No description provided for @formEmailVerificationPageHeading.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get formEmailVerificationPageHeading;

  /// No description provided for @formEmailVerificationPageSentTo.
  ///
  /// In en, this message translates to:
  /// **'We sent an activation link to'**
  String get formEmailVerificationPageSentTo;

  /// No description provided for @formEmailVerificationPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Please click the link in the email\nto activate your account.'**
  String get formEmailVerificationPageDescription;

  /// No description provided for @formEmailVerificationPageSuccess.
  ///
  /// In en, this message translates to:
  /// **'Link sent successfully'**
  String get formEmailVerificationPageSuccess;

  /// No description provided for @formEmailVerificationPageResend.
  ///
  /// In en, this message translates to:
  /// **'Resend Link'**
  String get formEmailVerificationPageResend;

  /// No description provided for @formForgetPageSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Password recovery link has been sent to your email successfully.'**
  String get formForgetPageSuccessMessage;

  /// No description provided for @coursesPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore Courses'**
  String get coursesPageTitle;

  /// No description provided for @coursesSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for a course...'**
  String get coursesSearchHint;

  /// No description provided for @coursesEmptyState.
  ///
  /// In en, this message translates to:
  /// **'No courses available'**
  String get coursesEmptyState;

  /// No description provided for @coursesRetry.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get coursesRetry;

  /// No description provided for @coursesFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get coursesFilterAll;

  /// No description provided for @coursesFilterSecondGrade.
  ///
  /// In en, this message translates to:
  /// **'Second Grade'**
  String get coursesFilterSecondGrade;

  /// No description provided for @coursesFilterThirdGrade.
  ///
  /// In en, this message translates to:
  /// **'Third Grade'**
  String get coursesFilterThirdGrade;

  /// No description provided for @courseCardStudentsSuffix.
  ///
  /// In en, this message translates to:
  /// **'students'**
  String get courseCardStudentsSuffix;

  /// No description provided for @courseCardHoursSuffix.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get courseCardHoursSuffix;

  /// No description provided for @courseCardCurrencySuffix.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get courseCardCurrencySuffix;

  /// No description provided for @courseCardFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get courseCardFree;

  /// No description provided for @courseCardViewContent.
  ///
  /// In en, this message translates to:
  /// **'View Content'**
  String get courseCardViewContent;

  /// No description provided for @courseCardFreeEnroll.
  ///
  /// In en, this message translates to:
  /// **'Free Enrollment'**
  String get courseCardFreeEnroll;

  /// No description provided for @courseCardBuy.
  ///
  /// In en, this message translates to:
  /// **'Buy Course'**
  String get courseCardBuy;

  /// No description provided for @courseFailureNetwork.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection'**
  String get courseFailureNetwork;

  /// No description provided for @courseFailureTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout'**
  String get courseFailureTimeout;

  /// No description provided for @courseFailureResourceExhausted.
  ///
  /// In en, this message translates to:
  /// **'Too many requests'**
  String get courseFailureResourceExhausted;

  /// No description provided for @courseFailureUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get courseFailureUnknown;

  /// No description provided for @myCoursesPageTitle.
  ///
  /// In en, this message translates to:
  /// **'My Courses'**
  String get myCoursesPageTitle;

  /// No description provided for @myCoursesFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get myCoursesFilterAll;

  /// No description provided for @myCoursesFilterInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get myCoursesFilterInProgress;

  /// No description provided for @myCoursesFilterCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get myCoursesFilterCompleted;

  /// No description provided for @myCoursesStatusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get myCoursesStatusInProgress;

  /// No description provided for @myCoursesStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get myCoursesStatusCompleted;

  /// No description provided for @myCoursesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Start your learning journey'**
  String get myCoursesEmptyTitle;

  /// No description provided for @myCoursesEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t enrolled in any course yet'**
  String get myCoursesEmptySubtitle;

  /// No description provided for @myCoursesEmptyCompleted.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t completed any course yet'**
  String get myCoursesEmptyCompleted;

  /// No description provided for @myCoursesEmptyInProgress.
  ///
  /// In en, this message translates to:
  /// **'No courses in progress'**
  String get myCoursesEmptyInProgress;

  /// No description provided for @myCoursesEmptyExploreButton.
  ///
  /// In en, this message translates to:
  /// **'Explore Courses'**
  String get myCoursesEmptyExploreButton;

  /// No description provided for @myCoursesContinueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get myCoursesContinueButton;

  /// No description provided for @myCoursesViewCertificate.
  ///
  /// In en, this message translates to:
  /// **'View Certificate'**
  String get myCoursesViewCertificate;

  /// No description provided for @myCoursesLessonSuffix.
  ///
  /// In en, this message translates to:
  /// **'lessons'**
  String get myCoursesLessonSuffix;

  /// No description provided for @courseDetailsTabCurriculum.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get courseDetailsTabCurriculum;

  /// No description provided for @courseDetailsTabOverview.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get courseDetailsTabOverview;

  /// No description provided for @courseDetailsTabReviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get courseDetailsTabReviews;

  /// No description provided for @courseDetailsNoContent.
  ///
  /// In en, this message translates to:
  /// **'No content available yet'**
  String get courseDetailsNoContent;

  /// No description provided for @courseDetailsAbout.
  ///
  /// In en, this message translates to:
  /// **'About Course'**
  String get courseDetailsAbout;

  /// No description provided for @courseDetailsDefaultDescription.
  ///
  /// In en, this message translates to:
  /// **'A detailed and comprehensive explanation of the Biology course focusing on understanding, practical application, and solving exercises and practice exams for excellence in secondary school.'**
  String get courseDetailsDefaultDescription;

  /// No description provided for @courseDetailsWhatYouWillGet.
  ///
  /// In en, this message translates to:
  /// **'What you\'ll get in this course'**
  String get courseDetailsWhatYouWillGet;

  /// No description provided for @courseDetailsFeatureVideos.
  ///
  /// In en, this message translates to:
  /// **'High-quality video lessons'**
  String get courseDetailsFeatureVideos;

  /// No description provided for @courseDetailsFeaturePdfs.
  ///
  /// In en, this message translates to:
  /// **'Notes and summaries in PDF format'**
  String get courseDetailsFeaturePdfs;

  /// No description provided for @courseDetailsFeatureQuizzes.
  ///
  /// In en, this message translates to:
  /// **'Assessment quizzes after each lesson'**
  String get courseDetailsFeatureQuizzes;

  /// No description provided for @courseDetailsFeatureAccess.
  ///
  /// In en, this message translates to:
  /// **'Unlimited access to content anytime'**
  String get courseDetailsFeatureAccess;

  /// No description provided for @courseDetailsReviewsBasedOn.
  ///
  /// In en, this message translates to:
  /// **'Based on 128 reviews'**
  String get courseDetailsReviewsBasedOn;

  /// No description provided for @courseDetailsContinueLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue Learning'**
  String get courseDetailsContinueLearning;

  /// No description provided for @courseMinutesSuffix.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get courseMinutesSuffix;

  /// No description provided for @courseLessonsSuffix.
  ///
  /// In en, this message translates to:
  /// **'lessons'**
  String get courseLessonsSuffix;

  /// No description provided for @courseQuestionsSuffix.
  ///
  /// In en, this message translates to:
  /// **'questions'**
  String get courseQuestionsSuffix;

  /// No description provided for @courseEducationalFile.
  ///
  /// In en, this message translates to:
  /// **'Educational file'**
  String get courseEducationalFile;

  /// No description provided for @courseMegabyteSuffix.
  ///
  /// In en, this message translates to:
  /// **'MB'**
  String get courseMegabyteSuffix;

  /// No description provided for @lessonTypeNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Lesson type not supported'**
  String get lessonTypeNotSupported;

  /// No description provided for @pdfLessonPrefix.
  ///
  /// In en, this message translates to:
  /// **'PDF Lesson'**
  String get pdfLessonPrefix;

  /// No description provided for @quizLessonPrefix.
  ///
  /// In en, this message translates to:
  /// **'Quiz'**
  String get quizLessonPrefix;

  /// No description provided for @lessonAttachmentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get lessonAttachmentsTitle;

  /// No description provided for @lessonDefaultAttachmentName.
  ///
  /// In en, this message translates to:
  /// **'Lesson Summary.pdf'**
  String get lessonDefaultAttachmentName;

  /// No description provided for @lessonNavigationPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous Lesson'**
  String get lessonNavigationPrevious;

  /// No description provided for @lessonNavigationNext.
  ///
  /// In en, this message translates to:
  /// **'Next Lesson'**
  String get lessonNavigationNext;

  /// No description provided for @videoLessonDefaultDescription.
  ///
  /// In en, this message translates to:
  /// **'In this lesson, we will explain and detail the educational content, highlighting the most important key and practical points to help you excel.'**
  String get videoLessonDefaultDescription;

  /// No description provided for @videoLessonCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed Successfully'**
  String get videoLessonCompleted;

  /// No description provided for @videoLessonMarkAsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Mark as Completed'**
  String get videoLessonMarkAsCompleted;

  /// No description provided for @videoPlayerError.
  ///
  /// In en, this message translates to:
  /// **'Failed to play video'**
  String get videoPlayerError;

  /// No description provided for @videoPlayerUnmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get videoPlayerUnmute;

  /// No description provided for @videoPlayerMute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get videoPlayerMute;

  /// No description provided for @videoPlayerPlaybackSpeed.
  ///
  /// In en, this message translates to:
  /// **'Playback Speed'**
  String get videoPlayerPlaybackSpeed;

  /// No description provided for @bottomNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavHome;

  /// No description provided for @bottomNavCourses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get bottomNavCourses;

  /// No description provided for @bottomNavMyCourses.
  ///
  /// In en, this message translates to:
  /// **'My Courses'**
  String get bottomNavMyCourses;

  /// No description provided for @bottomNavProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get bottomNavProfile;

  /// No description provided for @profileUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdateSuccess;

  /// No description provided for @profilePersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get profilePersonalInfo;

  /// No description provided for @profileName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profileName;

  /// No description provided for @profileEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmail;

  /// No description provided for @profilePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get profilePhone;

  /// No description provided for @profileAboutPlatform.
  ///
  /// In en, this message translates to:
  /// **'About Platform'**
  String get profileAboutPlatform;

  /// No description provided for @profileAboutDescription.
  ///
  /// In en, this message translates to:
  /// **'An educational platform specialized in teaching Biology for secondary school students using modern and simplified methods that combine accurate scientific content with interactive learning techniques.'**
  String get profileAboutDescription;

  /// No description provided for @profileMission.
  ///
  /// In en, this message translates to:
  /// **'Our Mission: Simplifying Science for Every Student'**
  String get profileMission;

  /// No description provided for @profileLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get profileLearnMore;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileLogout;

  /// No description provided for @profileDefaultGrade.
  ///
  /// In en, this message translates to:
  /// **'Third Secondary Grade'**
  String get profileDefaultGrade;

  /// No description provided for @profileDefaultName.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Mohamed'**
  String get profileDefaultName;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notification Preferences'**
  String get settingsNotifications;

  /// No description provided for @settingsDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingsDarkMode;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get settingsArabic;

  /// No description provided for @editNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Name'**
  String get editNameTitle;

  /// No description provided for @editCurrentNamePrefix.
  ///
  /// In en, this message translates to:
  /// **'Current name: '**
  String get editCurrentNamePrefix;

  /// No description provided for @editNewName.
  ///
  /// In en, this message translates to:
  /// **'New Name'**
  String get editNewName;

  /// No description provided for @editSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get editSaveChanges;

  /// No description provided for @editCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editCancel;

  /// No description provided for @validationEnterNewName.
  ///
  /// In en, this message translates to:
  /// **'Please enter the new name'**
  String get validationEnterNewName;

  /// No description provided for @validationNameMinChars.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters'**
  String get validationNameMinChars;

  /// No description provided for @enrollmentUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to view your courses'**
  String get enrollmentUnauthorized;

  /// No description provided for @lessonProgress.
  ///
  /// In en, this message translates to:
  /// **'Lesson'**
  String get lessonProgress;

  /// No description provided for @reviewName1.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Mohamed'**
  String get reviewName1;

  /// No description provided for @reviewComment1.
  ///
  /// In en, this message translates to:
  /// **'Excellent and simplified explanation!'**
  String get reviewComment1;

  /// No description provided for @reviewTime1.
  ///
  /// In en, this message translates to:
  /// **'2 days ago'**
  String get reviewTime1;

  /// No description provided for @reviewName2.
  ///
  /// In en, this message translates to:
  /// **'Sara Ali'**
  String get reviewName2;

  /// No description provided for @reviewComment2.
  ///
  /// In en, this message translates to:
  /// **'The notes and questions helped me a lot in reviewing.'**
  String get reviewComment2;

  /// No description provided for @reviewTime2.
  ///
  /// In en, this message translates to:
  /// **'1 week ago'**
  String get reviewTime2;

  /// No description provided for @defaultInitials.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get defaultInitials;

  /// No description provided for @orDividerText.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get orDividerText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
