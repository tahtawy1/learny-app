import 'package:learny/features/courses/domain/entities/question_entity.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel({
    required super.id,
    required super.question,
    required super.options,
    required super.correctAnswer,
    required super.score,

    super.userAnswer,
    super.answerExplanation,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      options: List<String>.from(json['options'] ?? []),
      correctAnswer: json['correctAnswer'] ?? 0,
      score: (json['score'] ?? 0).toDouble(),
      userAnswer: json['userAnswer'],
      answerExplanation: json['answerExplanation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'score': score,
      'userAnswer': userAnswer,
      'answerExplanation': answerExplanation,
    };
  }
}
