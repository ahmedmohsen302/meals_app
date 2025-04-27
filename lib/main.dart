import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/views/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme().copyWith(
          centerTitle: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: kColorScheme,
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
    return const HomeView();
  }
}
