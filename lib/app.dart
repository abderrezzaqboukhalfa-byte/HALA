import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class HalaApp extends StatelessWidget {
  const HalaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hala',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B9D),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Rounded',
        scaffoldBackgroundColor: const Color(0xFFFFF9F0),
      ),
      home: const HomeScreen(),
    );
  }
}
