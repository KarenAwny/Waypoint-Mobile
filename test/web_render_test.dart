import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';

void main() {
  const expectedTracksEn = [
    'Frontend Development',
    'Backend Development',
    'Mobile Development',
    'Cybersecurity',
    'Data Analysis',
    'UI/UX Design',
  ];

  const expectedTracksAr = [
    'تطوير واجهات المواقع',
    'تطوير الأنظمة الخلفية',
    'تطوير تطبيقات الموبايل',
    'الأمن السيبراني',
    'تحليل البيانات',
    'تصميم تجربة وواجهة المستخدم',
  ];

  testWidgets('Renders all 6 Career Tracks on Desktop Web (1920x1080) without errors', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
        home: HomeScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    for (final trackTitle in expectedTracksEn) {
      expect(find.text(trackTitle), findsOneWidget, reason: 'Track "$trackTitle" should be rendered on Desktop Web');
    }
  });

  testWidgets('Renders all 6 Career Tracks on Tablet Web (800x1200) without errors', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
        home: HomeScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    for (final trackTitle in expectedTracksEn) {
      expect(find.text(trackTitle), findsOneWidget, reason: 'Track "$trackTitle" should be rendered on Tablet Web');
    }
  });

  testWidgets('Renders all 6 Career Tracks on Mobile Browser (390x844) without errors', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: HomeScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    for (final trackTitle in expectedTracksEn) {
      expect(find.text(trackTitle), findsOneWidget, reason: 'Track "$trackTitle" should be rendered on Mobile Web');
    }
  });

  testWidgets('Renders all 6 Career Tracks in Arabic RTL mode without errors', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ar'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: HomeScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    for (final trackTitle in expectedTracksAr) {
      expect(find.text(trackTitle), findsOneWidget, reason: 'Arabic Track "$trackTitle" should be rendered');
    }
  });
}
