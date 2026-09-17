// ignore_for_file: avoid_print

// =============================================================================
// Seed Script — Learny App
// =============================================================================
//
// PURPOSE: Populate Firestore with fixed-ID test data for:
//   • Courses Page
//   • Course Details & Sections
//   • Video / PDF / Quiz Lessons
//   • Enrollments (My Courses – in-progress & completed)
//
// USAGE VIA FLUTTER (Recommended):
//   flutter run -t lib/dev/seed_courses.dart -d chrome
//   (Or select any device: -d windows / -d android)
//
// =============================================================================

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:learny/dev/seed_courses.dart';
import 'package:learny/firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseOptions options;
  try {
    options = DefaultFirebaseOptions.currentPlatform;
  } catch (_) {
    options = DefaultFirebaseOptions.web;
  }

  await Firebase.initializeApp(options: options);

  final userId = args.isNotEmpty ? args.first : 'seed_test_user_001';

  print('\n══════════════════════════════════════════════════');
  print('  Learny App — Firestore Seed Script');
  print('══════════════════════════════════════════════════');
  print('  User ID : $userId');
  print('══════════════════════════════════════════════════\n');

  try {
    await runSeedCourses(
      userId: userId,
      onLog: (msg) => print('  $msg'),
    );
    print('\n══════════════════════════════════════════════════');
    print('  ✅ Seed completed successfully!');
    print('══════════════════════════════════════════════════\n');
  } catch (e, st) {
    print('\n❌ Seed FAILED: $e');
    print(st);
  }
}
