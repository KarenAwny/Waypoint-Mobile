import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service managing dynamic language switching and persistence across app restarts.
class LocaleService {
  static final LocaleService _instance = LocaleService._internal();
  factory LocaleService() => _instance;
  LocaleService._internal();

  static const String _prefKey = 'waypoint_selected_locale';

  /// ValueNotifier holding the active Locale (defaults to English 'en').
  final ValueNotifier<Locale> localeNotifier =
      ValueNotifier<Locale>(const Locale('en'));

  Locale get currentLocale => localeNotifier.value;
  bool get isArabic => localeNotifier.value.languageCode == 'ar';
  bool get isEnglish => localeNotifier.value.languageCode == 'en';

  /// Load persisted language from SharedPreferences on app launch.
  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedCode = prefs.getString(_prefKey);
      if (savedCode != null && (savedCode == 'ar' || savedCode == 'en')) {
        localeNotifier.value = Locale(savedCode);
      } else {
        // Default language for new installations is English
        localeNotifier.value = const Locale('en');
      }
    } catch (e) {
      debugPrint('Error initializing LocaleService: $e');
      localeNotifier.value = const Locale('en');
    }
  }

  /// Change active language and persist choice to SharedPreferences.
  Future<void> setLocale(Locale newLocale) async {
    if (newLocale.languageCode != 'en' && newLocale.languageCode != 'ar') {
      return;
    }
    if (localeNotifier.value.languageCode == newLocale.languageCode) {
      return;
    }

    localeNotifier.value = newLocale;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKey, newLocale.languageCode);
    } catch (e) {
      debugPrint('Error persisting locale preference: $e');
    }
  }

  /// Toggle between English and Arabic.
  Future<void> toggleLanguage() async {
    if (isArabic) {
      await setLocale(const Locale('en'));
    } else {
      await setLocale(const Locale('ar'));
    }
  }
}

