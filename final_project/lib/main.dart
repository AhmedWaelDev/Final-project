import 'package:final_project/screens/splash.dart';
import 'package:flutter/material.dart';

const Color primeColor = Color(0xFF50B7C5);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF50B7C5)),
        useMaterial3: true,
      ),
      home: const splash(),
    );
  }
}
