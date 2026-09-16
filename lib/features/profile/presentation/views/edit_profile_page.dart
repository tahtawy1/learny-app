import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/theme/app_radius.dart';
import 'package:learny/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:learny/features/profile/presentation/widgets/user_avatar.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final currentName = context.read<ProfileCubit>().user?.name ?? '';
    _nameController = TextEditingController(text: currentName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentName = context.read<ProfileCubit>().user?.name ?? '';

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          context.pop();
        } else if (state is ProfileUpdateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ProfileUpdateLoading;

        return Scaffold(
          body: Stack(
            children: [
              // 1. Top Gradient Background with User Avatar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradient,
                  ),
                  child: SafeArea(
                    child: Center(
                      child: UserAvatar(
                        name: currentName,
                        size: 90,
                        showEditBadge: false,
                      ),
                    ),
                  ),
                ),
              ),

              // 2. Dim / Background Layer
              Positioned.fill(
                child: Container(color: Colors.black.withValues(alpha: 0.25)),
              ),

              // 3. Bottom Sheet Modal Card
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 20,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    top: false,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Sheet Handle Bar
                          Container(
                            width: 40,
                            height: 4,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: AppColors.border,
                              borderRadius: AppRadius.full,
                            ),
                          ),

                          // Modal Title
                          Text(
                            AppLocalization.instance.editNameTitle,
                            style: context.textStyle.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colors.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),

                          // Current Name Subtitle
                          Text(
                            '${AppLocalization.instance.editCurrentNamePrefix}$currentName',
                            style: context.textStyle.bodySmall?.copyWith(
                              color: AppColors.textHint,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Field Label
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppLocalization.instance.editNewName,
                              style: context.textStyle.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.colors.onSurface,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Text Field
                          TextFormField(
                            controller: _nameController,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: AppRadius.sm,
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: AppRadius.sm,
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: AppRadius.sm,
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                  width: 1.5,
                                ),
                              ),
                              filled: true,
                              fillColor: context.colors.surface,
                            ),
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return AppLocalization
                                    .instance
                                    .validationEnterNewName;
                              }
                              if (val.trim().length < 3) {
                                return AppLocalization
                                    .instance
                                    .validationNameMinChars;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),

                          // Action Buttons
                          Row(
                            children: [
                              // Save Button
                              Expanded(
                                child: SizedBox(
                                  height: 46,
                                  child: ElevatedButton(
                                    onPressed: isLoading
                                        ? null
                                        : () {
                                            if (_formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              context
                                                  .read<ProfileCubit>()
                                                  .updateUserProfile(
                                                    name: _nameController.text
                                                        .trim(),
                                                  );
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: AppColors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: AppRadius.sm,
                                      ),
                                    ),
                                    child: isLoading
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: AppColors.white,
                                            ),
                                          )
                                        : Text(
                                            AppLocalization
                                                .instance
                                                .editSaveChanges,
                                            style: context.textStyle.labelLarge
                                                ?.copyWith(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Cancel Button
                              Expanded(
                                child: SizedBox(
                                  height: 46,
                                  child: OutlinedButton(
                                    onPressed: isLoading
                                        ? null
                                        : () {
                                            context.pop();
                                          },
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: AppColors.border,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: AppRadius.sm,
                                      ),
                                    ),
                                    child: Text(
                                      AppLocalization.instance.editCancel,
                                      style: context.textStyle.labelLarge
                                          ?.copyWith(
                                            color: AppColors.textSecondary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
