import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:learny/features/auth/presentation/widgets/app_outlined_button.dart';
import 'package:learny/features/auth/presentation/widgets/email_input_field.dart';
import 'package:learny/features/auth/presentation/widgets/forgot_password_widget.dart';
import 'package:learny/features/auth/presentation/widgets/or_divider.dart';
import 'package:learny/features/auth/presentation/widgets/password_input_field.dart';
import 'package:learny/features/auth/presentation/widgets/primary_auth_button.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (keyForm.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text;
      final UserEntity userEntity = UserEntity(
        email: email,
        password: password,
      );

      await LoginCubit.get(context).signInWithEmailAndPassword(userEntity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(height: 30),

            Text(
              AppLocalizationsAr.instance.formLoginPage,
              style: context.textStyle.displayLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 23,
                color: context.colors.onSurface,
              ),
            ),

            const SizedBox(height: 20),

            EmailInputField(controller: emailController),

            const SizedBox(height: 15),

            PasswordInputField(controller: passwordController),

            const SizedBox(height: 15),

            ForgotPasswordWidget(
              onTap: () {
                context.push('/login/forget');
              },
            ),

            const SizedBox(height: 20),

            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return PrimaryAuthButton(
                  text: AppLocalizationsAr.instance.formLoginPage,
                  onTap: () async {
                    await login();
                  },
                  isLoading: state is LoginLoading,
                );
              },
            ),

            const SizedBox(height: 25),

            const OrDivider(),

            const SizedBox(height: 25),

            AppOutlinedButton(
              onPressed: () {
                context.push('/login/register');
              },
              text: AppLocalizationsAr.instance.formLoginPageCreateAccount,
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
