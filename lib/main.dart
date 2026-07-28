import 'package:flutter/material.dart';
import 'package:learny/core/app/app.dart';
import 'package:learny/core/app/app_initializer.dart';
import 'package:learny/core/di/service_locator.dart';

void main() async {
  await AppInitializer().initApp();
  await setupLocators();
  runApp(const App());
}
