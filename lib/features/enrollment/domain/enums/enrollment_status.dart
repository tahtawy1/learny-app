enum EnrollmentStatus {
  pending,
  active,
  inactive;

  static EnrollmentStatus fromString(String? value) {
    return EnrollmentStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => EnrollmentStatus.active,
    );
  }
}

enum EnrollmentFilter {
  all,
  inProgress,
  completed,
}
