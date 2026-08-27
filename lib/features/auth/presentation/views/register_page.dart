import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:learny/features/auth/presentation/widgets/app_back_button.dart';
import 'package:learny/features/auth/presentation/widgets/register_form_section.dart';
import 'package:learny/core/extensions/snak_bar_message.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.push("/email_verification", extra: state.userEntity);
        } else if (state is RegisterError) {
          context.snackBar(state.message, false);
        }
      },
      child: Scaffold(
        backgroundColor: context.colors.primary,
        bottomSheet: SafeArea(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.8,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: context.colors.surface,
            ),
            child: RegisterFormSection(),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 10),
                child: Row(
                  mainAxisAlignment: .end,

                  children: [
                    Column(
                      children: [
                        Text(
                          AppLocalizationsAr.instance.formRegisterPageTitle,
                          style: context.textStyle.displayLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 27,
                            color: context.colors.surface,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          AppLocalizationsAr.instance.formRegisterPageSubtitle,
                          style: context.textStyle.bodySmall?.copyWith(
                            fontWeight: FontWeight.w100,

                            color: context.colors.surface,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 70),
                    AppBackButton(
                      onPressed: () {
                        context.pop();
                      },
                      size: 40,
                      iconSize: 24,
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
