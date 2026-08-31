import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/extensions/snak_bar_message.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';
import 'package:learny/features/auth/presentation/widgets/app_back_button.dart';
import 'package:learny/features/auth/presentation/widgets/body_email_verification.dart';

class EmailVerificationPage extends StatelessWidget {
  final UserEntity userEntity;

  const EmailVerificationPage({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationFailure) {
          context.snackBar(state.message, false);
        } else if (state is EmailVerificationSuccess) {
          context.go('/profile');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            AppLocalizationsAr.instance.formEmailVerificationPageTitle,
            textAlign: TextAlign.center,
            style: context.textStyle.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: context.colors.onSurface,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppBackButton(
                onPressed: () {
                  context.pop();
                },
                size: 45,
                iconSize: 28,
              ),
            ),
          ],
        ),

        body: SafeArea(child: BodyEmailVerification(userE: userEntity)),
      ),
    );
  }
}
