import 'package:learny/core/const/lesson_type.dart';
import 'package:learny/features/courses/data/models/exam_lesson_model.dart';
import 'package:learny/features/courses/data/models/pdf_lesson_model.dart';
import 'package:learny/features/courses/data/models/question_model.dart';
import 'package:learny/features/courses/data/models/quiz_lesson_model.dart';
import 'package:learny/features/courses/data/models/video_lesson_model.dart';
import 'package:learny/features/courses/domain/entities/exam_lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/pdf_lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/quiz_lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/video_lesson_entity.dart';

abstract class LessonModel extends LessonEntity {
  LessonModel({
    required super.id,
    required super.title,
    required super.type,
    required super.isLocked,
    required super.isCompleted,
  });
  factory LessonModel.fromEntity(LessonEntity entity) {
    if (entity is LessonModel) return entity;
    if (entity is VideoLessonEntity) {
      return VideoLessonModel(
        id: entity.id,
        title: entity.title,
        type: entity.type,
        isLocked: entity.isLocked,
        isCompleted: entity.isCompleted,
        videoUrl: entity.videoUrl,
        durationMinutes: entity.durationMinutes,
      );
    } else if (entity is PdfLessonEntity) {
      return PdfLessonModel(
        id: entity.id,
        title: entity.title,
        type: entity.type,
        isLocked: entity.isLocked,
        isCompleted: entity.isCompleted,
        pdfUrl: entity.pdfUrl,
      );
    } else if (entity is QuizLessonEntity) {
      return QuizLessonModel(
        id: entity.id,
        title: entity.title,
        type: entity.type,
        isLocked: entity.isLocked,
        isCompleted: entity.isCompleted,
        passingScore: entity.passingScore,
        questions: entity.questions
            .map(
              (q) => QuestionModel(
                id: q.id,
                question: q.question,
                options: q.options,
                correctAnswer: q.correctAnswer,
                score: q.score,
                userAnswer: q.userAnswer,
                answerExplanation: q.answerExplanation,
              ),
            )
            .toList(),
        durationMinutes: entity.durationMinutes,
      );
    } else if (entity is ExamLessonEntity) {
      return ExamLessonModel(
        id: entity.id,
        title: entity.title,
        type: entity.type,
        isLocked: entity.isLocked,
        isCompleted: entity.isCompleted,
        questionsCount: entity.questionsCount,
        totalScore: entity.totalScore,
        durationMinutes: entity.durationMinutes,
      );
    }

    throw UnsupportedError(
      'Unsupported lesson entity type: ${entity.runtimeType}',
    );
  }

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
          durationMinutes: json["durationMinutes"],
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
