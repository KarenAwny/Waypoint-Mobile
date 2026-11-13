import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Data model representing a saved career assessment result in Cloud Firestore.
class AssessmentResultModel {
  final String id;
  final String careerRecommendation;
  final String secondaryCareer;
  final int matchPercentage;
  final Map<String, dynamic> answers;
  final DateTime createdAt;

  const AssessmentResultModel({
    required this.id,
    required this.careerRecommendation,
    required this.secondaryCareer,
    required this.matchPercentage,
    required this.answers,
    required this.createdAt,
  });

  factory AssessmentResultModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    DateTime createdDate;
    final rawTimestamp = data['createdAt'];
    if (rawTimestamp is Timestamp) {
      createdDate = rawTimestamp.toDate();
    } else {
      createdDate = DateTime.now();
    }

    return AssessmentResultModel(
      id: doc.id,
      careerRecommendation:
          data['careerRecommendation'] ?? 'Mobile Development',
      secondaryCareer: data['secondaryCareer'] ?? 'Frontend Engineering',
      matchPercentage: (data['matchPercentage'] as num?)?.toInt() ?? 95,
      answers: Map<String, dynamic>.from(data['answers'] ?? {}),
      createdAt: createdDate,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'careerRecommendation': careerRecommendation,
      'secondaryCareer': secondaryCareer,
      'matchPercentage': matchPercentage,
      'answers': answers,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}

/// Data model representing the user's profile stored at `users/{uid}`.
class UserProfileModel {
  final String uid;
  final String fullName;
  final String email;
  final DateTime? createdAt;
  final bool isAnonymous;

  const UserProfileModel({
    required this.uid,
    required this.fullName,
    required this.email,
    this.createdAt,
    this.isAnonymous = false,
  });

  factory UserProfileModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    DateTime? createdDate;
    final rawTimestamp = data['createdAt'];
    if (rawTimestamp is Timestamp) {
      createdDate = rawTimestamp.toDate();
    }

    return UserProfileModel(
      uid: doc.id,
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      createdAt: createdDate,
      isAnonymous: data['isAnonymous'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
      'isAnonymous': isAnonymous,
    };
  }
}

/// Service managing all Cloud Firestore reads, writes, and real-time streams.
class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  // ---------------------------------------------------------------------------
  // User Profile Operations (users/{uid})
  // ---------------------------------------------------------------------------

  /// Save or update user profile document in Firestore.
  Future<void> saveUserProfile({
    required String uid,
    required String fullName,
    required String email,
    bool isAnonymous = false,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'fullName': fullName.trim(),
        'email': email.trim().toLowerCase(),
        'createdAt': FieldValue.serverTimestamp(),
        'lastActive': FieldValue.serverTimestamp(),
        'isAnonymous': isAnonymous,
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Firestore saveUserProfile notice: $e');
    }
  }

  /// Retrieve the user's profile once from `users/{uid}`.
  Future<UserProfileModel?> getUserProfile(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) return null;
      return UserProfileModel.fromFirestore(doc);
    } catch (e) {
      debugPrint('Firestore getUserProfile notice: $e');
      return null;
    }
  }

  /// Stream real-time updates for `users/{uid}`.
  Stream<UserProfileModel?> getUserProfileStream(String uid) {
    try {
      return _firestore.collection('users').doc(uid).snapshots().map((doc) {
        if (!doc.exists) return null;
        return UserProfileModel.fromFirestore(doc);
      }).handleError((error) {
        debugPrint('Firestore getUserProfileStream error: $error');
        return null;
      });
    } catch (e) {
      debugPrint('Firestore getUserProfileStream init error: $e');
      return const Stream.empty();
    }
  }

  // ---------------------------------------------------------------------------
  // Assessment Results Operations (users/{uid}/assessmentResults/{resultId})
  // ---------------------------------------------------------------------------

  /// Save an assessment result under the user's private subcollection.
  Future<String> saveAssessmentResult({
    required String uid,
    required String careerRecommendation,
    required String secondaryCareer,
    required int matchPercentage,
    required Map<String, dynamic> answers,
  }) async {
    final docRef = _firestore
        .collection('users')
        .doc(uid)
        .collection('assessmentResults')
        .doc();

    await docRef.set({
      'resultId': docRef.id,
      'careerRecommendation': careerRecommendation,
      'secondaryCareer': secondaryCareer,
      'matchPercentage': matchPercentage,
      'answers': answers,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return docRef.id;
  }

  /// Stream previous assessment results for a specific user ordered by latest first.
  Stream<List<AssessmentResultModel>> getAssessmentHistoryStream(String uid) {
    try {
      return _firestore
          .collection('users')
          .doc(uid)
          .collection('assessmentResults')
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => AssessmentResultModel.fromFirestore(doc))
            .toList();
      }).handleError((error) {
        debugPrint('Firestore history stream error: $error');
        return <AssessmentResultModel>[];
      });
    } catch (e) {
      debugPrint('Firestore history stream init error: $e');
      return const Stream.empty();
    }
  }

  /// Fetch previous assessment results once for a specific user.
  Future<List<AssessmentResultModel>> getAssessmentHistory(String uid) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(uid)
          .collection('assessmentResults')
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => AssessmentResultModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      debugPrint('Firestore getAssessmentHistory notice: $e');
      return [];
    }
  }
}

