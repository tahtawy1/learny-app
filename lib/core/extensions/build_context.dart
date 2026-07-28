import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localizations.dart';

extension ColorSchemeExt on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

extension TextThemeExt on BuildContext {
  TextTheme get textStyle => Theme.of(this).textTheme;
}

extension ThemeExt on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension LocalizationsExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
