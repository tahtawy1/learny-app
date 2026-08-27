import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/features/splash/presentation/widgets/three_dots_loading.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),

            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colors.primary.withValues(alpha: .5),
                  width: .5,
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: context.colors.surface,
                      boxShadow: [
                        BoxShadow(
                          color: context.colors.primary.withValues(
                            alpha: 0.3,
                          ),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Image.asset('assets/logo.png'),
                  ),

                  Positioned(
                    bottom: 80,

                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          context.colors.primary,
                          context.colors.primary.withValues(alpha: 0.5),
                        ],
                      ).createShader(bounds),
                      child: Text(
                        AppLocalizationsAr.instance.nameApp,
                        style: context.textStyle.displayLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                          color: context.colors.surface,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 52,

                    child: Text(
                      AppLocalizationsAr.instance.nameAppEn,
                      style: context.textStyle.displayLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: ThreeDotsLoading(
                color: context.colors.primary,
                size: 6,
                spacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
