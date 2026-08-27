import 'package:learny/core/const/user_role.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.email,
    super.id,
    super.name,
    super.emailVerified,
    super.isBlock,
    super.role,
    super.password,
    super.phone,
  });

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      emailVerified: entity.emailVerified,
      isBlock: entity.isBlock,
      role: entity.role,
      password: entity.password,
      phone: entity.phone,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      email: json['email'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      isBlock: json['isBlock'] as bool?,
      role: json['role'] != null
          ? UserRole.values.byName(json['role'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'emailVerified': emailVerified ?? false,
      'isBlock': isBlock ?? false,
      'role': role?.name ?? UserRole.student.name,
    };
  }
}
