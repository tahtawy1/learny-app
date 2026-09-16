import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/validators/validators.dart';
import 'package:learny/features/auth/presentation/widgets/custom_auth_text_field.dart';

class NameInputField extends StatelessWidget {
  final TextEditingController? controller;

  const NameInputField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      validator: AppValidators.name,
      keyboardType: TextInputType.name,
      fillColor: AppColors.border,
      label: AppLocalization.instance.nameFieldLabel,
      hint: AppLocalization.instance.nameFieldHint,
      prefixIcon: Icons.person_outline,
    );
  }
}
