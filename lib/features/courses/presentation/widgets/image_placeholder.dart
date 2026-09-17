import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key, required this.courseEntity});

  final CourseEntity courseEntity;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      courseEntity.imageUrl,
      fit: BoxFit.cover,

      errorBuilder: (context, url, error) {
        return Container(
          decoration: BoxDecoration(
            color: context.colors.primaryContainer,
            image: const DecorationImage(
              image: AssetImage('assets/course_placeholder.png'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
