import 'package:learny/features/courses/domain/entities/course_section_entity.dart';

class CourseEntity {
  // المعرف الفريد للكورس
  final String id;

  // اسم الكورس
  final String title;

  // عنوان فرعي أو وصف مختصر للكورس
  final String subtitle;

  // الوصف الكامل وتفاصيل الكورس
  final String description;

  // رابط صورة الكورس
  final String imageUrl;

  // معرف التصنيف أو المرحلة الدراسية مثل: ثاني ثانوي
  final String categoryId;

  // السعر الحالي للكورس
  final double price;

  // السعر القديم للكورس في حالة وجود خصم
  final double? oldPrice;

  // إجمالي مدة الكورس بالدقائق
  final int durationMinutes;

  // عدد الطلاب المشتركين في الكورس
  final int studentsCount;

  // تحديد إذا كان الكورس مجاني أم لا
  final bool isFree;

  // تحديد إذا كان الكورس منشور ومتاح للطلاب أم لا
  final bool isPublished;

  // تاريخ إنشاء الكورس
  final DateTime createdAt;
  final List<CourseSectionEntity> courseSections;
  // تاريخ آخر تعديل على الكورس
  final DateTime? updatedAt;

  CourseEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.categoryId,
    required this.price,
    this.oldPrice,

    required this.durationMinutes,
    required this.studentsCount,
    required this.isFree,
    required this.isPublished,
    required this.createdAt,
    this.updatedAt,
    required this.courseSections,
  });
}
