import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/data/assessment_data.dart';

void main() {
  group('Waypoint Website Assessment Verification', () {
    test('Must contain EXACTLY 15 questions in order 0 to 14', () {
      expect(AssessmentData.questions.length, 15);
      for (int i = 0; i < 15; i++) {
        expect(AssessmentData.questions[i].id, i);
        expect(AssessmentData.questions[i].titleEn.isNotEmpty, true);
        expect(AssessmentData.questions[i].titleAr.isNotEmpty, true);
        expect(AssessmentData.questions[i].subtitleEn.isNotEmpty, true);
        expect(AssessmentData.questions[i].subtitleAr.isNotEmpty, true);
      }
    });

    test('Every question has exactly 6 career options matching the website', () {
      final expectedValues = [
        'frontend',
        'backend',
        'data',
        'cybersecurity',
        'uiux',
        'mobile',
      ];

      for (final q in AssessmentData.questions) {
        expect(q.options.length, 6);
        final values = q.options.map((o) => o.value).toList();
        expect(values, expectedValues);
        for (final opt in q.options) {
          expect(opt.symbol.isNotEmpty, true);
          expect(opt.labelEn.isNotEmpty, true);
          expect(opt.labelAr.isNotEmpty, true);
        }
      }
    });

    test('Exact 6 Career Paths exist with complete metadata', () {
      expect(AssessmentData.paths.length, 6);
      expect(AssessmentData.paths.containsKey('frontend'), true);
      expect(AssessmentData.paths.containsKey('backend'), true);
      expect(AssessmentData.paths.containsKey('data'), true);
      expect(AssessmentData.paths.containsKey('cybersecurity'), true);
      expect(AssessmentData.paths.containsKey('uiux'), true);
      expect(AssessmentData.paths.containsKey('mobile'), true);

      for (final path in AssessmentData.paths.values) {
        expect(path.titleEn.isNotEmpty, true);
        expect(path.titleAr.isNotEmpty, true);
        expect(path.symbol.isNotEmpty, true);
        expect(path.personalityTypeEn.isNotEmpty, true);
        expect(path.personalityTypeAr.isNotEmpty, true);
        expect(path.personalitySummaryEn.isNotEmpty, true);
        expect(path.personalitySummaryAr.isNotEmpty, true);
        expect(path.skillsEn.isNotEmpty, true);
        expect(path.skillsAr.isNotEmpty, true);
        expect(path.roadmapEn.length >= 3, true);
        expect(path.roadmapAr.length >= 3, true);
        expect(path.projectEn.isNotEmpty, true);
        expect(path.projectAr.isNotEmpty, true);
      }
    });

    test('Scoring: 15 identical answers produces 100% match for that track', () {
      final tracks = [
        'frontend',
        'backend',
        'data',
        'cybersecurity',
        'uiux',
        'mobile',
      ];

      for (final track in tracks) {
        final Map<int, String> answers = {
          for (int i = 0; i < 15; i++) i: track,
        };

        final rec = AssessmentData.calculateRecommendation(answers);
        final match = AssessmentData.calculateMatchPercentage(answers, rec);
        final scores = AssessmentData.calculateScores(answers);

        expect(rec, track);
        expect(match, 100);
        expect(scores[track], 15);
      }
    });

    test('Scoring: Tie-breaking preserves the website canonical order', () {
      // In Assessment.jsx:
      // const order = ['frontend', 'backend', 'data', 'cybersecurity', 'uiux', 'mobile'];
      // return order.reduce((best, key) => scores[key] > scores[best] ? key : best, order[0]);
      // If frontend and mobile each have 5 votes, frontend wins because it appears first in order.
      final Map<int, String> answers = {
        0: 'mobile',
        1: 'mobile',
        2: 'mobile',
        3: 'mobile',
        4: 'mobile',
        5: 'frontend',
        6: 'frontend',
        7: 'frontend',
        8: 'frontend',
        9: 'frontend',
        10: 'data',
        11: 'backend',
        12: 'cybersecurity',
        13: 'uiux',
        14: 'backend',
      };

      final rec = AssessmentData.calculateRecommendation(answers);
      expect(rec, 'frontend'); // frontend is earlier in scoringOrder than mobile
    });

    test('Dynamic match percentage calculation is accurate and not hardcoded', () {
      // 9 votes out of 15 => 60%
      final Map<int, String> answers = {
        for (int i = 0; i < 9; i++) i: 'cybersecurity',
        for (int i = 9; i < 15; i++) i: 'backend',
      };

      final rec = AssessmentData.calculateRecommendation(answers);
      final pct = AssessmentData.calculateMatchPercentage(answers, rec);
      final sec = AssessmentData.calculateSecondaryCareer(answers, rec);

      expect(rec, 'cybersecurity');
      expect(pct, 60);
      expect(sec, 'backend');
    });
  });
}

