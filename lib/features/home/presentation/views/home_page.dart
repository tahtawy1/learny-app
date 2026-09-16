import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppLocalization.instance.bottomNavHome)),
    );
  }
}
