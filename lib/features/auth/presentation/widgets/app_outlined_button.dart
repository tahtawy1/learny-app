import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
   

    return SizedBox(
      width: double.infinity,
      height: 58,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: context.colors.primary, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          text,
          style: context.textStyle.displayLarge?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 17,
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }
}
