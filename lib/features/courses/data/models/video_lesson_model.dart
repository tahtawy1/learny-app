import 'package:learny/features/courses/data/models/lesson_model.dart';

class VideoLessonModel extends LessonModel {
  final String videoUrl;
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
