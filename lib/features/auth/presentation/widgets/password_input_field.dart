import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/validators/validators.dart';
import 'package:learny/features/auth/presentation/widgets/custom_auth_text_field.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController? controller;

  const PasswordInputField({super.key, this.controller});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: AppLocalizationsAr.instance.passwordFieldLabel,
      hint: AppLocalizationsAr.instance.passwordFieldHint,
      prefixIcon: Icons.lock_outline,
      obscureText: _isObscured,
      controller: widget.controller,
      fillColor: AppColors.border,
      validator: AppValidators.password,
      suffixWidget: GestureDetector(
        onTap: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(
            _isObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 18,
          ),
        ),
      ),
    );
  }
}
