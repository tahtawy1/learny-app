// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get unknownError => 'An unknown error occurred, please try again.';

  @override
  String get unexpectedError => 'An unexpected error occurred.';

  @override
  String get cacheError => 'Failed to load cached data.';

  @override
  String get networkError => 'Please check your internet connection.';

  @override
  String get serverError => 'Server error, please try again later.';

  @override
  String get authError => 'Authentication failed, please try again.';

  @override
  String get exAuthInvalidCredentials => 'Invalid email or password';

  @override
  String get exAuthEmailAlreadyInUse => 'Email is already in use';

  @override
  String get exAuthWeakPassword => 'Password is too weak';

  @override
  String get exAuthNetworkError => 'Network error, please try again';

  @override
  String get exAuthTooManyRequests => 'Too many requests, please try later';

  @override
  String get exAuthUnknownPrefix => 'Unknown error';

  @override
  String get nameApp => 'Biologi';

  @override
  String get nameAppEn => 'BIOLOGI';

  @override
  String get nameFieldLabel => 'Full Name';

  @override
  String get nameFieldHint => 'Enter your full name';

  @override
  String get emailFieldLabel => 'Email';

  @override
  String get emailFieldHint => 'Enter your email';

  @override
  String get passwordFieldLabel => 'Password';

  @override
  String get passwordFieldHint => '••••••••';

  @override
  String get phoneFieldLabel => 'Phone Number';

  @override
  String get phoneFieldHint => 'Enter your phone number';

  @override
  String get validationEnterEmail => 'Please enter your email';

  @override
  String get validationEmailInvalid => 'Invalid email address';

  @override
  String get validationEnterPassword => 'Please enter your password';

  @override
  String get validationPasswordMinLength =>
      'Password must be at least 6 characters';

  @override
  String get validationEnterPasswordConfirm => 'Please confirm your password';

  @override
  String get validationPasswordMismatch => 'Passwords do not match';

  @override
  String get validationEnterName => 'Please enter your name';

  @override
  String get validationNameTooShort => 'Name must be at least 3 characters';

  @override
  String get validationEnterFieldPrefix => 'Please enter ';

  @override
  String get validationFieldMustBeIntSuffix => ' must be a number';

  @override
  String get validationEnterPrice => 'Please enter the price';

  @override
  String get validationPriceMustBeNumber => 'Price must be a number';

  @override
  String get validationPriceMustBeGreaterThanZero =>
      'Price must be greater than zero';

  @override
  String get validationEnterPhone => 'Please enter your phone number';

  @override
  String get validationPhoneInvalid => 'Invalid phone number';

  @override
  String get loginWelcome => 'Welcome back';

  @override
  String get loginSubtitle => 'Sign in to continue';

  @override
  String get formLoginPage => 'Sign In';

  @override
  String get formLoginPageForgotPassword => 'Forgot password?';

  @override
  String get formLoginPageCreateAccount => 'Create new account';

  @override
  String get formForgetPageTitle => 'Account Recovery';

  @override
  String get formForgetPageForgotPassword => 'Forgot password?';

  @override
  String get formForgetPageDescription =>
      'Enter your email and we will send you a link to reset your password.';

  @override
  String get formForgetPageBackToLogin => 'Back to Sign In';

  @override
  String get formForgetPageSendRecoveryLink => 'Send Recovery Link';

  @override
  String get formRegisterPageTitle => 'Create Account';

  @override
  String get formRegisterPageSubtitle => 'Join Biologi educational platform';

  @override
  String get formRegisterPageTermsPrefix => 'I agree to the ';

  @override
  String get formRegisterPageTermsAndPrivacy =>
      'Terms & Conditions and Privacy Policy';

  @override
  String get formRegisterPageAlreadyHaveAccount => 'Already have an account? ';

  @override
  String get formEmailVerificationPageTitle => 'Email Verification';

  @override
  String get formEmailVerificationPageHeading => 'Verify your email';

  @override
  String get formEmailVerificationPageSentTo => 'We sent an activation link to';

  @override
  String get formEmailVerificationPageDescription =>
      'Please click the link in the email\nto activate your account.';

  @override
  String get formEmailVerificationPageSuccess => 'Link sent successfully';

  @override
  String get formEmailVerificationPageResend => 'Resend Link';

  @override
  String get formForgetPageSuccessMessage =>
      'Password recovery link has been sent to your email successfully.';

  @override
  String get coursesPageTitle => 'Explore Courses';

  @override
  String get coursesSearchHint => 'Search for a course...';

  @override
  String get coursesEmptyState => 'No courses available';

  @override
  String get coursesRetry => 'Try Again';

  @override
  String get coursesFilterAll => 'All';

  @override
  String get coursesFilterSecondGrade => 'Second Grade';

  @override
  String get coursesFilterThirdGrade => 'Third Grade';

  @override
  String get courseCardStudentsSuffix => 'students';

  @override
  String get courseCardHoursSuffix => 'hours';

  @override
  String get courseCardCurrencySuffix => 'EGP';

  @override
  String get courseCardFree => 'Free';

  @override
  String get courseCardViewContent => 'View Content';

  @override
  String get courseCardFreeEnroll => 'Free Enrollment';

  @override
  String get courseCardBuy => 'Buy Course';

  @override
  String get courseFailureNetwork => 'Check your internet connection';

  @override
  String get courseFailureTimeout => 'Connection timeout';

  @override
  String get courseFailureResourceExhausted => 'Too many requests';

  @override
  String get courseFailureUnknown => 'An unexpected error occurred';

  @override
  String get myCoursesPageTitle => 'My Courses';

  @override
  String get myCoursesFilterAll => 'All';

  @override
  String get myCoursesFilterInProgress => 'In Progress';

  @override
  String get myCoursesFilterCompleted => 'Completed';

  @override
  String get myCoursesStatusInProgress => 'In Progress';

  @override
  String get myCoursesStatusCompleted => 'Completed';

  @override
  String get myCoursesEmptyTitle => 'Start your learning journey';

  @override
  String get myCoursesEmptySubtitle =>
      'You haven\'t enrolled in any course yet';

  @override
  String get myCoursesEmptyCompleted => 'You haven\'t completed any course yet';

  @override
  String get myCoursesEmptyInProgress => 'No courses in progress';

  @override
  String get myCoursesEmptyExploreButton => 'Explore Courses';

  @override
  String get myCoursesContinueButton => 'Continue';

  @override
  String get myCoursesViewCertificate => 'View Certificate';

  @override
  String get myCoursesLessonSuffix => 'lessons';

  @override
  String get courseDetailsTabCurriculum => 'Content';

  @override
  String get courseDetailsTabOverview => 'Details';

  @override
  String get courseDetailsTabReviews => 'Reviews';

  @override
  String get courseDetailsNoContent => 'No content available yet';

  @override
  String get courseDetailsAbout => 'About Course';

  @override
  String get courseDetailsDefaultDescription =>
      'A detailed and comprehensive explanation of the Biology course focusing on understanding, practical application, and solving exercises and practice exams for excellence in secondary school.';

  @override
  String get courseDetailsWhatYouWillGet => 'What you\'ll get in this course';

  @override
  String get courseDetailsFeatureVideos => 'High-quality video lessons';

  @override
  String get courseDetailsFeaturePdfs => 'Notes and summaries in PDF format';

  @override
  String get courseDetailsFeatureQuizzes =>
      'Assessment quizzes after each lesson';

  @override
  String get courseDetailsFeatureAccess =>
      'Unlimited access to content anytime';

  @override
  String get courseDetailsReviewsBasedOn => 'Based on 128 reviews';

  @override
  String get courseDetailsContinueLearning => 'Continue Learning';

  @override
  String get courseMinutesSuffix => 'min';

  @override
  String get courseLessonsSuffix => 'lessons';

  @override
  String get courseQuestionsSuffix => 'questions';

  @override
  String get courseEducationalFile => 'Educational file';

  @override
  String get courseMegabyteSuffix => 'MB';

  @override
  String get lessonTypeNotSupported => 'Lesson type not supported';

  @override
  String get pdfLessonPrefix => 'PDF Lesson';

  @override
  String get quizLessonPrefix => 'Quiz';

  @override
  String get lessonAttachmentsTitle => 'Attachments';

  @override
  String get lessonDefaultAttachmentName => 'Lesson Summary.pdf';

  @override
  String get lessonNavigationPrevious => 'Previous Lesson';

  @override
  String get lessonNavigationNext => 'Next Lesson';

  @override
  String get videoLessonDefaultDescription =>
      'In this lesson, we will explain and detail the educational content, highlighting the most important key and practical points to help you excel.';

  @override
  String get videoLessonCompleted => 'Completed Successfully';

  @override
  String get videoLessonMarkAsCompleted => 'Mark as Completed';

  @override
  String get videoPlayerError => 'Failed to play video';

  @override
  String get videoPlayerUnmute => 'Unmute';

  @override
  String get videoPlayerMute => 'Mute';

  @override
  String get videoPlayerPlaybackSpeed => 'Playback Speed';

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavCourses => 'Courses';

  @override
  String get bottomNavMyCourses => 'My Courses';

  @override
  String get bottomNavProfile => 'Profile';

  @override
  String get profileUpdateSuccess => 'Profile updated successfully';

  @override
  String get profilePersonalInfo => 'Personal Information';

  @override
  String get profileName => 'Name';

  @override
  String get profileEmail => 'Email';

  @override
  String get profilePhone => 'Phone';

  @override
  String get profileAboutPlatform => 'About Platform';

  @override
  String get profileAboutDescription =>
      'An educational platform specialized in teaching Biology for secondary school students using modern and simplified methods that combine accurate scientific content with interactive learning techniques.';

  @override
  String get profileMission =>
      'Our Mission: Simplifying Science for Every Student';

  @override
  String get profileLearnMore => 'Learn More';

  @override
  String get profileLogout => 'Sign Out';

  @override
  String get profileDefaultGrade => 'Third Secondary Grade';

  @override
  String get profileDefaultName => 'Ahmed Mohamed';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsNotifications => 'Notification Preferences';

  @override
  String get settingsDarkMode => 'Dark Mode';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsArabic => 'Arabic';

  @override
  String get editNameTitle => 'Edit Name';

  @override
  String get editCurrentNamePrefix => 'Current name: ';

  @override
  String get editNewName => 'New Name';

  @override
  String get editSaveChanges => 'Save Changes';

  @override
  String get editCancel => 'Cancel';

  @override
  String get validationEnterNewName => 'Please enter the new name';

  @override
  String get validationNameMinChars => 'Name must be at least 3 characters';

  @override
  String get enrollmentUnauthorized => 'Please sign in to view your courses';

  @override
  String get lessonProgress => 'Lesson';

  @override
  String get reviewName1 => 'Ahmed Mohamed';

  @override
  String get reviewComment1 => 'Excellent and simplified explanation!';

  @override
  String get reviewTime1 => '2 days ago';

  @override
  String get reviewName2 => 'Sara Ali';

  @override
  String get reviewComment2 =>
      'The notes and questions helped me a lot in reviewing.';

  @override
  String get reviewTime2 => '1 week ago';

  @override
  String get defaultInitials => 'AM';

  @override
  String get orDividerText => 'OR';
}
