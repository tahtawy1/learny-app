import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/features/courses/domain/entities/pdf_lesson_entity.dart';

class PdfLessonPage extends StatelessWidget {
  final PdfLessonEntity lesson;

  const PdfLessonPage({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: Center(
        child: Text(
          '${AppLocalization.instance.pdfLessonPrefix}: ${lesson.title}',
        ),
      ),
    );
  }
}
