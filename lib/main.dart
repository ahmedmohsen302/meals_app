import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xC28A0B98),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: MealsApp(),
    ),
  );
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
