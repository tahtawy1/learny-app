import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/features/courses/domain/entities/quiz_lesson_entity.dart';

class QuizLessonPage extends StatelessWidget {
  final QuizLessonEntity lesson;

  const QuizLessonPage({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: Center(
        child: Text(
          '${AppLocalization.instance.quizLessonPrefix}: ${lesson.title}',
        ),
      ),
    );
  }
}
