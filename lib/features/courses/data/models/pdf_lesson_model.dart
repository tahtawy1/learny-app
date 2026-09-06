import 'package:learny/features/courses/data/models/lesson_model.dart';

class PdfLessonModel extends LessonModel {
  final String pdfUrl;

  PdfLessonModel({
    required super.id,
    required super.title,

    required super.type,
    required super.isLocked,
    required super.isCompleted,
    required this.pdfUrl,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type.name,
      'isLocked': isLocked,
      'isCompleted': isCompleted,
      'pdfUrl': pdfUrl,
    };
  }
}
