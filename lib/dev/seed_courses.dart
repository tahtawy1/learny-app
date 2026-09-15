import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learny/core/const/lesson_type.dart';
import 'package:learny/features/courses/data/models/course_model.dart';
import 'package:learny/features/courses/data/models/course_section_model.dart';
import 'package:learny/features/courses/data/models/exam_lesson_model.dart';
import 'package:learny/features/courses/data/models/pdf_lesson_model.dart';
import 'package:learny/features/courses/data/models/question_model.dart';
import 'package:learny/features/courses/data/models/quiz_lesson_model.dart';
import 'package:learny/features/courses/data/models/video_lesson_model.dart';
import 'package:learny/features/enrollment/data/models/enrollment_model.dart';
import 'package:learny/features/enrollment/domain/enums/enrollment_status.dart';
import 'package:learny/firebase_options.dart';

// =============================================================================
// Seed IDs & URLs Constants
// =============================================================================

const String kCourse1Id = 'seed_course_biology_1';
const String kCourse2Id = 'seed_course_biology_2';

const String kS1Sec1Id = 'seed_s1_sec1';
const String kS1Sec2Id = 'seed_s1_sec2';
const String kS2Sec1Id = 'seed_s2_sec1';

const String kL1Vid1 = 'seed_l1_vid1';
const String kL1Vid2 = 'seed_l1_vid2';
const String kL1Vid3 = 'seed_l1_vid3';
const String kL1Pdf1 = 'seed_l1_pdf1';
const String kL1Quiz1 = 'seed_l1_quiz1';

const String kL2Vid1 = 'seed_l2_vid1';
const String kL2Vid2 = 'seed_l2_vid2';
const String kL2Pdf1 = 'seed_l2_pdf1';
const String kL2Quiz1 = 'seed_l2_quiz1';
const String kL2Exam1 = 'seed_l2_quiz2';

const String kEnroll1Id = 'seed_enrollment_1';
const String kEnroll2Id = 'seed_enrollment_2';

const String kYtUrl1 =
    'https://vz-3e8817da-670.b-cdn.net/874f0ac6-b7f1-48ee-9469-8f1367585010/playlist.m3u8';
const String kYtUrl2 = 'https://www.youtube.com/watch?v=3JZ_D3ELwOQ';
const String kYtUrl3 = 'https://www.youtube.com/watch?v=aqz-KE-bpKQ';
const String kMp4Url =
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';
const String kPdfUrl = 'https://www.w3.org/WAI/WCAG21/wcag21.pdf';

const String kImg1 =
    'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=800';
const String kImg2 =
    'https://images.unsplash.com/photo-1628595351029-c2bf17511435?w=800';

// =============================================================================
// Seed Execution Logic
// =============================================================================

Future<void> runSeedCourses({
  required String userId,
  void Function(String msg)? onLog,
}) async {
  final log = onLog ?? (msg) => dev.log(msg, name: 'SEED');

  log('🚀 Starting Seeding for User: $userId...');
  final db = FirebaseFirestore.instance;
  final now = DateTime.now();
  final weekAgo = now.subtract(const Duration(days: 7));
  final monthAgo = now.subtract(const Duration(days: 30));

  // ---------------------------------------------------------------------------
  // 1. Course 1 — الأحياء الجزيئية
  // ---------------------------------------------------------------------------
  log('📚 Building Course 1 ($kCourse1Id)...');

  final course1 = CourseModel(
    id: kCourse1Id,
    title: 'الأحياء الجزيئية للثانوية',
    subtitle: 'شرح شامل لمنهج الأحياء الجزيئية للصف الثالث الثانوي',
    description:
        'كورس متكامل يشمل شرح مفصل لمقرر الأحياء مع التركيز على الفهم '
        'العميق والتطبيق العملي وحل أسئلة الامتحانات.',
    imageUrl: kImg1,
    categoryId: 'third_grade',
    price: 299.0,
    oldPrice: 499.0,
    durationMinutes: 720,
    studentsCount: 1240,
    isFree: false,
    isPublished: true,
    createdAt: now,
    updatedAt: now,
    courseSections: [
      CourseSectionModel(
        id: kS1Sec1Id,
        courseId: kCourse1Id,
        title: 'الأسبوع الأول: أساسيات الخلية',
        description: 'نظرة شاملة على تركيب الخلية ووظائفها',
        lessons: [
          VideoLessonModel(
            id: kL1Vid1,
            title: 'مقدمة في الأحياء الجزيئية',
            type: LessonType.video,
            isLocked: false,
            isCompleted: true,
            videoUrl: kYtUrl1,
            durationMinutes: 15,
          ),
          VideoLessonModel(
            id: kL1Vid2,
            title: 'تركيب الخلية وأجزاؤها',
            type: LessonType.video,
            isLocked: false,
            isCompleted: true,
            videoUrl: kYtUrl2,
            durationMinutes: 20,
          ),
          PdfLessonModel(
            id: kL1Pdf1,
            title: 'ملخص الوحدة الأولى',
            type: LessonType.pdf,
            isLocked: false,
            isCompleted: false,
            pdfUrl: kPdfUrl,
          ),
        ],
      ),
      CourseSectionModel(
        id: kS1Sec2Id,
        courseId: kCourse1Id,
        title: 'الأسبوع الثاني: الحمض النووي والوراثة',
        description: 'دراسة الحمض النووي وآليات الوراثة الجزيئية',
        lessons: [
          VideoLessonModel(
            id: kL1Vid3,
            title: 'وظائف الحمض النووي DNA',
            type: LessonType.video,
            isLocked: true,
            isCompleted: false,
            videoUrl: kYtUrl3,
            durationMinutes: 25,
          ),
          QuizLessonModel(
            id: kL1Quiz1,
            title: 'اختبار الوحدة الأولى',
            type: LessonType.quiz,
            isLocked: true,
            isCompleted: false,
            passingScore: 70.0,
            questions: [
              QuestionModel(
                id: 'seed_q1_1',
                question: 'ما هو الوحدة الأساسية للحياة؟',
                options: ['الخلية', 'الذرة', 'الجزيء', 'البروتين'],
                correctAnswer: 0,
                score: 10.0,
                answerExplanation:
                    'الخلية هي الوحدة التركيبية والوظيفية الأساسية لجميع الكائنات الحية.',
              ),
              QuestionModel(
                id: 'seed_q1_2',
                question: 'ما هي وظيفة الميتوكوندريا الأساسية؟',
                options: [
                  'تصنيع البروتين',
                  'إنتاج الطاقة (ATP)',
                  'تخزين الوراثة',
                  'الهضم الخلوي',
                ],
                correctAnswer: 1,
                score: 10.0,
                answerExplanation:
                    'الميتوكوندريا هي مصانع الطاقة بالخلية حيث يتم إنتاج أدينوسين ثلاثي الفوسفات ATP.',
              ),
            ],
          ),
        ],
      ),
    ],
  );

  await db.collection('courses').doc(kCourse1Id).set(course1.toJson());
  log('✅ Course 1 written successfully.');

  // ---------------------------------------------------------------------------
  // 2. Course 2 — الكيمياء العضوية المتقدمة
  // ---------------------------------------------------------------------------
  log('📚 Building Course 2 ($kCourse2Id)...');

  final course2 = CourseModel(
    id: kCourse2Id,
    title: 'الكيمياء العضوية المتقدمة',
    subtitle: 'شرح شامل ومبسط لمنهج الكيمياء العضوية',
    description:
        'كورس متكامل يغطي الهيدروكربونات وتفاعلاتها الكيميائية مع أمثلة وتدريبات عملية.',
    imageUrl: kImg2,
    categoryId: 'second_grade',
    price: 0.0,
    oldPrice: null,
    durationMinutes: 480,
    studentsCount: 875,
    isFree: true,
    isPublished: true,
    createdAt: now,
    updatedAt: now,
    courseSections: [
      CourseSectionModel(
        id: kS2Sec1Id,
        courseId: kCourse2Id,
        title: 'الوحدة الأولى: الهيدروكربونات',
        description: 'تصنيف الهيدروكربونات وخواصها وتفاعلاتها',
        lessons: [
          VideoLessonModel(
            id: kL2Vid1,
            title: 'مقدمة في الكيمياء العضوية',
            type: LessonType.video,
            isLocked: false,
            isCompleted: true,
            videoUrl: kMp4Url,
            durationMinutes: 18,
          ),
          VideoLessonModel(
            id: kL2Vid2,
            title: 'الهيدروكربونات المشبعة وغير المشبعة',
            type: LessonType.video,
            isLocked: false,
            isCompleted: true,
            videoUrl: kYtUrl2,
            durationMinutes: 22,
          ),
          PdfLessonModel(
            id: kL2Pdf1,
            title: 'ملخص الهيدروكربونات',
            type: LessonType.pdf,
            isLocked: false,
            isCompleted: true,
            pdfUrl: kPdfUrl,
          ),
          QuizLessonModel(
            id: kL2Quiz1,
            title: 'اختبار قصير: الهيدروكربونات',
            type: LessonType.quiz,
            isLocked: false,
            isCompleted: true,
            passingScore: 60.0,
            questions: [
              QuestionModel(
                id: 'seed_q2_1',
                question: 'ما هو أبسط مركب هيدروكربوني؟',
                options: ['الإيثان', 'الميثان', 'البروبان', 'البيوتان'],
                correctAnswer: 1,
                userAnswer: 1,
                score: 10.0,
                answerExplanation:
                    'الميثان CH4 هو أبسط الهيدروكربونات وأول أفراد سلسلة الألكانات.',
              ),
            ],
          ),
          ExamLessonModel(
            id: kL2Exam1,
            title: 'الامتحان النهائي للكورس',
            type: LessonType.exam,
            isLocked: false,
            isCompleted: true,
            questionsCount: 20,
            totalScore: 100.0,
            durationMinutes: 45,
          ),
        ],
      ),
    ],
  );

  await db.collection('courses').doc(kCourse2Id).set(course2.toJson());
  log('✅ Course 2 written successfully.');

  // ---------------------------------------------------------------------------
  // 3. Enrollments for user
  // ---------------------------------------------------------------------------
  log('🎓 Seeding Enrollments for $userId...');

  final enrollment1 = EnrollmentModel(
    id: kEnroll1Id,
    courseId: kCourse1Id,
    userId: userId,
    enrolledAt: weekAgo,
    status: EnrollmentStatus.active,
    completedLessonsCount: 2.0,
    totalLessonsCount: 5.0,
    lastAccessAt: now,
    lastAccessedLessonId: kL1Vid2,
    updatedAt: now,
    courseTitle: course1.title,
    courseImageUrl: course1.imageUrl,
  );

  final enrollment2 = EnrollmentModel(
    id: kEnroll2Id,
    courseId: kCourse2Id,
    userId: userId,
    enrolledAt: monthAgo,
    status: EnrollmentStatus.active,
    completedLessonsCount: 5.0,
    totalLessonsCount: 5.0,
    lastAccessAt: now,
    lastAccessedLessonId: kL2Exam1,
    updatedAt: now,
    courseTitle: course2.title,
    courseImageUrl: course2.imageUrl,
  );

  await db.collection('enrollments').doc(kEnroll1Id).set(enrollment1.toJson());
  await db.collection('enrollments').doc(kEnroll2Id).set(enrollment2.toJson());

  log('✅ Enrollment 1 written (Course 1 - 2/5 in-progress).');
  log('✅ Enrollment 2 written (Course 2 - 5/5 completed).');
  log('🎉 All Seed Data successfully committed to Firestore!');
}

// =============================================================================
// Flutter App Entrypoint
// =============================================================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseOptions options;
  try {
    options = DefaultFirebaseOptions.currentPlatform;
  } catch (_) {
    // If running on desktop without Windows CLI configuration, fallback to web config
    options = DefaultFirebaseOptions.web;
  }

  await Firebase.initializeApp(options: options);

  runApp(const SeedCoursesApp());
}

class SeedCoursesApp extends StatefulWidget {
  const SeedCoursesApp({super.key});

  @override
  State<SeedCoursesApp> createState() => _SeedCoursesAppState();
}

class _SeedCoursesAppState extends State<SeedCoursesApp> {
  final TextEditingController _userIdController = TextEditingController(
    text: 'seed_test_user_001',
  );
  final List<String> _logs = [];
  bool _isLoading = false;
  String? _statusMessage;

  @override
  void initState() {
    super.initState();
    // Auto-run on start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _executeSeed();
    });
  }

  void _addLog(String msg) {
    if (kDebugMode) {
      print(msg);
    }
    setState(() {
      _logs.add(msg);
    });
  }

  Future<void> _executeSeed() async {
    final uid = _userIdController.text.trim().isEmpty
        ? 'seed_test_user_001'
        : _userIdController.text.trim();

    setState(() {
      _isLoading = true;
      _statusMessage = 'جارٍ زرع البيانات في Firestore...';
      _logs.clear();
    });

    try {
      await runSeedCourses(userId: uid, onLog: _addLog);
      setState(() {
        _statusMessage = '✅ تمت إضافة بيانات الـ Seed بنجاح!';
      });
    } catch (e, st) {
      _addLog('❌ خطأ: $e');
      _addLog(st.toString());
      setState(() {
        _statusMessage = '❌ فشل زرع البيانات: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          surface: Color(0xFF1E293B),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Learny — Firestore Seed Runner'),
          backgroundColor: const Color(0xFF1E293B),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: const Color(0xFF1E293B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'إعدادات الـ User ID',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _userIdController,
                        decoration: const InputDecoration(
                          hintText: 'أدخل Firebase UID الخاص بك',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: _isLoading ? null : _executeSeed,
                        icon: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.play_arrow),
                        label: Text(
                          _isLoading
                              ? 'جارٍ التشغيل...'
                              : 'تشغيل الـ Seed الآن',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_statusMessage != null) ...[
                Text(
                  _statusMessage!,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: _statusMessage!.startsWith('✅')
                        ? Colors.greenAccent
                        : Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 12),
              ],
              const Text(
                'سجل العمليات (Execution Logs):',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF090D16),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: ListView.builder(
                    itemCount: _logs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          _logs[index],
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
