import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/features/courses/domain/entities/video_lesson_entity.dart';
import 'package:learny/features/courses/presentation/view_model/cubit/video_lesson_cubit.dart';
import 'package:learny/features/courses/presentation/view_model/cubit/video_lesson_state.dart';
import 'package:learny/features/courses/presentation/widgets/direct_video_player.dart';
import 'package:learny/features/courses/presentation/widgets/lesson_attachments.dart';
import 'package:learny/features/courses/presentation/widgets/lesson_navigation.dart';
import 'package:learny/features/courses/presentation/widgets/youtube_video_player.dart';

class VideoLessonPage extends StatelessWidget {
  final VideoLessonEntity lesson;

  const VideoLessonPage({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          VideoLessonCubit()
            ..initialize(lesson.videoUrl, isCompleted: lesson.isCompleted),
      child: _VideoLessonView(lesson: lesson),
    );
  }
}

class _VideoLessonView extends StatefulWidget {
  final VideoLessonEntity lesson;

  const _VideoLessonView({required this.lesson});

  @override
  State<_VideoLessonView> createState() => _VideoLessonViewState();
}

class _VideoLessonViewState extends State<_VideoLessonView> {
  bool _isFullScreen = false;
  final GlobalKey _videoPlayerKey = GlobalKey();

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isFullScreen,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (_isFullScreen) {
          _toggleFullScreen();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: SafeArea(
          top: !_isFullScreen,
          bottom: false,
          left: !_isFullScreen,
          right: !_isFullScreen,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                // ── Top Navigation Bar (Back Button) ─────────────────────
                if (!_isFullScreen)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => context.pop(),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // ── Video Player Area ─────────────────────────────────────
                Expanded(
                  flex: _isFullScreen ? 1 : 0,
                  child: BlocBuilder<VideoLessonCubit, VideoLessonState>(
                    builder: (context, state) {
                      if (state.sourceType == VideoSourceType.youTube) {
                        final url = context.read<VideoLessonCubit>().vertUrlToId(
                          widget.lesson.videoUrl,
                        );
                        return YoutubeVideoPlayer(url: url);
                      }
                      if (_isFullScreen) {
                        return DirectVideoPlayer(
                          key: _videoPlayerKey,
                          url: widget.lesson.videoUrl,
                          isFullScreen: true,
                          onToggleFullScreen: _toggleFullScreen,
                        );
                      }
                      return AspectRatio(
                        aspectRatio: 16 / 9,
                        child: DirectVideoPlayer(
                          key: _videoPlayerKey,
                          url: widget.lesson.videoUrl,
                          isFullScreen: false,
                          onToggleFullScreen: _toggleFullScreen,
                        ),
                      );
                    },
                  ),
                ),

                if (!_isFullScreen) ...[
                  const SizedBox(height: 12),

                  // ── Bottom Content Sheet (White Container) ────────────────
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(28),
                        ),
                      ),
                  child: Column(
                    children: [
                      // Grab Handle
                      Container(
                        margin: const EdgeInsets.only(top: 12, bottom: 8),
                        width: 44,
                        height: 5,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2E8F0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      // Scrollable Details
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Title
                              Text(
                                widget.lesson.title,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Description
                              Text(
                                AppLocalizationsAr.instance.videoLessonDefaultDescription,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF64748B),
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Attachments
                              const LessonAttachments(),
                              const SizedBox(height: 24),

                              // Mark as Completed Button
                              BlocBuilder<VideoLessonCubit, VideoLessonState>(
                                builder: (context, state) {
                                  final isCompleted = state.isCompleted;

                                  return Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      gradient: isCompleted
                                          ? null
                                          : const LinearGradient(
                                              colors: [
                                                Color(0xFF256F46),
                                                Color(0xFF2E8B57),
                                                Color(0xFF14B8A6),
                                              ],
                                            ),
                                      color: isCompleted
                                          ? const Color(0xFFE6F4EA)
                                          : null,
                                      borderRadius: BorderRadius.circular(14),
                                      border: isCompleted
                                          ? Border.all(color: AppColors.primary)
                                          : null,
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(14),
                                        onTap: () {
                                          context
                                              .read<VideoLessonCubit>()
                                              .updateIsCompleted(!isCompleted);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              isCompleted
                                                  ? Icons.check_circle_rounded
                                                  : Icons
                                                        .check_circle_outline_rounded,
                                              color: isCompleted
                                                  ? AppColors.primary
                                                  : Colors.white,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              isCompleted
                                                  ? AppLocalizationsAr.instance.videoLessonCompleted
                                                  : AppLocalizationsAr.instance.videoLessonMarkAsCompleted,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: isCompleted
                                                    ? AppColors.primary
                                                    : Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ── Previous / Next Navigation ────────────────────────
                      SafeArea(
                        top: false,
                        child: LessonNavigation(
                          hasPrevious: true,
                          hasNext: true,
                          progressText: 'الدرس 5 من 15',
                          onPrevious: () {},
                          onNext: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    ),
  ),
);
  }
}
