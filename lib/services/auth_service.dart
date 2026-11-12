import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firestore_service.dart';
import 'locale_service.dart';

/// Service managing all Firebase Authentication and Firestore user profile operations.
class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  // Local guest mode flag for offline or console-disabled anonymous sign-in fallback
  final ValueNotifier<bool> guestModeNotifier = ValueNotifier<bool>(false);

  /// Stream of authentication state changes.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Currently authenticated Firebase user.
  User? get currentUser => _auth.currentUser;

  /// Whether user is in guest exploration mode.
  bool get isGuest => guestModeNotifier.value || (_auth.currentUser?.isAnonymous ?? false);

  /// Enable guest exploration mode.
  Future<void> enterGuestMode() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      debugPrint('Anonymous auth fallback to local guest session: $e');
    }
    guestModeNotifier.value = true;
  }

  /// Sign in with email and password.
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    guestModeNotifier.value = false;
    final credential = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    return credential;
  }

  /// Register a new user with full name, email, and password.
  /// Also stores the profile record in Cloud Firestore.
  Future<UserCredential> signUpWithEmail({
    required String fullName,
    required String email,
    required String password,
  }) async {
    guestModeNotifier.value = false;
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );

    final user = credential.user;
    if (user != null) {
      // 1. Update Firebase Auth display name
      await user.updateDisplayName(fullName.trim());

      // 2. Persist basic user profile into Cloud Firestore
      try {
        await _firestoreService.saveUserProfile(
          uid: user.uid,
          fullName: fullName.trim(),
          email: email.trim().toLowerCase(),
        );
      } catch (e) {
        debugPrint('Firestore user doc creation notice: $e');
      }
    }

    return credential;
  }

  /// Send password reset link to user's email.
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email.trim());
  }

  /// Fetch user profile details from Cloud Firestore.
  Future<UserProfileModel?> getUserProfile(String uid) async {
    return _firestoreService.getUserProfile(uid);
  }

  /// Sign out the current user and reset guest mode.
  Future<void> signOut() async {
    guestModeNotifier.value = false;
    await _auth.signOut();
  }

  /// Translate Firebase error codes into clear, user-friendly bilingual messages.
  static String getErrorMessage(dynamic error) {
    final isArabic = LocaleService().isArabic;
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return isArabic
              ? 'صيغة البريد الإلكتروني غير صالحة.'
              : 'The email address format is invalid.';
        case 'user-disabled':
          return isArabic
              ? 'تم تعطيل هذا الحساب. يرجى التواصل مع الدعم الفني.'
              : 'This user account has been disabled. Please contact support.';
        case 'user-not-found':
          return isArabic
              ? 'لم يتم العثور على حساب بهذا البريد الإلكتروني.'
              : 'No account found with this email address.';
        case 'wrong-password':
          return isArabic
              ? 'كلمة المرور غير صحيحة. يرجى التحقق والمحاولة مجدداً.'
              : 'Incorrect password. Please verify and try again.';
        case 'invalid-credential':
          return isArabic
              ? 'بيانات الاعتماد غير صالحة. يرجى التحقق من البريد وكلمة المرور.'
              : 'Invalid email or password. Please try again.';
        case 'email-already-in-use':
          return isArabic
              ? 'يوجد حساب مسجل بالفعل بهذا البريد الإلكتروني.'
              : 'An account is already registered with this email.';
        case 'weak-password':
          return isArabic
              ? 'كلمة المرور ضعيفة جداً. يرجى إدخال 6 أحرف على الأقل.'
              : 'Password is too weak. Please use at least 6 characters.';
        case 'operation-not-allowed':
          return isArabic
              ? 'طريقة تسجيل الدخول هذه غير مفعلة حالياً.'
              : 'This sign-in method is currently disabled in your Firebase console.';
        case 'too-many-requests':
          return isArabic
              ? 'محاولات كثيرة غير ناجحة. يرجى المحاولة بعد بضع دقائق.'
              : 'Too many unsuccessful attempts. Please try again in a few minutes.';
        case 'network-request-failed':
          return isArabic
              ? 'خطأ في الاتصال بالشبكة. يرجى التحقق من اتصال الإنترنت.'
              : 'Network error. Please check your internet connection.';
        default:
          return error.message ??
              (isArabic
                  ? 'حدث خطأ في المصادقة. يرجى المحاولة مرة أخرى.'
                  : 'An authentication error occurred. Please try again.');
      }
    }
    return error.toString();
  }
}

