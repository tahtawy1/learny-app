enum LessonType {
  video, // درس فيديو: شرح المدرس بالفيديو
  pdf, // درس يحتوي على ملف PDF مثل مذكرة أو ملزمة
  quiz, // اختبار قصير للتدريب بعد الدرس
  exam, // امتحان كامل لتقييم مستوى الطالب
}

LessonType lessonTypeFromJson(String value) {
  return switch (value) {
    'video' => LessonType.video,
    'pdf' => LessonType.pdf,
    'quiz' => LessonType.quiz,
    'exam' => LessonType.exam,
    _ => throw FormatException('Unknown lesson type: $value'),
  };
}
