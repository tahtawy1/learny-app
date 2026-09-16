import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;

  const ForgotPasswordWidget({super.key, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          AppLocalization.instance.formLoginPageForgotPassword,
          style: context.textStyle.bodyMedium?.copyWith(
            color: color ?? context.colors.primary,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
