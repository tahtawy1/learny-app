import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hint;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final Color? suffixColor;
  final Color? labelColor;
  final Color? prefixColor;

  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;

  final double borderRadius;

  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  final Widget? suffixWidget;

  final bool obscureText;

  final TextEditingController? controller;
  final TextInputType? keyboardType;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  final int? maxLines;
  final int? maxLength;

  const CustomTextField({
    super.key,
    this.label,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixColor,
    this.labelColor,
    this.prefixColor,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius = 12,
    this.hintStyle,
    this.textStyle,
    this.suffixWidget,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.textStyle.bodyMedium?.copyWith(
              color: labelColor ?? AppColors.grey1,
            ),
          ),
          const SizedBox(height: 7),
        ],

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUnfocus,
          maxLength: maxLength,
          onChanged: onChanged,
          obscureText: obscureText,
          maxLines: maxLines,

          style: textStyle ?? context.textStyle.bodyLarge,

          decoration: InputDecoration(
            hintText: hint,

            hintStyle: hintStyle,

            filled: fillColor != null,
            fillColor: fillColor,

            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: prefixColor ?? context.colors.primary,
                    size: 20,
                  )
                : null,

            suffixIcon:
                suffixWidget ??
                (suffixIcon != null
                    ? Icon(
                        suffixIcon,
                        color: suffixColor ?? context.colors.primary,
                        size: 20,
                      )
                    : null),

            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor ?? Colors.transparent),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor ?? Colors.transparent),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: focusedBorderColor ?? context.colors.primary,
                width: 2,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: errorBorderColor ?? context.colors.error,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: errorBorderColor ?? context.colors.error,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
