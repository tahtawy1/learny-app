import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/features/auth/presentation/widgets/primary_auth_button.dart';

class RegisterBottomSection extends StatefulWidget {
  final VoidCallback? onCreateAccount;
  final VoidCallback? onLogin;
  final bool isLoadingOnCreateAccount;
  const RegisterBottomSection({
    super.key,
    this.onCreateAccount,
    this.onLogin,
    this.isLoadingOnCreateAccount = false,
  });

  @override
  State<RegisterBottomSection> createState() => _RegisterBottomSectionState();
}

class _RegisterBottomSectionState extends State<RegisterBottomSection> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.colors.primary;
    final textColor = context.colors.onSurface;

    return Column(
      children: [
        // ================= Terms =================
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: isAccepted,
                onChanged: (value) {
                  setState(() {
                    isAccepted = value ?? false;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: BorderSide(color: context.colors.outline, width: 1),
                activeColor: primaryColor,
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: RichText(
                text: TextSpan(
                  style: context.textStyle.bodyMedium?.copyWith(
                    color: textColor,
                  ),
                  children: [
                    TextSpan(
                      text: AppLocalizationsAr
                          .instance
                          .formRegisterPageTermsPrefix,
                    ),

                    TextSpan(
                      text: AppLocalizationsAr
                          .instance
                          .formRegisterPageTermsAndPrivacy,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 28),

        // ================= Create Account =================
        SizedBox(
          width: double.infinity,
          height: 58,
          child: PrimaryAuthButton(
            text: AppLocalizationsAr.instance.formRegisterPageTitle,
            onTap: widget.onCreateAccount ?? () => {},
            isLoading: widget.isLoadingOnCreateAccount,
          ),
        ),

        const SizedBox(height: 22),

        // ================= Login =================
        GestureDetector(
          onTap: widget.onLogin,
          child: RichText(
            text: TextSpan(
              style: context.textStyle.bodyMedium?.copyWith(color: textColor),
              children: [
                TextSpan(
                  text: AppLocalizationsAr
                      .instance
                      .formRegisterPageAlreadyHaveAccount,
                ),
                TextSpan(
                  text: AppLocalizationsAr.instance.formLoginPage,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
