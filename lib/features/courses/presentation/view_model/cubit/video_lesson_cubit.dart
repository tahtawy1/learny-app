import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/features/courses/presentation/view_model/cubit/video_lesson_state.dart';

class VideoLessonCubit extends Cubit<VideoLessonState> {
  VideoLessonCubit() : super(VideoLessonState());
  void initialize(String url, {final bool isCompleted = false}) {
    if (url.contains("youtube.com") || url.contains("youtu.be")) {
      emit(
        state.copyWith(
          sourceType: VideoSourceType.youTube,
          isCompleted: isCompleted,
        ),
      );
    } else {
      emit(
        state.copyWith(
          sourceType: VideoSourceType.direct,
          isCompleted: isCompleted,
        ),
      );
    }
  }

  void togglePlayPause() {
    emit(state.copyWith(isPlaying: !state.isPlaying));
  }

  void updatePosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  void updateDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }

  void fastForward({int seconds = 10}) {
    emit(state.copyWith(position: state.position + Duration(seconds: seconds)));
  }

  void rewind({int seconds = 10}) {
    final newPos = state.position - Duration(seconds: seconds);
    emit(
      state.copyWith(position: newPos < Duration.zero ? Duration.zero : newPos),
    );
  }

  void updateBuffering(bool isBuffering) {
    emit(state.copyWith(isBuffering: isBuffering));
  }

  void updatePlaybackSpeed(double playbackSpeed) {
    emit(state.copyWith(playbackSpeed: playbackSpeed));
  }

  void updateShowControls(bool showControls) {
    emit(state.copyWith(showControls: showControls));
  }

  void updateIsCompleted(bool isCompleted) {
    emit(state.copyWith(isCompleted: isCompleted));
  }

  String vertUrlToId(String url) {
    if (url.contains("v=")) {
      return url.split("v=")[1].split("&")[0];
    } else if (url.contains("youtu.be/")) {
      return url.split("youtu.be/")[1].split("?")[0];
    }
    return url;
  }

  void updateErrorMessage(String errorMessage) {
    emit(state.copyWith(errorMessage: errorMessage));
  }
}
