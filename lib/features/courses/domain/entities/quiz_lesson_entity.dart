import 'package:learny/features/courses/domain/entities/lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/question_entity.dart';

class QuizLessonEntity extends LessonEntity {
  /// درجة النجاح المطلوبة
  final double passingScore;

  /// مدة الامتحان بالدقائق
  final int durationMinutes;
  final List<QuestionEntity> questions;
  QuizLessonEntity({
    required super.id,
    required super.title,
    required super.type,
    required super.isLocked,
    required super.isCompleted,

    required this.passingScore,
    required this.questions,
    required this.durationMinutes,
  });
}
