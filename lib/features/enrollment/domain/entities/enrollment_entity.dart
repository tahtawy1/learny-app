import 'package:learny/features/enrollment/domain/enums/enrollment_status.dart';

class EnrollmentEntity {
  final String id;
  final String courseId;
  final String userId;
  final EnrollmentStatus status;
  final DateTime enrolledAt;
  final double completedLessonsCount;
  final double totalLessonsCount;
  final String lastAccessedLessonId;
  final DateTime lastAccessAt;
  final DateTime updatedAt;
  final String? courseTitle;
  final String? courseImageUrl;

  EnrollmentEntity({
    required this.id,
    required this.courseId,
    required this.userId,
    required this.enrolledAt,
    required this.status,
    required this.completedLessonsCount,
    required this.totalLessonsCount,
    required this.lastAccessAt,
    required this.lastAccessedLessonId,
    required this.updatedAt,
    this.courseTitle,
    this.courseImageUrl,
  });

  double get progress => totalLessonsCount > 0
      ? (completedLessonsCount / totalLessonsCount).clamp(0.0, 1.0)
      : 0.0;

  bool get isCompleted =>
      totalLessonsCount > 0 && completedLessonsCount >= totalLessonsCount;

  EnrollmentEntity copyWith({
    String? id,
    String? courseId,
    String? userId,
    EnrollmentStatus? status,
    DateTime? enrolledAt,
    double? completedLessonsCount,
    double? totalLessonsCount,
    String? lastAccessedLessonId,
    DateTime? lastAccessAt,
    DateTime? updatedAt,
    String? courseTitle,
    String? courseImageUrl,
  }) {
    return EnrollmentEntity(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      enrolledAt: enrolledAt ?? this.enrolledAt,
      completedLessonsCount:
          completedLessonsCount ?? this.completedLessonsCount,
      totalLessonsCount: totalLessonsCount ?? this.totalLessonsCount,
      lastAccessedLessonId:
          lastAccessedLessonId ?? this.lastAccessedLessonId,
      lastAccessAt: lastAccessAt ?? this.lastAccessAt,
      updatedAt: updatedAt ?? this.updatedAt,
      courseTitle: courseTitle ?? this.courseTitle,
      courseImageUrl: courseImageUrl ?? this.courseImageUrl,
    );
  }
}
