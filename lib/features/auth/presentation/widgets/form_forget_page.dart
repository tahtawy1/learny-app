import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/features/auth/presentation/view_model/forget_cubit/forget_cubit.dart';
import 'package:learny/features/auth/presentation/widgets/email_input_field.dart';
import 'package:learny/features/auth/presentation/widgets/primary_auth_button.dart';

class FormForgetPage extends StatelessWidget {
  FormForgetPage({super.key});

  final keyForm = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Container(
        padding: EdgeInsets.only(right: 30, left: 30),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/forgetP.png")),
              ),
            ),
            Text(
              AppLocalization.instance.formForgetPageForgotPassword,
              textAlign: .center,
              style: context.textStyle.displayLarge?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: context.colors.onSurface,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Text(
                AppLocalization.instance.formForgetPageDescription,
                textAlign: .center,

                style: context.textStyle.bodyMedium?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
            SizedBox(height: 30),
            EmailInputField(),
            SizedBox(height: 20),
            BlocBuilder<ForgetCubit, ForgetState>(
              builder: (context, state) {
                return PrimaryAuthButton(
                  isLoading: state is ForgetLoading,
                  text: AppLocalization.instance.formForgetPageSendRecoveryLink,
                  onTap: () async {
                    if (keyForm.currentState!.validate()) {
                      await ForgetCubit.get(
                        context,
                      ).sendPasswordResetEmail(emailController.text.trim());
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
