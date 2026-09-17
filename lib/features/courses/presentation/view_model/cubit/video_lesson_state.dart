import 'package:equatable/equatable.dart';

enum VideoLessonStatus { initial, loading, ready, error }

enum VideoSourceType { youTube, direct }

class VideoLessonState extends Equatable {
  final VideoLessonStatus status;
  final VideoSourceType sourceType;
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  final bool isBuffering;
  final double playbackSpeed;
  final bool showControls;
  final bool isCompleted;
  final String? errorMessage;

  const VideoLessonState({
    this.isPlaying = false,
    this.isBuffering = false,
    this.playbackSpeed = 1.0,
    this.showControls = true,
    this.isCompleted = false,
    this.status = VideoLessonStatus.initial,
    this.sourceType = VideoSourceType.youTube,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.errorMessage,
  });

  VideoLessonState copyWith({
    bool? isPlaying,
    bool? isBuffering,
    double? playbackSpeed,
    bool? showControls,
    bool? isCompleted,
    VideoLessonStatus? status,
    VideoSourceType? sourceType,
    Duration? position,
    Duration? duration,
    String? errorMessage,
  }) {
    return VideoLessonState(
      isPlaying: isPlaying ?? this.isPlaying,
      isBuffering: isBuffering ?? this.isBuffering,
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
      showControls: showControls ?? this.showControls,
      isCompleted: isCompleted ?? this.isCompleted,
      status: status ?? this.status,
      sourceType: sourceType ?? this.sourceType,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    sourceType,
    position,
    duration,
    isPlaying,
    isBuffering,
    playbackSpeed,
    showControls,
    isCompleted,
    errorMessage,
  ];
}
