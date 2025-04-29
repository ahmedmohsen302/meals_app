import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/views/home_view.dart';
import 'package:meals_app/views/tabs_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kColorScheme.surfaceContainer,
        appBarTheme: AppBarTheme().copyWith(
          centerTitle: true,
          color: kColorScheme.onPrimary,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: kColorScheme.onPrimaryContainer,
          ),
        ),
        colorScheme: kColorScheme,
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
    return const TabsView();
  }
}
