import 'package:learny/features/courses/data/models/lesson_model.dart';
import 'package:learny/features/courses/domain/entities/video_lesson_entity.dart';

class VideoLessonModel extends LessonModel implements VideoLessonEntity {
  @override
  final String videoUrl;
  @override
  final int durationMinutes;

  VideoLessonModel({
    required super.id,
    required super.title,

    required super.type,
    required super.isLocked,
    required super.isCompleted,
    required this.videoUrl,
    required this.durationMinutes,
  });
  factory VideoLessonModel.fromEntity(VideoLessonEntity entity) {
    return VideoLessonModel(
      id: entity.id,
      title: entity.title,

      type: entity.type,
      isLocked: entity.isLocked,
      isCompleted: entity.isCompleted,
      videoUrl: entity.videoUrl,
      durationMinutes: entity.durationMinutes,
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
      'videoUrl': videoUrl,
      'durationMinutes': durationMinutes,
    };
  }
}
