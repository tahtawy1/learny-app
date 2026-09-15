import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:video_player/video_player.dart';

class DirectVideoPlayer extends StatefulWidget {
  final String url;
  final VideoPlayerController?
  controller; // لدعم تمرير الكنترولر في وضع ملء الشاشة
  final bool isFullScreen;
  final VoidCallback? onToggleFullScreen;

  const DirectVideoPlayer({
    super.key,
    required this.url,
    this.controller,
    this.isFullScreen = false,
    this.onToggleFullScreen,
  });

  @override
  State<DirectVideoPlayer> createState() => _DirectVideoPlayerState();
}

class _DirectVideoPlayerState extends State<DirectVideoPlayer> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _hasError = false;
  bool _showControls = true;
  Timer? _hideTimer;
  double _currentSpeed = 1.0;
  double _volume = 1.0;
  bool _isMuted = false;
  bool _isRoutingFullScreen = false;
  Key _textureKey = UniqueKey();

  final List<double> _speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller;
      _isInitialized = _controller!.value.isInitialized;
      _volume = _controller!.value.volume;
      _isMuted = _volume == 0.0;
      _controller!.addListener(_onControllerUpdate);
      _startHideTimer();
    } else {
      _initPlayer();
    }
  }

  void _onControllerUpdate() {
    if (mounted) setState(() {});
  }

  Future<void> _initPlayer() async {
    try {
      final uri = Uri.parse(widget.url);
      _controller = VideoPlayerController.networkUrl(uri);
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _isInitialized = true;
          _volume = _controller!.value.volume;
          _isMuted = _volume == 0.0;
        });
        _controller!.addListener(_onControllerUpdate);
        _startHideTimer();
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && (_controller?.value.isPlaying ?? false)) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  void _onUserInteraction() {
    if (!_showControls) {
      setState(() {
        _showControls = true;
      });
    }
    _startHideTimer();
  }

  void _togglePlayPause() {
    _onUserInteraction();
    if (_controller == null) return;
    if (_controller!.value.isPlaying) {
      _controller!.pause();
      _hideTimer?.cancel(); // إبقاء عناصر التحكم ظاهرة أثناء الإيقاف المؤقت
      setState(() => _showControls = true);
    } else {
      _controller!.play();
      _startHideTimer();
    }
  }

  void _setSpeed(double speed) {
    _controller?.setPlaybackSpeed(speed);
    setState(() {
      _currentSpeed = speed;
    });
    _onUserInteraction();
  }

  void _toggleMute() {
    _onUserInteraction();
    if (_controller == null) return;
    setState(() {
      if (_isMuted) {
        _isMuted = false;
        final restoreVol = _volume > 0 ? _volume : 1.0;
        _volume = restoreVol;
        _controller!.setVolume(restoreVol);
      } else {
        _isMuted = true;
        _controller!.setVolume(0.0);
      }
    });
  }

  void _setVolume(double val) {
    _onUserInteraction();
    setState(() {
      _volume = val;
      _isMuted = val == 0.0;
      _controller?.setVolume(val);
    });
  }

  void _toggleFullScreen() async {
    // إذا وفرت الصفحة الحاضنة كولباك التكبير، نستخدمه (الحل الأمثل بدون تكرار الـ Texture)
    if (widget.onToggleFullScreen != null) {
      widget.onToggleFullScreen!();
      return;
    }

    if (widget.isFullScreen) {
      Navigator.of(context).pop();
      return;
    }

    _hideTimer?.cancel();
    setState(() {
      _isRoutingFullScreen = true;
    });

    // تفعيل وضع الشاشة الكاملة والاتجاه الأفقي
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    if (!mounted) return;

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          body: DirectVideoPlayer(
            url: widget.url,
            controller: _controller,
            isFullScreen: true,
          ),
        ),
      ),
    );

    // إعادة الوضع الرأسي الطبيعي عند الرجوع
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    if (mounted) {
      setState(() {
        _isRoutingFullScreen = false;
        _textureKey =
            UniqueKey(); // إجبار إعادة بناء الـ Texture لتفادي الشاشة الفارغة
      });
      _onUserInteraction();
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    if (widget.controller == null) {
      _controller?.dispose();
    } else {
      _controller?.removeListener(_onControllerUpdate);
    }
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (_isRoutingFullScreen) {
      return Container(color: Colors.black);
    }

    if (_hasError) {
      return Container(
        color: const Color(0xFF0F172A),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.redAccent,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizationsAr.instance.videoPlayerError,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      );
    }

    if (!_isInitialized || _controller == null) {
      return Container(
        color: const Color(0xFF0F172A),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: Color(0xFF10B981),
          strokeWidth: 2.5,
        ),
      );
    }

    final isPlaying = _controller!.value.isPlaying;
    final position = _controller!.value.position;
    final duration = _controller!.value.duration;

    return MouseRegion(
      onHover: (_) => _onUserInteraction(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (_showControls) {
            _hideTimer?.cancel();
            setState(() => _showControls = false);
          } else {
            _onUserInteraction();
          }
        },
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // عرض الفيديو
              Center(
                child: AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio > 0
                      ? _controller!.value.aspectRatio
                      : 16 / 9,
                  child: VideoPlayer(_controller!, key: _textureKey),
                ),
              ),

              // زر التشغيل/الإيقاف في المنتصف (يختفي ويظهر بسلاسة)
              AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 250),
                child: IgnorePointer(
                  ignoring: !_showControls,
                  child: Center(
                    child: GestureDetector(
                      onTap: _togglePlayPause,
                      child: Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          color: const Color(0xFF16A34A),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF16A34A,
                              ).withValues(alpha: 0.4),
                              blurRadius: 18,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // شريط التحكم السفلي (يختفي ويظهر بسلاسة)
              AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 250),
                child: IgnorePointer(
                  ignoring: !_showControls,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.85),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // مؤشر التقدم
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 3.5,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 6,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 10,
                            ),
                            activeTrackColor: const Color(0xFF16A34A),
                            inactiveTrackColor: Colors.white.withValues(
                              alpha: 0.3,
                            ),
                            thumbColor: Colors.white,
                          ),
                          child: Slider(
                            value: position.inMilliseconds.toDouble().clamp(
                              0.0,
                              duration.inMilliseconds.toDouble() > 0
                                  ? duration.inMilliseconds.toDouble()
                                  : 1.0,
                            ),
                            min: 0.0,
                            max: duration.inMilliseconds.toDouble() > 0
                                ? duration.inMilliseconds.toDouble()
                                : 1.0,
                            onChanged: (val) {
                              _onUserInteraction();
                              _controller!.seekTo(
                                Duration(milliseconds: val.toInt()),
                              );
                            },
                          ),
                        ),

                        // أزرار التحكم
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: [
                              // زر ملء الشاشة
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: Icon(
                                  widget.isFullScreen
                                      ? Icons.fullscreen_exit_rounded
                                      : Icons.fullscreen_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                onPressed: _toggleFullScreen,
                              ),
                              const SizedBox(width: 14),

                              // تقديم 10 ثوانٍ
                              GestureDetector(
                                onTap: () {
                                  _onUserInteraction();
                                  final newPos =
                                      position + const Duration(seconds: 10);
                                  _controller!.seekTo(
                                    newPos > duration ? duration : newPos,
                                  );
                                },
                                child: const Icon(
                                  Icons.fast_forward_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 14),

                              // ترجيع 10 ثوانٍ
                              GestureDetector(
                                onTap: () {
                                  _onUserInteraction();
                                  final newPos =
                                      position - const Duration(seconds: 10);
                                  _controller!.seekTo(
                                    newPos < Duration.zero
                                        ? Duration.zero
                                        : newPos,
                                  );
                                },
                                child: const Icon(
                                  Icons.fast_rewind_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 14),

                              // زر كتم / تفعيل الصوت
                              GestureDetector(
                                onTap: _toggleMute,
                                child: Tooltip(
                                  message: _isMuted || _volume == 0
                                      ? AppLocalizationsAr.instance.videoPlayerUnmute
                                      : AppLocalizationsAr.instance.videoPlayerMute,
                                  child: Icon(
                                    _isMuted || _volume == 0
                                        ? Icons.volume_off_rounded
                                        : (_volume < 0.5
                                              ? Icons.volume_down_rounded
                                              : Icons.volume_up_rounded),
                                    color: _isMuted || _volume == 0
                                        ? Colors.redAccent
                                        : Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),

                              // شريط التحكم بالصوت
                              SizedBox(
                                width: widget.isFullScreen ? 80 : 52,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 2.5,
                                    thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 4,
                                    ),
                                    overlayShape: const RoundSliderOverlayShape(
                                      overlayRadius: 8,
                                    ),
                                    activeTrackColor: const Color(0xFF16A34A),
                                    inactiveTrackColor: Colors.white.withValues(
                                      alpha: 0.3,
                                    ),
                                    thumbColor: Colors.white,
                                  ),
                                  child: Slider(
                                    value: _isMuted ? 0.0 : _volume,
                                    min: 0.0,
                                    max: 1.0,
                                    onChanged: _setVolume,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),

                              // قائمة اختيار السرعة
                              PopupMenuButton<double>(
                                initialValue: _currentSpeed,
                                tooltip: AppLocalizationsAr.instance.videoPlayerPlaybackSpeed,
                                color: const Color(0xFF1E293B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onSelected: _setSpeed,
                                itemBuilder: (context) => _speeds.map((speed) {
                                  return PopupMenuItem<double>(
                                    value: speed,
                                    child: Text(
                                      '${speed}x',
                                      style: TextStyle(
                                        color: _currentSpeed == speed
                                            ? const Color(0xFF16A34A)
                                            : Colors.white,
                                        fontWeight: _currentSpeed == speed
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white38),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '${_currentSpeed}x',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              const Spacer(),

                              // الوقت الحالي / الإجمالي
                              Text(
                                '${_formatDuration(position)} / ${_formatDuration(duration)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 12),

                              // زر التشغيل / الإيقاف المؤقت
                              GestureDetector(
                                onTap: _togglePlayPause,
                                child: Icon(
                                  isPlaying
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
