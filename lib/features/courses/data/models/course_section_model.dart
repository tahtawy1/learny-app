import 'package:learny/features/courses/data/models/lesson_model.dart';
import 'package:learny/features/courses/domain/entities/course_section_entity.dart';

class CourseSectionModel extends CourseSectionEntity {
  CourseSectionModel({
    required super.id,
    required super.courseId,
    required super.title,
    super.description,

    required super.lessons,
  });
  factory CourseSectionModel.fromEntity(CourseSectionEntity entity) {
    return CourseSectionModel(
      id: entity.id,
      courseId: entity.courseId,
      title: entity.title,
      description: entity.description,

      lessons: entity.lessons.map((e) => LessonModel.fromEntity(e)).toList(),
    );
  }
  factory CourseSectionModel.fromJson(Map<String, dynamic> json) {
    return CourseSectionModel(
      id: json['id'],
      courseId: json['courseId'],
      title: json['title'],
      description: json['description'],

      lessons: (json['lessons'] as List<dynamic>? ?? [])
          .map((e) => LessonModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'title': title,
      'description': description,

      'lessons': lessons
          .map((e) => LessonModel.fromEntity(e).toJson())
          .toList(),
    };
  }
}
