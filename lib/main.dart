import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tracker/firebase_options.dart';
//import 'package:tracker/screens/sign_up.dart';
import 'package:tracker/widgets/auth_gate.dart';

void main() async  {


  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
    DevicePreview( 
      enabled: true,
      builder: (context) =>
    const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income Expense Tracker',
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);


      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
