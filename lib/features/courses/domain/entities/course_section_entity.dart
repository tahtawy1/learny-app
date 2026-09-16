import 'package:learny/features/courses/domain/entities/lesson_entity.dart';

class CourseSectionEntity {
  // المعرف الفريد للوحدة / الفصل
  final String id;

  // معرف الكورس الذي تنتمي إليه الوحدة
  final String courseId;

  // اسم الوحدة / الفصل
  final String title;

  // وصف مختصر للوحدة، ويمكن أن يكون غير موجود
  final String? description;

  // قائمة الدروس الموجودة داخل الوحدة
  final List<LessonEntity> lessons;

  CourseSectionEntity({
    required this.id,
    required this.courseId,
    required this.title,
    this.description,

    required this.lessons,
  });
}
