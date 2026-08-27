import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/validators/validators.dart';
import 'package:learny/features/auth/presentation/widgets/custom_auth_text_field.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController? controller;

  const EmailInputField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      validator: AppValidators.email,
      keyboardType: TextInputType.emailAddress,
      label: AppLocalizationsAr.instance.emailFieldLabel,
      hint: AppLocalizationsAr.instance.emailFieldHint,
      fillColor: AppColors.border,
      prefixIcon: Icons.email_outlined,
    );
  }
}
