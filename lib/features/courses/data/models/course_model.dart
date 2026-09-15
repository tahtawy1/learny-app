import 'package:learny/features/courses/data/models/course_section_model.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';

class CourseModel extends CourseEntity {
  CourseModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.description,
    required super.imageUrl,
    required super.categoryId,
    required super.price,
    super.oldPrice,

    required super.durationMinutes,
    required super.studentsCount,
    required super.isFree,
    required super.isPublished,
    required super.createdAt,
    super.updatedAt,
    required super.courseSections,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      categoryId: json['categoryId'],
      price: (json['price'] ?? 0).toDouble(),
      oldPrice: json['oldPrice']?.toDouble(),

      durationMinutes: json['durationMinutes'] ?? 0,
      studentsCount: json['studentsCount'] ?? 0,
      isFree: json['isFree'] ?? false,
      isPublished: json['isPublished'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      courseSections: (json['courseSections'] as List<dynamic>? ?? [])
          .map(
            (section) =>
                CourseSectionModel.fromJson(section as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'price': price,
      'oldPrice': oldPrice,
      'courseSections': courseSections
          .map((e) => CourseSectionModel.fromEntity(e).toJson())
          .toList(),
      'durationMinutes': durationMinutes,
      'studentsCount': studentsCount,
      'isFree': isFree,
      'isPublished': isPublished,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
