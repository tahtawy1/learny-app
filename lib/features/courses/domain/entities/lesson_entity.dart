import 'package:learny/core/const/lesson_type.dart';

abstract class LessonEntity {
  /// المعرف الفريد للدرس
  final String id;

  /// اسم الدرس
  final String title;

  /// نوع الدرس
  final LessonType type;

  /// هل الدرس مقفول؟
  final bool isLocked;

  /// هل الطالب أكمل الدرس؟
  final bool isCompleted;

  LessonEntity({
    required this.id,
    required this.title,

    required this.type,
    required this.isLocked,
    required this.isCompleted,
  });
}
