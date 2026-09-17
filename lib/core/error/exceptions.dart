import 'package:learny/core/error/failure.dart';

class AppException implements Exception {
  final String code;
  const AppException({required this.code});
}

class CacheException extends AppException {
  const CacheException({required super.code});
}

class ServerException extends AppException {
  const ServerException({required super.code});
}

class NetworkException extends AppException {
  const NetworkException({required super.code});
}

class AuthException extends AppException {
  const AuthException({required super.code});
}

class CourseException extends AppException {
  const CourseException({required super.code});
}

class EnrollmentException extends AppException {
  const EnrollmentException({required super.code});
}

class EnrollmentExceptionMapper {
  static EnrollmentFailure map(EnrollmentException exception) {
    switch (exception.code) {
      case 'unavailable':
      case 'network-request-failed':
      case 'No_Internet_connection':
        return EnrollmentFailure.networkError();

      case 'user_not_logged_in':
        return EnrollmentFailure.unauthorized();

      default:
        return EnrollmentFailure.unknown();
    }
  }
}
