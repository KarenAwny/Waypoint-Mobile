import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../l10n/app_localizations.dart';
import '../home.dart';
import 'login_screen.dart';

/// Gatekeeper widget directing users to HomeScreen or LoginScreen based on auth state.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  static const Color background = Color(0xFF0A0A0F);
  static const Color neonLime = Color(0xFFC5FF4A);

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final l10n = AppLocalizations.of(context);

    return ValueListenableBuilder<bool>(
      valueListenable: authService.guestModeNotifier,
      builder: (context, isGuest, _) {
        if (isGuest) {
          return const HomeScreen();
        }

        return StreamBuilder<User?>(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            // While Firebase verifies auth state token
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                backgroundColor: background,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.explore_rounded,
                        color: neonLime,
                        size: 48,
                      ),
                      const SizedBox(height: 20),
                      const CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: neonLime,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.connectingToWaypoint,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            // User is signed in
            if (snapshot.hasData && snapshot.data != null) {
              return const HomeScreen();
            }

            // User is not signed in
            return const LoginScreen();
          },
        );
      },
    );
  }
}
