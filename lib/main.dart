import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tracker/screens/sign_up.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: 
    (context) =>
    const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income Expense Tracker',
      debugShowCheckedModeBanner: false,
      home: SignUpView(),
    );
  }
}
