import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/theme/app_radius.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:learny/features/profile/presentation/widgets/profile_header_card.dart';
import 'package:learny/features/profile/presentation/widgets/settings_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfileView();
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.error,
            ),
          );
        } else if (state is ProfileUpdateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalization.instance.profileUpdateSuccess),
              backgroundColor: AppColors.success,
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = ProfileCubit.get(context);
        final user = cubit.user;

        if (state is ProfileLoading && user == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        final currentUser =
            user ??
            const UserEntity(
              email: 'ahmed@student.edu',
              name: 'أحمد محمد',
              phone: '+966 5X XXX XXXX',
            );

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // 1. Header Gradient Card
                ProfileHeaderCard(
                  user: currentUser,
                  onEditTap: () {
                    context.push('/edit_profile');
                  },
                ),

                // 2. Body Sections
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      // Personal Info Card
                      _buildPersonalInfoCard(context, currentUser),

                      const SizedBox(height: 16),

                      // Settings Section
                      const SettingsSection(),

                      const SizedBox(height: 16),

                      // About Platform Card
                      _buildAboutPlatformCard(context),

                      const SizedBox(height: 16),

                      // Logout Button
                      _buildLogoutButton(context, cubit),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPersonalInfoCard(BuildContext context, UserEntity user) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: AppRadius.lg,
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    AppLocalization.instance.profilePersonalInfo,
                    style: context.textStyle.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colors.onSurface,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.person_outline_rounded,
                    size: 20,
                    color: AppColors.primary,
                  ),
                ],
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  context.push('/edit_profile');
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _buildInfoRow(
            context,
            label: AppLocalization.instance.profileName,
            value: user.name ?? '',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            context,
            label: AppLocalization.instance.profileEmail,
            value: user.email,
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            context,
            label: AppLocalization.instance.profilePhone,
            value: user.phone ?? '',
            icon: Icons.phone_iphone_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.textStyle.bodySmall?.copyWith(
                  color: AppColors.textHint,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: context.textStyle.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colors.onSurface,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppRadius.sm,
          ),
          child: Icon(icon, size: 18, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildAboutPlatformCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: AppRadius.lg,
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                size: 20,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 8),

              Text(
                AppLocalization.instance.profileAboutPlatform,
                style: context.textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalization.instance.profileAboutDescription,
            textAlign: TextAlign.center,
            style: context.textStyle.bodySmall?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: AppRadius.full,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  size: 14,
                  color: AppColors.white,
                ),
                const SizedBox(width: 6),
                Text(
                  AppLocalization.instance.profileMission,
                  style: context.textStyle.bodySmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.teal),
                shape: RoundedRectangleBorder(borderRadius: AppRadius.sm),
              ),
              child: Text(
                AppLocalization.instance.profileLearnMore,
                style: context.textStyle.labelLarge?.copyWith(
                  color: AppColors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context, ProfileCubit cubit) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: AppRadius.lg,
        border: Border.all(color: AppColors.errorLight),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            await cubit.logout();
            if (context.mounted) {
              context.go('/login');
            }
          },
          borderRadius: AppRadius.lg,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 14,
                  color: AppColors.error,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalization.instance.profileLogout,
                      style: context.textStyle.bodyLarge?.copyWith(
                        color: AppColors.error,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.errorLight,
                        borderRadius: AppRadius.sm,
                      ),
                      child: const Icon(
                        Icons.logout_rounded,
                        size: 18,
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
