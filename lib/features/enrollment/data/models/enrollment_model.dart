import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learny/features/enrollment/domain/entities/enrollment_entity.dart';
import 'package:learny/features/enrollment/domain/enums/enrollment_status.dart';

class EnrollmentModel extends EnrollmentEntity {
  EnrollmentModel({
    required super.id,
    required super.courseId,
    required super.userId,
    required super.enrolledAt,
    required super.status,
    required super.completedLessonsCount,
    required super.totalLessonsCount,
    required super.lastAccessAt,
    required super.lastAccessedLessonId,
    required super.updatedAt,
  });

  factory EnrollmentModel.fromEntity(EnrollmentEntity entity) {
    return EnrollmentModel(
      id: entity.id,
      courseId: entity.courseId,
      userId: entity.userId,
      enrolledAt: entity.enrolledAt,
      status: entity.status,
      completedLessonsCount: entity.completedLessonsCount,
      totalLessonsCount: entity.totalLessonsCount,
      lastAccessAt: entity.lastAccessAt,
      lastAccessedLessonId: entity.lastAccessedLessonId,
      updatedAt: entity.updatedAt,
    );
  }

  static DateTime _parseDateTime(dynamic value) {
    if (value is Timestamp) {
      return value.toDate();
    } else if (value is String) {
      return DateTime.tryParse(value) ?? DateTime.now();
    } else if (value is DateTime) {
      return value;
    }
    return DateTime.now();
  }

  factory EnrollmentModel.fromJson(Map<String, dynamic> json) {
    return EnrollmentModel(
      id: (json['id'] as String?) ?? '',
      courseId: (json['courseId'] as String?) ?? '',
      userId: (json['userId'] as String?) ?? '',
      enrolledAt: _parseDateTime(json['enrolledAt']),
      status: json['status'] is EnrollmentStatus
          ? json['status'] as EnrollmentStatus
          : EnrollmentStatus.fromString(json['status'] as String?),
      completedLessonsCount:
          (json['completedLessonsCount'] as num?)?.toDouble() ?? 0.0,
      totalLessonsCount:
          (json['totalLessonsCount'] as num?)?.toDouble() ?? 0.0,
      lastAccessAt: _parseDateTime(json['lastAccessAt']),
      lastAccessedLessonId:
          (json['lastAccessedLessonId'] as String?) ?? '',
      updatedAt: _parseDateTime(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'userId': userId,
      'enrolledAt': enrolledAt.toIso8601String(),
      'status': status.name,
      'completedLessonsCount': completedLessonsCount,
      'totalLessonsCount': totalLessonsCount,
      'lastAccessAt': lastAccessAt.toIso8601String(),
      'lastAccessedLessonId': lastAccessedLessonId,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  EnrollmentEntity toEntity() {
    return EnrollmentEntity(
      id: id,
      courseId: courseId,
      userId: userId,
      enrolledAt: enrolledAt,
      status: status,
      completedLessonsCount: completedLessonsCount,
      totalLessonsCount: totalLessonsCount,
      lastAccessAt: lastAccessAt,
      lastAccessedLessonId: lastAccessedLessonId,
      updatedAt: updatedAt,
    );
  }
}
