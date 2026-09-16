import 'package:flutter/material.dart';
import 'package:learny/core/const/lesson_type.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/features/courses/domain/entities/lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/pdf_lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/quiz_lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/video_lesson_entity.dart';
import 'package:learny/features/courses/presentation/views/pdf_lesson_page.dart';
import 'package:learny/features/courses/presentation/views/quiz_lesson_page.dart';
import 'package:learny/features/courses/presentation/views/video_lesson_page.dart';

class LessonDetailsPage extends StatelessWidget {
  final LessonEntity lesson;

  const LessonDetailsPage({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    switch (lesson.type) {
      case LessonType.video:
        return VideoLessonPage(lesson: lesson as VideoLessonEntity);

      case LessonType.pdf:
        return PdfLessonPage(lesson: lesson as PdfLessonEntity);

      case LessonType.quiz:
        return QuizLessonPage(lesson: lesson as QuizLessonEntity);

      default:
        return Scaffold(
          appBar: AppBar(title: Text(lesson.title)),
          body: Center(
            child: Text(AppLocalization.instance.lessonTypeNotSupported),
          ),
        );
    }
  }
}
