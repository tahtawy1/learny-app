import 'package:flutter/material.dart';
import 'package:learny/core/app/app.dart';
import 'package:learny/core/app/app_initializer.dart';

void main() async {
  await AppInitializer().initApp();
  runApp(const App());
}
