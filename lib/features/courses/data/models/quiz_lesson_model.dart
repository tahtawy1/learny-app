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
  factory QuizLessonModel.fromEntity(QuizLessonEntity entity) {
    return QuizLessonModel(
      id: entity.id,
      title: entity.title,
      type: entity.type,
      isLocked: entity.isLocked,
      isCompleted: entity.isCompleted,

      passingScore: entity.passingScore,
      questions: entity.questions
          .map((e) => QuestionModel.fromEntity(e))
          .toList(),
    );
  }
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
