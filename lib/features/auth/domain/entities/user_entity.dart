import 'package:learny/core/const/user_role.dart';

class UserEntity {
  final String? id;
  final String email;
  final String? name;
  final String? phone;

  final bool? emailVerified;
  final bool? isBlock;
  final UserRole? role;
  final String? password; // Add the password field

  const UserEntity({
    required this.email,

    this.id,
    this.name,
    this.emailVerified,
    this.isBlock,
    this.role,
    this.password,
    this.phone,
  });
}
