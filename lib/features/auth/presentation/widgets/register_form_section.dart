import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:learny/features/auth/presentation/widgets/email_input_field.dart';
import 'package:learny/features/auth/presentation/widgets/name_input_field.dart';
import 'package:learny/features/auth/presentation/widgets/password_input_field.dart';
import 'package:learny/features/auth/presentation/widgets/phone_input_field.dart';
import 'package:learny/features/auth/presentation/widgets/register_bottom_section.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 30),

              NameInputField(controller: nameController),
              const SizedBox(height: 15),

              EmailInputField(controller: emailController),
              const SizedBox(height: 15),

              PhoneInputField(controller: phoneController),
              const SizedBox(height: 15),

              PasswordInputField(controller: passwordController),
              const SizedBox(height: 15),

              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return RegisterBottomSection(
                    onCreateAccount: () async {
                      if (keyForm.currentState!.validate()) {
                        final name = nameController.text.trim();
                        final email = emailController.text.trim();
                        final phone = phoneController.text.trim();
                        final password = passwordController.text;
                        final UserEntity userEntity = UserEntity(
                          email: email,
                          password: password,
                          name: name,
                          phone: phone,
                        );
                        await RegisterCubit.get(
                          context,
                        ).createUserWithEmailAndPassword(userEntity);
                      }
                    },
                    isLoadingOnCreateAccount: state is RegisterLoading,
                    onLogin: () {
                      context.pop();
                    },
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
