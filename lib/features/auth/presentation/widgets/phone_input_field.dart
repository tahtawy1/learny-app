import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/validators/validators.dart';
import 'package:learny/features/auth/presentation/widgets/custom_auth_text_field.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController? controller;

  const PhoneInputField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      validator: AppValidators.phone,
      keyboardType: TextInputType.phone,
      fillColor: AppColors.border,
      label: AppLocalizationsAr.instance.phoneFieldLabel,
      hint: AppLocalizationsAr.instance.phoneFieldHint,
      prefixIcon: Icons.phone_android,
    );
  }
}
