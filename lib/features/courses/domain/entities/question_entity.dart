class QuestionEntity {
  /// المعرف الفريد للسؤال
  final String id;

  /// نص السؤال
  final String question;

  /// الاختيارات
  final List<String> options;

  /// الإجابة الصحيحة
  final int correctAnswer;

  /// درجة السؤال
  final double score;

  /// إجابة المستخدم
  final int? userAnswer;

  /// توضيح الإجابة الصحيحة
  final String? answerExplanation;

  QuestionEntity({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.score,

    this.userAnswer,
    this.answerExplanation,
  });
}
