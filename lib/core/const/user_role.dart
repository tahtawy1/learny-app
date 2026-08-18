enum UserRole { student, teacher, admin }

UserRole userRoleFromJson(String value) {
  return switch (value) {
    'student' => UserRole.student,
    'teacher' => UserRole.teacher,
    'admin' => UserRole.admin,
    _ => throw FormatException('Unknown user role: $value'),
  };
}
