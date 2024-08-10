import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantrythief/injection_container.dart';
import 'package:pantrythief/ui/router.dart';

void main() {
  initializeDependencies();
  runApp(const ProviderScope(child: PantryThief()));
}

class PantryThief extends StatelessWidget {
  final primaryColor = const Color(0xFFC13779);

  const PantryThief({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry Thief',
      initialRoute: '/ingredients',
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          bodyLarge: GoogleFonts.roboto(
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          bodyMedium: GoogleFonts.roboto(
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          bodySmall: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          // button
          labelLarge: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white,
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: const Color(0xFF666666),
          onSecondary: Colors.white,
        ),
      ),
    );
  }
}
