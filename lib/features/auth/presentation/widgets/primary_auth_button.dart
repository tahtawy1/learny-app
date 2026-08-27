import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';

class PrimaryAuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;

  const PrimaryAuthButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: context.colors.surface,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: context.textStyle.displayLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    color: context.colors.surface,
                  ),
                ),
        ),
      ),
    );
  }
}
