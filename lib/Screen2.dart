// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'data/assessment_data.dart';
import 'services/auth_service.dart';
import 'services/firestore_service.dart';
import 'services/locale_service.dart';
import 'l10n/app_localizations.dart';
import 'auth/login_screen.dart';
import 'Screen1.dart';

class Screen2 extends StatefulWidget {
  final String selectedInterest;
  final String? secondaryCareer;
  final int matchPercentage;
  final Map<String, dynamic>? answers;
  final bool isHistorical;
  final DateTime? savedDate;

  const Screen2({
    super.key,
    required this.selectedInterest,
    this.secondaryCareer,
    this.matchPercentage = 96,
    this.answers,
    this.isHistorical = false,
    this.savedDate,
  });

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  // Waypoint Official Brand Palette
  static const Color background = Color(0xFF0A0A0F);
  static const Color neonLime = Color(0xFFC5FF4A);
  static const Color softPurple = Color(0xFF9B7BFF);
  static const Color card = Color(0xFF171720);

  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  bool _isSaving = false;
  bool _isSaved = false;
  String? _saveError;

  @override
  void initState() {
    super.initState();
    if (widget.isHistorical) {
      _isSaved = true;
    } else {
      _autoSaveIfAuthenticated();
    }
  }

  Future<void> _autoSaveIfAuthenticated() async {
    final user = _authService.currentUser;
    if (user == null || _authService.isGuest) {
      return;
    }
    await _saveToFirestore();
  }

  Future<void> _saveToFirestore() async {
    final user = _authService.currentUser;
    if (user == null) {
      setState(() {
        _saveError = 'Please sign in to save your results to Cloud Firestore.';
      });
      return;
    }

    setState(() {
      _isSaving = true;
      _saveError = null;
    });

    try {
      final primaryPath = AssessmentData.getPath(widget.selectedInterest);
      final secPath = AssessmentData.getPath(widget.secondaryCareer ?? 'backend');

      await _firestoreService.saveAssessmentResult(
        uid: user.uid,
        careerRecommendation: primaryPath.titleEn,
        secondaryCareer: secPath.titleEn,
        matchPercentage: widget.matchPercentage,
        answers: widget.answers ?? {},
      );

      if (mounted) {
        setState(() {
          _isSaving = false;
          _isSaved = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSaving = false;
          _saveError = e.toString();
        });
      }
    }
  }

  IconData _getIconForCareerId(String careerId) {
    switch (careerId) {
      case 'mobile':
        return Icons.phone_android_rounded;
      case 'frontend':
        return Icons.laptop_chromebook_rounded;
      case 'backend':
        return Icons.dns_rounded;
      case 'cybersecurity':
        return Icons.shield_rounded;
      case 'data':
        return Icons.insights_rounded;
      case 'uiux':
        return Icons.palette_rounded;
      default:
        return Icons.terminal_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isArabic = l10n.isArabic;
    final path = AssessmentData.getPath(widget.selectedInterest);
    final secondaryPath = widget.secondaryCareer != null
        ? AssessmentData.getPath(widget.secondaryCareer)
        : null;

    final primaryIcon = _getIconForCareerId(path.id);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            isArabic
                ? Icons.arrow_forward_ios_rounded
                : Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.isHistorical
              ? (isArabic ? 'النتيجة المحفوظة' : 'Saved Recommendation')
              : (isArabic ? 'المسار المقترح لك' : 'Your Recommended Path'),
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                LocaleService().toggleLanguage();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: softPurple.withValues(alpha: 0.4),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.language_rounded,
                      size: 14,
                      color: softPurple,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isArabic ? 'English' : 'العربية',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Firestore Cloud Sync Status Banner
              _buildCloudSyncBanner(isArabic),

              const SizedBox(height: 16),

              // Match Hero Banner
              _buildHeroMatchCard(path, primaryIcon, isArabic),

              const SizedBox(height: 24),

              // Personality Profile Section (from pathsData.js)
              _buildPersonalitySection(path, isArabic),

              const SizedBox(height: 24),

              // Recommended Roadmap Steps (from pathsData.js)
              _buildRoadmapSection(path, isArabic),

              const SizedBox(height: 24),

              // Core Skills & Capstone Project
              _buildSkillsAndProjectCard(path, isArabic),

              const SizedBox(height: 24),

              // Secondary career alternative (if available)
              if (secondaryPath != null && secondaryPath.id != path.id)
                _buildSecondaryCareerCard(secondaryPath, isArabic),

              const SizedBox(height: 30),

              // Primary Action Buttons
              _buildActionButtons(context, isArabic),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloudSyncBanner(bool isArabic) {
    final user = _authService.currentUser;
    final isGuest = _authService.isGuest;

    // 1. If viewing an archived historical result
    if (widget.isHistorical) {
      final dateStr = widget.savedDate != null
          ? '${widget.savedDate!.day}/${widget.savedDate!.month}/${widget.savedDate!.year}'
          : (isArabic ? 'محفوظ بالأرشيف' : 'Archived');
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: softPurple.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.history_edu_rounded,
              color: softPurple,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                isArabic
                    ? 'سجل تقييم محفوظ سحابياً بتاريخ $dateStr'
                    : 'Historical assessment synced to Cloud Firestore ($dateStr)',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // 2. Currently Saving to Firestore
    if (_isSaving) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: neonLime.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: neonLime,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isArabic
                    ? 'جاري حفظ نتائجك الـ 15 في قاعدة بيانات فايرستور...'
                    : 'Saving your 15 assessment answers to Cloud Firestore...',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // 3. Saved successfully
    if (_isSaved) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: neonLime.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.cloud_done_rounded,
              color: neonLime,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                isArabic
                    ? 'تم حفظ تقييمك بنجاح في ملفك الشخصي عبر فايرستور!'
                    : 'Assessment result successfully synced to Cloud Firestore!',
                style: const TextStyle(
                  color: neonLime,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // 4. Save Error
    if (_saveError != null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.redAccent.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.redAccent.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.redAccent,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                isArabic
                    ? 'تعذر الحفظ: $_saveError'
                    : 'Failed to sync: $_saveError',
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                ),
              ),
            ),
            TextButton(
              onPressed: _saveToFirestore,
              child: Text(
                isArabic ? 'إعادة' : 'Retry',
                style: const TextStyle(
                  color: neonLime,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // 5. Guest Mode Prompt
    if (isGuest || user == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: softPurple.withValues(alpha: 0.35),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              color: softPurple,
              size: 18,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                isArabic
                    ? 'أنت تتصفح كزائر. سجّل الدخول لحفظ نتيجتك ومزامنة مسارك.'
                    : 'Browsing as Guest. Sign in to permanently save your results.',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  height: 1.3,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: Text(
                isArabic ? 'دخول' : 'Sign In',
                style: const TextStyle(
                  color: neonLime,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildHeroMatchCard(
      CareerPathInfo path, IconData icon, bool isArabic) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: neonLime.withValues(alpha: 0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: neonLime.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Match Percentage Badge (calculated directly from user answers)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: neonLime.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: neonLime.withValues(alpha: 0.5),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: neonLime,
                      size: 15,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isArabic
                          ? 'نسبة التوافق: ${widget.matchPercentage}%'
                          : '${widget.matchPercentage}% OPTIMAL MATCH',
                      style: const TextStyle(
                        color: neonLime,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          // Symbol & Icon Badge
          Container(
            width: 86,
            height: 86,
            decoration: BoxDecoration(
              color: neonLime.withValues(alpha: 0.14),
              shape: BoxShape.circle,
              border: Border.all(
                color: neonLime,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: neonLime.withValues(alpha: 0.3),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Center(
              child: Text(
                path.symbol,
                style: const TextStyle(
                  color: neonLime,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          // Career Title
          Text(
            path.getTitle(isArabic),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),

          const SizedBox(height: 8),

          // Personality Type Badge (e.g. 🎨 The Visual Creator)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: softPurple.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: softPurple.withValues(alpha: 0.4),
              ),
            ),
            child: Text(
              path.getPersonalityType(isArabic),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: softPurple,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Short Description
          Text(
            path.getShortDesc(isArabic),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalitySection(CareerPathInfo path, bool isArabic) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.psychology_rounded,
                  color: softPurple, size: 22),
              const SizedBox(width: 8),
              Text(
                isArabic ? 'شخصيتك وتحليلك المهني' : 'Your Personality Profile',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            path.getPersonalitySummary(isArabic),
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              height: 1.55,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),
          const Divider(color: Colors.white12, height: 1),
          const SizedBox(height: 14),
          Text(
            path.getDescription(isArabic),
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoadmapSection(CareerPathInfo path, bool isArabic) {
    final roadmap = path.getRoadmap(isArabic);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isArabic ? 'خارطة الطريق التعليمية' : 'Recommended Roadmap',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          isArabic
              ? 'الخطوات الأساسية لبناء خبرتك في هذا المسار:'
              : 'Core milestone steps to master this career track:',
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white54,
          ),
        ),
        const SizedBox(height: 14),
        ...roadmap.asMap().entries.map((entry) {
          final idx = entry.key;
          final step = entry.value;

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: neonLime.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: neonLime.withValues(alpha: 0.4),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${idx + 1}',
                    style: const TextStyle(
                      color: neonLime,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    step,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSkillsAndProjectCard(CareerPathInfo path, bool isArabic) {
    final skills = path.getSkills(isArabic);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.code_rounded, color: neonLime, size: 20),
              const SizedBox(width: 8),
              Text(
                isArabic ? 'المهارات والتقنيات المطلوبة' : 'Core Skills & Stack',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: neonLime.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 12,
                    color: neonLime,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white12, height: 1),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.rocket_launch_rounded,
                  color: softPurple, size: 18),
              const SizedBox(width: 8),
              Text(
                isArabic ? 'مشروع التخرج المقترح' : 'Capstone Portfolio Project',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: softPurple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            path.getProject(isArabic),
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white70,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryCareerCard(CareerPathInfo secPath, bool isArabic) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: softPurple.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: softPurple.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  secPath.symbol,
                  style: const TextStyle(
                    color: softPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isArabic
                        ? 'مسار بديل مقترح (توافق ثانوي)'
                        : 'SECONDARY PATHWAY (ALTERNATIVE FIT)',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      color: softPurple,
                    ),
                  ),
                  Text(
                    secPath.getTitle(isArabic),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            secPath.getShortDesc(isArabic),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white60,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, bool isArabic) {
    return Column(
      children: [
        // Manual save button if not yet saved and not historical
        if (!_isSaved && !widget.isHistorical) ...[
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _isSaving ? null : _saveToFirestore,
              icon: _isSaving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: background,
                      ),
                    )
                  : const Icon(Icons.cloud_upload_rounded, size: 20),
              label: Text(
                _isSaving
                    ? (isArabic ? 'جاري الحفظ في فايرستور...' : 'Saving to Firestore...')
                    : (isArabic ? 'حفظ النتيجة في ملفي الشخصي' : 'Save Result to Profile'),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: neonLime,
                foregroundColor: background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],

        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.isHistorical ? neonLime : card,
              foregroundColor: widget.isHistorical ? background : Colors.white,
              elevation: 0,
              side: widget.isHistorical
                  ? null
                  : BorderSide(color: Colors.white.withValues(alpha: 0.15)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              isArabic ? 'العودة للرئيسية' : 'Back to Home',
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Screen1()),
              );
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: softPurple,
              side: BorderSide(
                color: softPurple.withValues(alpha: 0.4),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              isArabic ? 'إعادة التقييم مرة أخرى' : 'Take Assessment Again',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
