class AppException implements Exception {
  final String message;
  const AppException({required this.message});
}

class CacheException extends AppException {
  const CacheException({required super.message});
}

class ServerException extends AppException {
  const ServerException({required super.message});
}

class NetworkException extends AppException {
  const NetworkException({required super.message});
}

class AuthException extends AppException {
  final String code;
  const AuthException({required this.code, required super.message});
}
