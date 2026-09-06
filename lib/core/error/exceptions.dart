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
