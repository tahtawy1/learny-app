import 'package:learny/features/courses/domain/entities/lesson_entity.dart';

class PdfLessonEntity extends LessonEntity {
  final String pdfUrl;

  PdfLessonEntity({
    required super.id,
    required super.title,

    required super.type,
    required super.isLocked,
    required super.isCompleted,
    required this.pdfUrl,
  });
}
