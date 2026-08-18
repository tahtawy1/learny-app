import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/theme/app_colors.dart';

class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({super.key, this.text = 'أو'});

  @override
  Widget build(BuildContext context) {
    

    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.textHint, thickness: .5)),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: context.textStyle.bodyMedium?.copyWith(
              color: AppColors.textHint,
            ),
          ),
        ),

        Expanded(child: Divider(color: AppColors.textHint, thickness: .5)),
      ],
    );
  }
}
