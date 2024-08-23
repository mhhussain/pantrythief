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
  final Map<String, Color> palette = const {
    'background': Color(0xFF404040),
    'primary': Color(0xFFC13779),
    'primary-accent': Color(0xFFFFAAAA),
  };
  final primaryColor = const Color(0xFFC13779);

  const PantryThief({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry Thief',
      initialRoute: '/ingredients',
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        primaryColor: palette['primary']!,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.roboto(
            color: palette['primary-accent']!,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
          titleMedium: GoogleFonts.roboto(
            color: palette['primary-accent']!,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          bodyLarge: GoogleFonts.roboto(
            color: palette['primary-accent']!,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          bodyMedium: GoogleFonts.roboto(
            color: palette['primary-accent']!,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          bodySmall: GoogleFonts.roboto(
            color: palette['primary-accent']!,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          // button
          labelLarge: GoogleFonts.roboto(
            color: palette['primary-accent']!,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          error: Colors.red,
          onError: palette['primary-accent']!,
          surface: palette['background']!,
          onSurface: palette['background']!,
          primary: palette['primary']!,
          onPrimary: palette['primary-accent']!,
          secondary: palette['primary-accent']!,
          onSecondary: palette['primary-accent']!,
        ),
        dividerColor: palette['primary-accent']!.withOpacity(0.35),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: palette['primary-accent']!
        ),
        iconTheme: IconThemeData(
          color: palette['primary-accent']!
        ),
      ),
    );
  }
}
