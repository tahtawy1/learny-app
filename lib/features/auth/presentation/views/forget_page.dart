import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/extensions/snak_bar_message.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/features/auth/presentation/view_model/forget_cubit/forget_cubit.dart';
import 'package:learny/features/auth/presentation/widgets/app_back_button.dart';
import 'package:learny/features/auth/presentation/widgets/form_forget_page.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetCubit, ForgetState>(
      listener: (context, state) {
        if (state is ForgetFailure) {
          context.snackBar(state.message, false);
        } else if (state is ForgetSuccess) {
          context.snackBar(state.message, true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,

          title: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Text(
              AppLocalization.instance.formForgetPageTitle,
              style: context.textStyle.displayLarge?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 27,
                color: context.colors.surface,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 70, right: 20),
              child: AppBackButton(
                onPressed: () {
                  context.pop();
                },
                size: 50,
                iconSize: 28,
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          backgroundColor: context.colors.primary,
        ),
        body: SafeArea(child: FormForgetPage()),
      ),
    );
  }
}
