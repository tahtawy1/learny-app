import 'package:learny/features/courses/data/models/lesson_model.dart';
import 'package:learny/features/courses/domain/entities/exam_lesson_entity.dart';

class ExamLessonModel extends LessonModel {
  /// عدد أسئلة الامتحان
  final int questionsCount;

  /// الدرجة الكلية للامتحان
  final double totalScore;

  /// مدة الامتحان بالدقائق
  final int durationMinutes;

  ExamLessonModel({
    required super.id,
    required super.title,

    required super.type,
    required super.isLocked,
    required super.isCompleted,
    required this.questionsCount,
    required this.totalScore,
    required this.durationMinutes,
  });
  factory ExamLessonModel.fromEntity(ExamLessonEntity entity) {
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
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,

      'type': type.name,
      'isLocked': isLocked,
      'isCompleted': isCompleted,
      'questionsCount': questionsCount,
      'totalScore': totalScore,
      'durationMinutes': durationMinutes,
    };
  }
}
