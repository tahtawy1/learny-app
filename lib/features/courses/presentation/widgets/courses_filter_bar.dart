import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';

class CoursesFilterBar extends StatefulWidget {
  const CoursesFilterBar({super.key});

  @override
  State<CoursesFilterBar> createState() => _CoursesFilterBarState();
}

class _CoursesFilterBarState extends State<CoursesFilterBar> {
  int _selectedIndex = 0;

  List<String> get _filters => [
    AppLocalization.instance.coursesFilterAll,
    AppLocalization.instance.coursesFilterSecondGrade,
    AppLocalization.instance.coursesFilterThirdGrade,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: List.generate(_filters.length, (index) {
          final isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colors.primary
                      : context.colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _filters[index],
                  style: context.textStyle.bodySmall?.copyWith(
                    color: isSelected
                        ? context.colors.onPrimary
                        : context.colors.onSurface,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
