import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/features/courses/domain/entities/quiz_lesson_entity.dart';

class QuizLessonPage extends StatefulWidget {
  final QuizLessonEntity lesson;

  const QuizLessonPage({super.key, required this.lesson});

  @override
  State<QuizLessonPage> createState() => _QuizLessonPageState();
}

class _QuizLessonPageState extends State<QuizLessonPage> {
  int numberPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TimeExam(durationMinutes: widget.lesson.durationMinutes),
        title: Text(widget.lesson.title),
      ),
      body: Column(
        children: [
          Slider(
            value: numberPage + 1,
            onChanged: null,
            activeColor: context.colors.onPrimary,
            inactiveColor: context.colors.surface,
          ),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border(right: BorderSide(color: AppColors.blue)),
              ),
              child: Text(widget.lesson.questions[0].question),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeExam extends StatefulWidget {
  const TimeExam({super.key, required this.durationMinutes});
  final int durationMinutes;

  @override
  State<TimeExam> createState() => _TimeExamState();
}

class _TimeExamState extends State<TimeExam> {
  late Timer timer;
  int durationSeconds = 0;
  @override
  void initState() {
    // TODO: implement initState
    timeIsStart();
    super.initState();
  }

  void timeIsStart() {
    durationSeconds = widget.durationMinutes * 60; //6
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      durationSeconds--;
      setState(() {});
    });
  }

  void timeIsEnd() {
    timer.cancel();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timeIsEnd();
    super.dispose();
  }

  String viewTimerBySM(int durationSeconds) {
    int durationM = durationSeconds ~/ 60;
    double durationS = durationSeconds % 60;
    return "$durationM:$durationS";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [Icon(Icons.timer), Text(viewTimerBySM(durationSeconds))],
      ),
    );
  }
}
