import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth/auth_gate.dart';
import 'services/locale_service.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase using DefaultFirebaseOptions.currentPlatform
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase initialization notice: $e');
  }

  // Initialize language preference from SharedPreferences
  await LocaleService().init();

  runApp(const WaypointApp());
}

/// Root application widget for Waypoint with dynamic bilingual support.
class WaypointApp extends StatelessWidget {
  const WaypointApp({super.key});

  // Waypoint Official Brand Palette
  static const Color background = Color(0xFF0A0A0F);
  static const Color neonLime = Color(0xFFC5FF4A);
  static const Color softPurple = Color(0xFF9B7BFF);
  static const Color card = Color(0xFF171720);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: LocaleService().localeNotifier,
      builder: (context, currentLocale, _) {
        final isArabic = currentLocale.languageCode == 'ar';
        final chosenFont = isArabic
            ? GoogleFonts.cairo().fontFamily
            : GoogleFonts.plusJakartaSans().fontFamily;

        return MaterialApp(
          title: 'Waypoint',
          debugShowCheckedModeBanner: false,
          locale: currentLocale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: background,
            primaryColor: neonLime,
            cardColor: card,
            colorScheme: const ColorScheme.dark(
              primary: neonLime,
              secondary: softPurple,
              surface: card,
            ),
            fontFamily: chosenFont,
            appBarTheme: const AppBarTheme(
              backgroundColor: background,
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
          home: const AuthGate(),
        );
      },
    );
  }
}
