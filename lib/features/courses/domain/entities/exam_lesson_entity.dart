import 'package:learny/features/courses/domain/entities/lesson_entity.dart';

class ExamLessonEntity extends LessonEntity {
  /// عدد أسئلة الامتحان
  final int questionsCount;

  /// الدرجة الكلية للامتحان
  final double totalScore;

  /// مدة الامتحان بالدقائق
  final int durationMinutes;

  ExamLessonEntity({
    required super.id,
    required super.title,

    required super.type,
    required super.isLocked,
    required super.isCompleted,
    required this.questionsCount,
    required this.totalScore,
    required this.durationMinutes,
  });
}
