import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThreeDotsLoading extends StatefulWidget {
  final Color color;
  final double size;
  final double spacing;
  final Duration duration;

  const ThreeDotsLoading({
    super.key,
    required this.color,
    this.size = 5,
    this.spacing = 10,
    this.duration = const Duration(seconds: 5),
  });

  @override
  State<ThreeDotsLoading> createState() => _ThreeDotsLoadingState();
}

class _ThreeDotsLoadingState extends State<ThreeDotsLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    Future.delayed(widget.duration, () {
      if (mounted) {
        context.go("/login");
        _controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final value = (_controller.value - index * 0.2) % 1.0;

            final scale = 1 + (value < 0.5 ? value : 1 - value);

            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : widget.spacing),
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
