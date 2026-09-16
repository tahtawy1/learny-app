import 'package:learny/core/error/exceptions.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';

abstract class Failure {
  final String message;

  const Failure({required this.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

class AuthFailure implements Failure {
  @override
  final String message;

  const AuthFailure._({required this.message});

  factory AuthFailure.invalidCredentials() => AuthFailure._(
    message: AppLocalizationsAr.instance.exAuthInvalidCredentials,
  );

  factory AuthFailure.emailAlreadyInUse() => AuthFailure._(
    message: AppLocalizationsAr.instance.exAuthEmailAlreadyInUse,
  );

  factory AuthFailure.weakPassword() =>
      AuthFailure._(message: AppLocalizationsAr.instance.exAuthWeakPassword);

  factory AuthFailure.networkError() =>
      AuthFailure._(message: AppLocalizationsAr.instance.exAuthNetworkError);

  factory AuthFailure.tooManyRequests() =>
      AuthFailure._(message: AppLocalizationsAr.instance.exAuthTooManyRequests);

  factory AuthFailure.unknown([String? details]) => AuthFailure._(
    message:
        '${AppLocalizationsAr.instance.exAuthUnknownPrefix}${details != null ? ' $details' : ''}',
  );

  @override
  String toString() => 'AuthFailure(message: $message)';
}

class AuthExceptionMapper {
  static AuthFailure map(AuthException exception) {
    switch (exception.code) {
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return AuthFailure.invalidCredentials();

      case 'email-already-in-use':
        return AuthFailure.emailAlreadyInUse();

      case 'weak-password':
        return AuthFailure.weakPassword();
      case 'No_Internet_connection':
      case 'The_connection_has_timed_out':
      case 'network-request-failed':
        return AuthFailure.networkError();

      case 'too-many-requests':
        return AuthFailure.tooManyRequests();

      default:
        return AuthFailure.unknown();
    }
  }
}

class CourseFailure extends Failure {
  const CourseFailure({required super.message});

  factory CourseFailure.networkError() =>
      CourseFailure(message: AppLocalizationsAr.instance.courseFailureNetwork);

  factory CourseFailure.timeout() =>
      CourseFailure(message: AppLocalizationsAr.instance.courseFailureTimeout);

  factory CourseFailure.resourceExhausted() => CourseFailure(
    message: AppLocalizationsAr.instance.courseFailureResourceExhausted,
  );

  factory CourseFailure.unknown() =>
      CourseFailure(message: AppLocalizationsAr.instance.courseFailureUnknown);
}

class CourseExceptionMapper {
  static CourseFailure map(CourseException exception) {
    switch (exception.code) {
      case 'unavailable':
      case 'network-request-failed':
      case 'No_Internet_connection':
        return CourseFailure.networkError();

      case 'deadline-exceeded':
      case 'The_connection_has_timed_out':
        return CourseFailure.timeout();
      case 'resource-exhausted':
        return CourseFailure.resourceExhausted();
      default:
        return CourseFailure.unknown();
    }
  }
}

class EnrollmentFailure extends Failure {
  const EnrollmentFailure({required super.message});

  factory EnrollmentFailure.networkError() =>
      EnrollmentFailure(message: AppLocalizationsAr.instance.networkError);

  factory EnrollmentFailure.unauthorized() =>
      EnrollmentFailure(message: AppLocalizationsAr.instance.enrollmentUnauthorized);

  factory EnrollmentFailure.unknown() =>
      EnrollmentFailure(message: AppLocalizationsAr.instance.unexpectedError);
}
