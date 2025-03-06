import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_onepercent/core/introduction_screen.dart';
import 'features/Profile/presentation/pages/profile_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Introduction(),
    );
  }
}
