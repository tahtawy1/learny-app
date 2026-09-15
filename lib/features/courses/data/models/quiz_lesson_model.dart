import 'package:learny/features/courses/data/models/lesson_model.dart';
import 'package:learny/features/courses/data/models/question_model.dart';
import 'package:learny/features/courses/domain/entities/quiz_lesson_entity.dart';

class QuizLessonModel extends LessonModel implements QuizLessonEntity {
  /// درجة النجاح المطلوبة
  @override
  final double passingScore;

  @override
  final List<QuestionModel> questions;

  QuizLessonModel({
    required super.id,
    required super.title,
    required super.type,
    required super.isLocked,
    required super.isCompleted,
    required this.passingScore,
    required this.questions,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type.name,
      'isLocked': isLocked,
      'isCompleted': isCompleted,
      'passingScore': passingScore,
      'questions': questions.map((e) => e.toJson()).toList(),
    };
  }
}
