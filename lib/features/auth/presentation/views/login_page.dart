import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/extensions/snak_bar_message.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:learny/features/auth/presentation/widgets/login_form_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          if (state.userModel.emailVerified == true) {
            context.go('/home');
          } else {
            context.push("/email_verification", extra: state.userModel);
          }
        } else if (state is LoginError) {
          context.snackBar(state.message, false);
        }
      },
      child: Scaffold(
        backgroundColor: context.colors.primary,
        bottomSheet: Container(
          height: MediaQuery.sizeOf(context).height * 0.71,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: context.colors.surface,
          ),
          child: LoginFormSection(),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Row(),

              Container(
                padding: EdgeInsets.only(right: 20, top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalization.instance.loginWelcome,
                      style: context.textStyle.displayLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 27,
                        color: context.colors.surface,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      AppLocalization.instance.loginSubtitle,
                      style: context.textStyle.bodySmall?.copyWith(
                        fontWeight: FontWeight.w100,

                        color: context.colors.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
