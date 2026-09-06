import 'package:learny/core/const/lesson_type.dart';
import 'package:learny/features/courses/data/models/exam_lesson_model.dart';
import 'package:learny/features/courses/data/models/pdf_lesson_model.dart';
import 'package:learny/features/courses/data/models/question_model.dart';
import 'package:learny/features/courses/data/models/quiz_lesson_model.dart';
import 'package:learny/features/courses/data/models/video_lesson_model.dart';
import 'package:learny/features/courses/domain/entities/lesson_entity.dart';

abstract class LessonModel extends LessonEntity {
  LessonModel({
    required super.id,
    required super.title,
    required super.type,
    required super.isLocked,
    required super.isCompleted,
  });

  Map<String, dynamic> toJson();
  factory LessonModel.fromJson(Map<String, dynamic> json) {
    final type = LessonType.values.firstWhere(
      (e) => e.name == json['type'],
      orElse: () => LessonType.video,
    );

    switch (type) {
      case LessonType.video:
        return VideoLessonModel(
          id: json['id'],
          title: json['title'],
          type: type,
          isLocked: json['isLocked'] ?? false,
          isCompleted: json['isCompleted'] ?? false,
          videoUrl: json['videoUrl'],
          durationMinutes: json['durationMinutes'] ?? 0,
        );

      case LessonType.pdf:
        return PdfLessonModel(
          id: json['id'],
          title: json['title'],
          type: type,
          isLocked: json['isLocked'] ?? false,
          isCompleted: json['isCompleted'] ?? false,
          pdfUrl: json['pdfUrl'],
        );

      case LessonType.quiz:
        return QuizLessonModel(
          id: json['id'],
          title: json['title'],

          type: type,
          isLocked: json['isLocked'] ?? false,
          isCompleted: json['isCompleted'] ?? false,

          passingScore: (json['passingScore'] ?? 0).toDouble(),
          questions: (json['questions'] as List<dynamic>? ?? [])
              .map((e) => QuestionModel.fromJson(e))
              .toList(),
        );

      case LessonType.exam:
        return ExamLessonModel(
          id: json['id'],
          title: json['title'],
          type: type,
          isLocked: json['isLocked'] ?? false,
          isCompleted: json['isCompleted'] ?? false,
          questionsCount: json['questionsCount'] ?? 0,
          totalScore: (json['totalScore'] ?? 0).toDouble(),
          durationMinutes: json['durationMinutes'] ?? 0,
        );
    }
  }
}
