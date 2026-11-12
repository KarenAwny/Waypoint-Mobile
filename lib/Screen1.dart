// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'data/assessment_data.dart';
import 'l10n/app_localizations.dart';
import 'services/locale_service.dart';
import 'Screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  // Waypoint Official Brand Palette
  static const Color background = Color(0xFF0A0A0F);
  static const Color neonLime = Color(0xFFC5FF4A);
  static const Color softPurple = Color(0xFF9B7BFF);
  static const Color card = Color(0xFF171720);

  int _currentQuestionIndex = 0;
  final Map<int, String> _userAnswers = {};
  bool _hasError = false;

  void _onOptionSelected(String optionValue) {
    setState(() {
      _userAnswers[_currentQuestionIndex] = optionValue;
      _hasError = false;
    });
  }

  void _onNext() {
    if (!_userAnswers.containsKey(_currentQuestionIndex)) {
      setState(() {
        _hasError = true;
      });
      return;
    }

    final totalQuestions = AssessmentData.questions.length;
    if (_currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        _hasError = false;
        _currentQuestionIndex++;
      });
    } else {
      _submitAssessment();
    }
  }

  void _onPrevious() {
    setState(() {
      _hasError = false;
    });
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _submitAssessment() {
    final totalQuestions = AssessmentData.questions.length;

    // Check if any question remains unanswered
    for (int i = 0; i < totalQuestions; i++) {
      if (!_userAnswers.containsKey(i)) {
        setState(() {
          _currentQuestionIndex = i;
          _hasError = true;
        });
        return;
      }
    }

    final primaryCareerKey =
        AssessmentData.calculateRecommendation(_userAnswers);
    final secondaryCareerKey = AssessmentData.calculateSecondaryCareer(
        _userAnswers, primaryCareerKey);
    final matchPercentage = AssessmentData.calculateMatchPercentage(
        _userAnswers, primaryCareerKey);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Screen2(
          selectedInterest: primaryCareerKey,
          secondaryCareer: secondaryCareerKey,
          matchPercentage: matchPercentage,
          answers: _userAnswers.map((k, v) => MapEntry(k.toString(), v)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isArabic = l10n.isArabic;
    final totalQuestions = AssessmentData.questions.length;
    final currentQ = AssessmentData.questions[_currentQuestionIndex];
    final questionNumber = _currentQuestionIndex + 1;
    final progress = questionNumber / totalQuestions;
    final percent = (progress * 100).round();

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
          onPressed: _onPrevious,
        ),
        title: Text(
          isArabic
              ? 'تقييم المسار المهني'
              : 'Career Assessment',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          // Language switcher button (allows switching without resetting answers)
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
        child: Column(
          children: [
            // Top Progress Bar & Counter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isArabic
                            ? 'السؤال ${questionNumber.toString().padLeft(2, '0')} / ${totalQuestions.toString().padLeft(2, '0')}'
                            : 'Question ${questionNumber.toString().padLeft(2, '0')} / ${totalQuestions.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          color: neonLime,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        '$percent%',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 6,
                      backgroundColor: card,
                      valueColor: const AlwaysStoppedAnimation<Color>(neonLime),
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Question Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Title
                    Text(
                      currentQ.getTitle(isArabic),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Subtitle / Prompt
                    Text(
                      currentQ.getSubtitle(isArabic),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.65),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Answer Options (6 choices)
                    ...currentQ.options.map((option) {
                      final isSelected =
                          _userAnswers[_currentQuestionIndex] == option.value;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () => _onOptionSelected(option.value),
                          borderRadius: BorderRadius.circular(16),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? card
                                  : card.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected
                                    ? neonLime
                                    : Colors.white.withValues(alpha: 0.08),
                                width: isSelected ? 1.8 : 1.0,
                              ),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: neonLime.withValues(alpha: 0.15),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Symbol Badge
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? neonLime.withValues(alpha: 0.2)
                                        : background,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: isSelected
                                          ? neonLime.withValues(alpha: 0.6)
                                          : Colors.white12,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    option.symbol,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 14),

                                // Option Text
                                Expanded(
                                  child: Text(
                                    option.getLabel(isArabic),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.white.withValues(alpha: 0.85),
                                      height: 1.35,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // Selection Indicator
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? neonLime
                                          : Colors.white30,
                                      width: isSelected ? 6 : 2,
                                    ),
                                    color: isSelected ? neonLime : Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                    // Validation Error Banner
                    if (_hasError)
                      Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.redAccent.withValues(alpha: 0.4),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline_rounded,
                              color: Colors.redAccent,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                isArabic
                                    ? 'يرجى اختيار إجابة للمتابعة.'
                                    : 'Please select an answer to continue.',
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Controls (Previous & Next/Submit)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: card,
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ),
              child: Row(
                children: [
                  // Back button
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: _onPrevious,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white70,
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.15),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isArabic
                                ? Icons.arrow_forward_rounded
                                : Icons.arrow_back_rounded,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            isArabic ? 'السابق' : 'Back',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Next or Submit button
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: neonLime,
                        foregroundColor: background,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentQuestionIndex == totalQuestions - 1
                                ? (isArabic ? 'عرض النتيجة' : 'View Results')
                                : (isArabic ? 'التالي' : 'Next'),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            _currentQuestionIndex == totalQuestions - 1
                                ? Icons.north_east_rounded
                                : (isArabic
                                    ? Icons.arrow_back_rounded
                                    : Icons.arrow_forward_rounded),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
