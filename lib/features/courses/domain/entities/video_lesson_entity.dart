import 'package:learny/features/courses/domain/entities/lesson_entity.dart';

class VideoLessonEntity extends LessonEntity {
  final String videoUrl;
  final int durationMinutes;

  VideoLessonEntity({
    required super.id,
    required super.title,

    required super.type,
    required super.isLocked,
    required super.isCompleted,
    required this.videoUrl,
    required this.durationMinutes,
  });
}
