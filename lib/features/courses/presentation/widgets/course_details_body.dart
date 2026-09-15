import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/const/lesson_type.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';
import 'package:learny/features/courses/domain/entities/course_section_entity.dart';
import 'package:learny/features/courses/domain/entities/exam_lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/pdf_lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/quiz_lesson_entity.dart';
import 'package:learny/features/courses/domain/entities/video_lesson_entity.dart';

class CourseDetailsBody extends StatefulWidget {
  const CourseDetailsBody({super.key, required this.course});

  final CourseEntity course;

  @override
  State<CourseDetailsBody> createState() => _CourseDetailsBodyState();
}

class _CourseDetailsBodyState extends State<CourseDetailsBody> {
  int _selectedTab = 0; // 0: المحتوى, 1: التفاصيل, 2: التقييمات
  final Set<String> _expandedSectionIds = {};

  @override
  void initState() {
    super.initState();
    // Expand the first section by default
    if (widget.course.courseSections.isNotEmpty) {
      _expandedSectionIds.add(widget.course.courseSections.first.id);
    }
  }

  void _toggleSection(String id) {
    setState(() {
      if (_expandedSectionIds.contains(id)) {
        _expandedSectionIds.remove(id);
      } else {
        _expandedSectionIds.add(id);
      }
    });
  }

  LessonEntity? _findFirstPlayableLesson() {
    for (final section in widget.course.courseSections) {
      for (final lesson in section.lessons) {
        if (!lesson.isLocked) return lesson;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final course = widget.course;
    final totalLessons = course.courseSections.fold<int>(
      0,
      (sum, s) => sum + s.lessons.length,
    );
    final hours = (course.durationMinutes / 60).toStringAsFixed(0);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  // ── Top Gradient Header + Title + Back Button ────────────
                  _HeaderSection(
                    title: course.title,
                    onBack: () => context.pop(),
                  ),

                  // ── Floating Stats Card (Overlapping header) ────────────
                  Transform.translate(
                    offset: const Offset(0, -32),
                    child: _FloatingStatsCard(
                      hours: hours == '0' ? '12' : hours,
                      lessonsCount: totalLessons == 0 ? 24 : totalLessons,
                    ),
                  ),

                  // ── Tab Bar ──────────────────────────────────────────────
                  Transform.translate(
                    offset: const Offset(0, -16),
                    child: Column(
                      children: [
                        _TabBar(
                          selectedTab: _selectedTab,
                          onTabSelected: (index) {
                            setState(() => _selectedTab = index);
                          },
                        ),
                        const SizedBox(height: 16),

                        // ── Tab Content ────────────────────────────────────
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: _buildTabContent(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Sticky Bottom Action Button ──────────────────────────────────
          _BottomBar(
            onContinue: () {
              final lesson = _findFirstPlayableLesson();
              if (lesson != null) {
                context.push('/lesson_details', extra: lesson);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0:
        return _buildCurriculumTab();
      case 1:
        return _buildDetailsTab();
      case 2:
        return _buildReviewsTab();
      default:
        return const SizedBox.shrink();
    }
  }

  // ── Tab 1: المحتوى (Curriculum) ──────────────────────────────────────────
  Widget _buildCurriculumTab() {
    final sections = widget.course.courseSections;

    if (sections.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Text(
          AppLocalizationsAr.instance.courseDetailsNoContent,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      separatorBuilder: (context, index) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        final section = sections[index];
        final isExpanded = _expandedSectionIds.contains(section.id);

        return _SectionItem(
          section: section,
          isExpanded: isExpanded,
          onToggle: () => _toggleSection(section.id),
          onLessonTap: (lesson) {
            context.push('/lesson_details', extra: lesson);
          },
        );
      },
    );
  }

  // ── Tab 2: التفاصيل (Overview) ──────────────────────────────────────────
  Widget _buildDetailsTab() {
    final course = widget.course;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizationsAr.instance.courseDetailsAbout,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            course.description.isNotEmpty
                ? course.description
                : AppLocalizationsAr.instance.courseDetailsDefaultDescription,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
          if (course.subtitle.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              course.subtitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
          const SizedBox(height: 20),
          const Divider(color: AppColors.divider),
          const SizedBox(height: 16),
          Text(
            AppLocalizationsAr.instance.courseDetailsWhatYouWillGet,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          _buildFeatureRow(Icons.videocam_outlined, AppLocalizationsAr.instance.courseDetailsFeatureVideos),
          _buildFeatureRow(Icons.picture_as_pdf_outlined, AppLocalizationsAr.instance.courseDetailsFeaturePdfs),
          _buildFeatureRow(Icons.quiz_outlined, AppLocalizationsAr.instance.courseDetailsFeatureQuizzes),
          _buildFeatureRow(Icons.all_inclusive, AppLocalizationsAr.instance.courseDetailsFeatureAccess),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 18, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ── Tab 3: التقييمات (Reviews) ──────────────────────────────────────────
  Widget _buildReviewsTab() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '4.9',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizationsAr.instance.courseDetailsReviewsBasedOn,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: AppColors.divider),
          const SizedBox(height: 12),
          _buildReviewItem('أحمد محمد', 'شرح ممتاز جداً ومبسط ومفهوم!', 'منذ يومين'),
          _buildReviewItem('سارة علي', 'المذكرات والأسئلة ساعدتني جداً في المراجعة.', 'منذ أسبوع'),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String name, String comment, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primary.withValues(alpha: 0.15),
            child: Text(
              name.substring(0, 1),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Header Section (Gradient Background + Back Arrow + Title) ───────────────

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.title, required this.onBack});

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 16,
        20,
        56,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF237648),
            Color(0xFF289A60),
            Color(0xFF14B8A6),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Back button on top right (in RTL)
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onBack,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.25),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Course Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Floating Stats Card (Hours & Lessons) ───────────────────────────────────

class _FloatingStatsCard extends StatelessWidget {
  const _FloatingStatsCard({
    required this.hours,
    required this.lessonsCount,
  });

  final String hours;
  final int lessonsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Hours item (Right in RTL)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  color: Color(0xFF38BDF8),
                  size: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  '$hours ${AppLocalizationsAr.instance.courseCardHoursSuffix}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 36,
            color: AppColors.divider,
          ),
          // Lessons item (Left in RTL)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.menu_book_outlined,
                  color: AppColors.primary,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  '$lessonsCount ${AppLocalizationsAr.instance.myCoursesLessonSuffix}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Custom Tab Bar ──────────────────────────────────────────────────────────

class _TabBar extends StatelessWidget {
  const _TabBar({required this.selectedTab, required this.onTabSelected});

  final int selectedTab;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      AppLocalizationsAr.instance.courseDetailsTabCurriculum,
      AppLocalizationsAr.instance.courseDetailsTabOverview,
      AppLocalizationsAr.instance.courseDetailsTabReviews,
    ];

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedTab == index;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tabs[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                      color: isSelected
                          ? AppColors.primary
                          : const Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 3,
                    width: 48,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─── Section Item (Expandable Card) ──────────────────────────────────────────

class _SectionItem extends StatelessWidget {
  const _SectionItem({
    required this.section,
    required this.isExpanded,
    required this.onToggle,
    required this.onLessonTap,
  });

  final CourseSectionEntity section;
  final bool isExpanded;
  final VoidCallback onToggle;
  final ValueChanged<LessonEntity> onLessonTap;

  String _formatSectionDuration(CourseSectionEntity section) {
    int minutes = 0;
    for (final l in section.lessons) {
      if (l is VideoLessonEntity) {
        minutes += l.durationMinutes;
      } else if (l is ExamLessonEntity) {
        minutes += l.durationMinutes;
      } else {
        minutes += 15;
      }
    }
    if (minutes >= 60) {
      final hours = (minutes / 60).toStringAsFixed(1).replaceAll('.0', '');
      return '$hours ${AppLocalizationsAr.instance.courseCardHoursSuffix}';
    }
    return '$minutes ${AppLocalizationsAr.instance.courseMinutesSuffix}';
  }

  @override
  Widget build(BuildContext context) {
    final durationStr = _formatSectionDuration(section);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Section Header ──────────────────────────────────────────────
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(18),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  // Title and subtitle (Right side in RTL)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          section.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${section.lessons.length} ${AppLocalizationsAr.instance.courseLessonsSuffix} • $durationStr',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Circle chevron button (Left side in RTL)
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFF8FAFC),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Center(
                      child: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: const Color(0xFF475569),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Lessons List (Expanded Content) ──────────────────────────────
          if (isExpanded) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: section.lessons.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final lesson = section.lessons[index];
                  // If second lesson and not locked, show active border style (like in screenshot)
                  final isCurrentActive = !lesson.isCompleted && !lesson.isLocked;

                  return _LessonCard(
                    lesson: lesson,
                    isActive: isCurrentActive,
                    onTap: lesson.isLocked ? null : () => onLessonTap(lesson),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Lesson Card (Single Lesson Item) ────────────────────────────────────────

class _LessonCard extends StatelessWidget {
  const _LessonCard({
    required this.lesson,
    required this.isActive,
    required this.onTap,
  });

  final LessonEntity lesson;
  final bool isActive;
  final VoidCallback? onTap;

  String _getSubtitle(LessonEntity lesson) {
    if (lesson is VideoLessonEntity) {
      return '${lesson.durationMinutes} ${AppLocalizationsAr.instance.courseMinutesSuffix}';
    } else if (lesson is QuizLessonEntity) {
      final count = lesson.questions.isNotEmpty ? lesson.questions.length : 10;
      return '$count ${AppLocalizationsAr.instance.courseQuestionsSuffix}';
    } else if (lesson is ExamLessonEntity) {
      return '${lesson.questionsCount} ${AppLocalizationsAr.instance.courseQuestionsSuffix}';
    } else if (lesson is PdfLessonEntity) {
      return '3 ${AppLocalizationsAr.instance.courseMegabyteSuffix}';
    } else {
      return AppLocalizationsAr.instance.courseEducationalFile;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLocked = lesson.isLocked;
    final isCompleted = lesson.isCompleted;

    // Badge styling based on lesson type
    final (badgeBg, iconColor, iconData) = switch (lesson.type) {
      LessonType.video => (
          const Color(0xFFE6FFFA),
          const Color(0xFF14B8A6),
          Icons.play_circle_outline_rounded,
        ),
      LessonType.pdf => (
          const Color(0xFFF0F9FF),
          const Color(0xFF38BDF8),
          Icons.description_outlined,
        ),
      LessonType.quiz || LessonType.exam => (
          isLocked ? const Color(0xFFF8FAFC) : const Color(0xFFF0FDF4),
          isLocked ? const Color(0xFF94A3B8) : AppColors.primary,
          isLocked ? Icons.lock_outline_rounded : Icons.quiz_outlined,
        ),
    };

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isLocked ? const Color(0xFFFAFAFA) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isActive
                ? AppColors.primary
                : isLocked
                    ? const Color(0xFFF1F5F9)
                    : const Color(0xFFE2E8F0),
            width: isActive ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            // Status Icon (Left side in RTL)
            _buildStatusIcon(isCompleted, isActive, isLocked),

            const SizedBox(width: 14),

            // Lesson Title & Subtitle (Middle)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isLocked
                          ? const Color(0xFF94A3B8)
                          : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    _getSubtitle(lesson),
                    style: TextStyle(
                      fontSize: 12,
                      color: isLocked
                          ? const Color(0xFFCBD5E1)
                          : const Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Icon Badge (Right side in RTL)
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: badgeBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  iconData,
                  color: iconColor,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(bool isCompleted, bool isActive, bool isLocked) {
    if (isCompleted) {
      return const Icon(
        Icons.check_circle_rounded,
        color: AppColors.primary,
        size: 22,
      );
    } else if (isActive) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 2),
        ),
      );
    } else if (isLocked) {
      return const Icon(
        Icons.lock_outline_rounded,
        color: Color(0xFFCBD5E1),
        size: 20,
      );
    } else {
      return const Icon(
        Icons.play_circle_fill_rounded,
        color: AppColors.primary,
        size: 22,
      );
    }
  }
}

// ─── Sticky Bottom Action Bar ────────────────────────────────────────────────

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            offset: const Offset(0, -4),
            blurRadius: 14,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF256F46),
                Color(0xFF2E8B57),
                Color(0xFF14B8A6),
              ],
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: onContinue,
              child: Center(
                child: Text(
                  AppLocalizationsAr.instance.courseDetailsContinueLearning,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
