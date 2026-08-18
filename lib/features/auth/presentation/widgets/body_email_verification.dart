import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/presentation/widgets/email_display_field.dart';
import 'package:learny/features/auth/presentation/widgets/email_verification_icon.dart';
import 'package:learny/features/auth/presentation/widgets/primary_auth_button.dart';

class BodyEmailVerification extends StatelessWidget {
  const BodyEmailVerification({super.key, required this.userE});

  final UserEntity userE;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            // ================= Top Title =================
            const SizedBox(height: 80),

            // ================= Email Icon =================
            Center(child: EmailVerificationIcon()),

            const SizedBox(height: 55),

            // ================= Main Title =================
            Text(
              AppLocalizationsAr.instance.formEmailVerificationPageHeading,
              textAlign: TextAlign.center,
              style: context.textStyle.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: context.colors.onSurface,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              AppLocalizationsAr.instance.formEmailVerificationPageSentTo,
              textAlign: TextAlign.center,
              style: context.textStyle.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 10),

            EmailDisplayField(email: userE.email),
            const SizedBox(height: 24),

            // ================= Description =================
            Text(
              AppLocalizationsAr.instance.formEmailVerificationPageDescription,
              textAlign: TextAlign.center,
              style: context.textStyle.bodySmall?.copyWith(
                height: 1.7,
                color: context.colors.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),

            const SizedBox(height: 70),

            // ================= Verify Button =================
            PrimaryAuthButton(
              text:
                  AppLocalizationsAr.instance.formEmailVerificationPageSuccess,
              onTap: () {},
            ),

            const SizedBox(height: 25),

            // ================= Resend =================
            TextButton(
              onPressed: () {
                // إعادة إرسال رابط التفعيل
              },
              child: Text(
                AppLocalizationsAr.instance.formEmailVerificationPageResend,
                style: context.textStyle.bodyMedium?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
