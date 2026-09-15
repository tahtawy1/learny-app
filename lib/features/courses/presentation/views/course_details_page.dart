import 'package:flutter/material.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';
import 'package:learny/features/courses/presentation/widgets/course_details_body.dart';

class CourseDetailsPage extends StatelessWidget {
  final CourseEntity course;

  const CourseDetailsPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: CourseDetailsBody(course: course),
    );
  }
}
