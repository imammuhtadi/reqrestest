import 'package:flutter/material.dart';
import 'package:netwerktest/presentation/login/login_screen.dart';
import 'package:netwerktest/theme/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Test',
      theme: ThemeData(primarySwatch: AppColor.primary),
      home: const LoginScreen(),
    );
  }
}
