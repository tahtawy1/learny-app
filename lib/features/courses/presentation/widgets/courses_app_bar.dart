import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';

class CoursesAppBar extends StatelessWidget {
  const CoursesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            AppLocalizationsAr.instance.coursesPageTitle,
            style: context.textStyle.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: AppLocalizationsAr.instance.coursesSearchHint,
              hintStyle: TextStyle(color: context.colors.onSurface.withValues(alpha: 0.4)),
              prefixIcon: Icon(Icons.search, color: context.colors.onSurface.withValues(alpha: 0.5)),
              filled: true,
              fillColor: context.colors.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
