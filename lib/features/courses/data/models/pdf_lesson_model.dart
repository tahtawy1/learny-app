import 'package:learny/features/courses/data/models/lesson_model.dart';
import 'package:learny/features/courses/domain/entities/pdf_lesson_entity.dart';

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

  factory PdfLessonModel.fromEntity(PdfLessonEntity entity) {
    return PdfLessonModel(
      id: entity.id,
      title: entity.title,
      type: entity.type,
      isLocked: entity.isLocked,
      isCompleted: entity.isCompleted,
      pdfUrl: entity.pdfUrl,
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
      'pdfUrl': pdfUrl,
    };
  }
}
