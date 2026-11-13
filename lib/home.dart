import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'services/firestore_service.dart';
import 'services/locale_service.dart';
import 'l10n/app_localizations.dart';
import 'Screen1.dart';
import 'Screen2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // Exact Waypoint Brand Colors
  static const Color background = Color(0xFF0A0A0F);
  static const Color neonLime = Color(0xFFC5FF4A);
  static const Color softPurple = Color(0xFF9B7BFF);
  static const Color card = Color(0xFF171720);

  static final List<CareerTrackInfo> tracks = [
    const CareerTrackInfo(
      keyId: 'frontend',
      icon: Icons.laptop_chromebook_rounded,
      color: neonLime,
      imageAsset: 'assets/images/track_frontend.png',
    ),
    const CareerTrackInfo(
      keyId: 'backend',
      icon: Icons.dns_rounded,
      color: softPurple,
      imageAsset: 'assets/images/track_backend.png',
    ),
    const CareerTrackInfo(
      keyId: 'mobile',
      icon: Icons.phone_android_rounded,
      color: neonLime,
      imageAsset: 'assets/images/track_mobile.png',
    ),
    const CareerTrackInfo(
      keyId: 'cybersecurity',
      icon: Icons.shield_rounded,
      color: softPurple,
      imageAsset: 'assets/images/track_cybersecurity.png',
    ),
    const CareerTrackInfo(
      keyId: 'data',
      icon: Icons.insights_rounded,
      color: neonLime,
      imageAsset: 'assets/images/track_data.png',
    ),
    const CareerTrackInfo(
      keyId: 'uiux',
      icon: Icons.palette_rounded,
      color: softPurple,
      imageAsset: 'assets/images/track_uiux.png',
    ),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color background = HomeScreen.background;
  static const Color neonLime = HomeScreen.neonLime;
  static const Color softPurple = HomeScreen.softPurple;
  static const Color card = HomeScreen.card;

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _tracksKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTracks() {
    if (_tracksKey.currentContext != null) {
      Scrollable.ensureVisible(
        _tracksKey.currentContext!,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: HomeScreen.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1140),
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Announcement Pill matching website
                  _buildAnnouncementBar(context, l10n),

                  // Top Bar / Branding & Profile Icon
                  _buildTopBar(context, l10n),

                  const SizedBox(height: 22),

                  // Hero Welcome Section matching website exactly
                  _buildHeroSection(context, l10n),

                  const SizedBox(height: 24),

                  // Quick Platform Stats Row
                  _buildPlatformStats(l10n),

                  // Real-time Firestore latest saved result card (if any)
                  _buildLatestSavedResultCard(context, l10n),

                  const SizedBox(height: 32),

                  // Section Header: Career Tracks
                  Row(
                    key: _tracksKey,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          l10n.exploreCareerTracks,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: HomeScreen.card,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Text(
                          l10n.tracksCount(HomeScreen.tracks.length),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Career Tracks Grid with Domain Illustrations
                  _buildCareerTracksGrid(context, l10n),

                  const SizedBox(height: 30),

                  // Interactive Assessment Banner
                  _buildAssessmentCard(context, l10n),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnnouncementBar(BuildContext context, AppLocalizations l10n) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Screen1()),
        );
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: const Color(0xFF13131D),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: HomeScreen.neonLime,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: HomeScreen.neonLime,
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                l10n.announcementText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '${l10n.announcementLink} ↗',
              style: const TextStyle(
                color: HomeScreen.neonLime,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, AppLocalizations l10n) {
    final localeService = LocaleService();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Language Switcher button (matching screenshot 2)
        InkWell(
          onTap: () => localeService.toggleLanguage(),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: HomeScreen.card,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
              ),
            ),
            child: Text(
              localeService.isArabic ? 'English' : 'عربي',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

        // Brand Logo + Menu Icon on the other side (matching screenshot 2)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hamburger Menu / Profile button
            InkWell(
              onTap: () => _showProfileSheet(context, l10n),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: HomeScreen.card,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                ),
                child: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Logo Mark + Name ".Waypoint"
            InkWell(
              onTap: () => _showProfileSheet(context, l10n),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                        color: Colors.white,
                      ),
                      children: [
                        const TextSpan(
                          text: '.',
                          style: TextStyle(color: HomeScreen.neonLime),
                        ),
                        TextSpan(text: l10n.appName),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 36,
                    height: 36,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: HomeScreen.card,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: HomeScreen.neonLime.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/logo_mark.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
      decoration: BoxDecoration(
        color: HomeScreen.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF14141E),
            Color(0xFF0E0E16),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Eyebrow with decorative lines: —— مستقبلك في التكنولوجيا بيبدأ هنا ——
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 26,
                height: 1.5,
                color: HomeScreen.neonLime.withValues(alpha: 0.6),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  l10n.heroEyebrowWebsite,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: HomeScreen.neonLime,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 26,
                height: 1.5,
                color: HomeScreen.neonLime.withValues(alpha: 0.6),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Main Headline with glowing highlighted "طريقك."
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                height: 1.25,
                letterSpacing: -0.6,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: '${l10n.heroTitleMain}\n'),
                TextSpan(text: l10n.heroTitleHighlightPrefix),
                TextSpan(
                  text: l10n.heroTitleHighlightWord,
                  style: const TextStyle(
                    color: HomeScreen.neonLime,
                    shadows: [
                      Shadow(
                        color: HomeScreen.neonLime,
                        blurRadius: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Hero Description paragraph
          Text(
            l10n.heroDescWebsite,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white70,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 24),

          // CTAs: Primary ("اكتشف مجالي ↗") & Secondary ("شوف كل المجالات ↓")
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Screen1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HomeScreen.neonLime,
                  foregroundColor: HomeScreen.background,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.heroCtaPrimary,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.north_east_rounded,
                      size: 16,
                      color: HomeScreen.background,
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: _scrollToTracks,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  side: BorderSide(
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.heroCtaSecondary,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.arrow_downward_rounded,
                      size: 16,
                      color: HomeScreen.neonLime,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Proof Chip: "مصمم لخطوتك الجاية"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF111119),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: HomeScreen.neonLime.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '✳',
                    style: TextStyle(
                      color: HomeScreen.neonLime,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.heroProofTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        l10n.heroProofSubtitle,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // High-Tech Radar / Compass Visual from Screenshot 2
          _buildCompassRadarVisual(context, l10n),
        ],
      ),
    );
  }

  Widget _buildCompassRadarVisual(BuildContext context, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 380),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D14),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Radar Orbits Canvas
          CustomPaint(
            size: const Size(260, 260),
            painter: CompassRadarPainter(
              neonColor: HomeScreen.neonLime,
              purpleColor: HomeScreen.softPurple,
            ),
          ),

          // Central Compass Dial
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF13131F),
              border: Border.all(
                color: HomeScreen.neonLime.withValues(alpha: 0.4),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: HomeScreen.neonLime.withValues(alpha: 0.15),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Cardinal directions
                const Positioned(
                  top: 8,
                  child: Text(
                    'N',
                    style: TextStyle(
                      color: HomeScreen.neonLime,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 8,
                  child: Text(
                    'S',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Positioned(
                  right: 10,
                  child: Text(
                    'E',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Positioned(
                  left: 10,
                  child: Text(
                    'W',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // Center Hub with W
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: HomeScreen.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: HomeScreen.softPurple.withValues(alpha: 0.6),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'W',
                      style: TextStyle(
                        color: HomeScreen.neonLime,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                // Needle pointing North-East
                Transform.rotate(
                  angle: 0.785, // 45 degrees
                  child: Container(
                    width: 3,
                    height: 58,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          HomeScreen.neonLime,
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Floating Chip Top: "اهتماماتك" | "اعرف إيه المناسب ليك"
          Positioned(
            top: 10,
            right: l10n.isArabic ? null : 12,
            left: l10n.isArabic ? 12 : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF171723),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: HomeScreen.neonLime.withValues(alpha: 0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: HomeScreen.neonLime.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text('✳',
                        style: TextStyle(
                            color: HomeScreen.neonLime, fontSize: 11)),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.heroCardInterestsTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        l10n.heroCardInterestsSubtitle,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Floating Chip Bottom: "خطوتك الجاية" | "خطوة بخطوة"
          Positioned(
            bottom: 10,
            left: l10n.isArabic ? null : 12,
            right: l10n.isArabic ? 12 : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF171723),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: HomeScreen.softPurple.withValues(alpha: 0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: HomeScreen.softPurple.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.north_east_rounded,
                        size: 12, color: HomeScreen.softPurple),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.heroCardNextStepTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        l10n.heroCardNextStepSubtitle,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Coordinate label
          Positioned(
            bottom: 18,
            left: l10n.isArabic ? 14 : null,
            right: l10n.isArabic ? null : 14,
            child: Text(
              l10n.coordinateLabel,
              style: const TextStyle(
                color: Colors.white24,
                fontSize: 10,
                fontFamily: 'monospace',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformStats(AppLocalizations l10n) {
    return Row(
      children: [
        _buildStatItem('6+', l10n.tracks),
        const SizedBox(width: 10),
        _buildStatItem('100%', l10n.interactive),
        const SizedBox(width: 10),
        _buildStatItem('Cloud', l10n.cloudSync),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: neonLime,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Displays the latest saved assessment result from Cloud Firestore if available.
  Widget _buildLatestSavedResultCard(
      BuildContext context, AppLocalizations l10n) {
    try {
      final auth = AuthService();
      final user = auth.currentUser;
      if (user == null || auth.isGuest) {
        return const SizedBox.shrink();
      }

      return StreamBuilder<List<AssessmentResultModel>>(
        stream: FirestoreService().getAssessmentHistoryStream(user.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return const SizedBox.shrink();
          }

          final latest = snapshot.data!.first;
          return Container(
            margin: const EdgeInsets.only(top: 24),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: neonLime.withValues(alpha: 0.35),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: neonLime.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.check_circle_rounded,
                              size: 13, color: neonLime),
                          const SizedBox(width: 5),
                          Text(
                            l10n.activeBlueprint,
                            style: const TextStyle(
                              color: neonLime,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${latest.matchPercentage}%',
                      style: const TextStyle(
                        color: neonLime,
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.localizedCareerTitle(latest.careerRecommendation),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.secondarySynergy(latest.secondaryCareer),
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 14),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Screen2(
                          selectedInterest: latest.careerRecommendation,
                          secondaryCareer: latest.secondaryCareer,
                          matchPercentage: latest.matchPercentage,
                          answers: latest.answers,
                          isHistorical: true,
                          savedDate: latest.createdAt,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        l10n.openSavedRecommendation,
                        style: const TextStyle(
                          color: neonLime,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        l10n.isArabic
                            ? Icons.arrow_back_rounded
                            : Icons.arrow_forward_rounded,
                        size: 16,
                        color: neonLime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    } catch (_) {
      return const SizedBox.shrink();
    }
  }

  Widget _buildCareerTracksGrid(BuildContext context, AppLocalizations l10n) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        // Responsive columns & aspect ratios for cards with domain illustrations:
        // Desktop / wide screen (>= 860px): 3 columns, 1.05 aspect ratio
        // Tablet screen (580px - 859px): 3 columns, 0.88 aspect ratio
        // Mobile screen (< 580px): 2 columns, 0.74 aspect ratio
        final int crossAxisCount = width >= 860 ? 3 : (width >= 580 ? 3 : 2);
        final double childAspectRatio =
            width >= 860 ? 1.05 : (width >= 580 ? 0.88 : 0.74);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: HomeScreen.tracks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            final track = HomeScreen.tracks[index];
            return _buildTrackCard(context, track, l10n);
          },
        );
      },
    );
  }

  Widget _buildTrackCard(
      BuildContext context, CareerTrackInfo track, AppLocalizations l10n) {
    final title = l10n.localizedCareerTitle(track.keyId);
    final badge = l10n.localizedCareerBadge(track.keyId);
    final techStack = l10n.localizedCareerTechStack(track.keyId);

    return InkWell(
      onTap: () => _showTrackModal(context, track, l10n),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: HomeScreen.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Row: Domain Icon & Badge Pill
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: track.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    track.icon,
                    color: track.color,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      badge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: track.color,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Field-Specific 3D Illustration Image
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: HomeScreen.background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.06),
                    ),
                  ),
                  child: Image.asset(
                    track.imageAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, stack) => Center(
                      child: Icon(
                        track.icon,
                        color: track.color.withValues(alpha: 0.5),
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Track Title & Tech Stack Subtitle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  techStack,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssessmentCard(BuildContext context, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: softPurple.withValues(alpha: 0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: softPurple.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  color: softPurple,
                  size: 22,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  l10n.personalizedGuidance,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: softPurple,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            l10n.notSureWhereToStart,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.assessmentBannerDesc,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Screen1()),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.launchCareerQuiz,
                  style: const TextStyle(
                    color: neonLime,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  l10n.isArabic
                      ? Icons.arrow_back_rounded
                      : Icons.arrow_forward_rounded,
                  color: neonLime,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showProfileSheet(BuildContext context, AppLocalizations l10n) {
    final authService = AuthService();
    final firestoreService = FirestoreService();
    final localeService = LocaleService();
    final user = authService.currentUser;
    final isGuest = authService.isGuest && (user == null || user.isAnonymous);

    showModalBottomSheet(
      context: context,
      backgroundColor: card,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.45,
          maxChildSize: 0.95,
          expand: false,
          builder: (ctx, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Handle bar
                      Center(
                        child: Container(
                          width: 44,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),

                  const SizedBox(height: 20),

                  // Real-time Firestore Profile Header
                  if (user != null && !isGuest)
                    StreamBuilder<UserProfileModel?>(
                      stream: firestoreService.getUserProfileStream(user.uid),
                      builder: (context, snapshot) {
                        final profile = snapshot.data;
                        final displayName = (profile?.fullName.isNotEmpty ??
                                false)
                            ? profile!.fullName
                            : (user.displayName?.isNotEmpty ?? false)
                                ? user.displayName!
                                : (user.email?.split('@').first ?? 'Explorer');

                        final email = profile?.email.isNotEmpty ?? false
                            ? profile!.email
                            : (user.email ?? 'No email');

                        final memberSince = profile?.createdAt != null
                            ? l10n.memberSince(
                                '${profile!.createdAt!.day}/${profile.createdAt!.month}/${profile.createdAt!.year}')
                            : l10n.activeExplorer;

                        return _buildProfileHeader(
                          displayName: displayName,
                          email: email,
                          subtitle: memberSince,
                          isGuest: false,
                          l10n: l10n,
                        );
                      },
                    )
                  else
                    _buildProfileHeader(
                      displayName: l10n.guestExplorer,
                      email: l10n.browsingAsGuest,
                      subtitle: l10n.cloudSecurityGuest,
                      isGuest: true,
                      l10n: l10n,
                    ),

                  const SizedBox(height: 24),

                  // Language Switcher Section
                  _buildLanguageSelectionCard(context, l10n, localeService),

                  const SizedBox(height: 24),

                  // Section Title: Assessment History
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.assessmentHistory,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Text(
                          l10n.firestoreSynced,
                          style: const TextStyle(
                            color: neonLime,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Real-time Assessment History Stream
                  if (user != null && !isGuest)
                    StreamBuilder<List<AssessmentResultModel>>(
                      stream: firestoreService
                          .getAssessmentHistoryStream(user.uid),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: 120,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: neonLime,
                            ),
                          );
                        }

                        if (snapshot.hasError) {
                          return Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${snapshot.error}',
                              style: const TextStyle(
                                  color: Colors.redAccent, fontSize: 12),
                            ),
                          );
                        }

                        final results = snapshot.data ?? [];
                        if (results.isEmpty) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.06),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.history_toggle_off_rounded,
                                  color: Colors.white30,
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  l10n.noSavedAssessmentsTitle,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.noSavedAssessmentsDesc,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white38,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(sheetContext);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Screen1()),
                                    );
                                  },
                                  child: Text(
                                    l10n.takeAssessment,
                                    style: const TextStyle(color: neonLime),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: results.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final item = results[index];
                            final dateStr =
                                '${item.createdAt.day}/${item.createdAt.month}/${item.createdAt.year}';

                            return InkWell(
                              onTap: () {
                                Navigator.pop(sheetContext);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Screen2(
                                      selectedInterest:
                                          item.careerRecommendation,
                                      secondaryCareer: item.secondaryCareer,
                                      matchPercentage: item.matchPercentage,
                                      answers: item.answers,
                                      isHistorical: true,
                                      savedDate: item.createdAt,
                                    ),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.08),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: neonLime.withValues(alpha: 0.12),
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.auto_awesome_rounded,
                                        color: neonLime,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            l10n.localizedCareerTitle(
                                                item.careerRecommendation),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            l10n.recordedOn(dateStr,
                                                item.secondaryCareer),
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: neonLime.withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        '${item.matchPercentage}%',
                                        style: const TextStyle(
                                          color: neonLime,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Icon(
                                      l10n.isArabic
                                          ? Icons.chevron_left_rounded
                                          : Icons.chevron_right_rounded,
                                      color: Colors.white38,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  else
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: softPurple.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.guestSessionActive,
                            style: const TextStyle(
                              color: softPurple,
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            l10n.guestSessionDesc,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.pop(sheetContext);
                              await authService.signOut();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: neonLime,
                              foregroundColor: background,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              l10n.signUpOrSignIn,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 28),

                  // Sign Out Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        Navigator.pop(sheetContext);
                        await authService.signOut();
                      },
                      icon: const Icon(Icons.logout_rounded, size: 18),
                      label: Text(
                        isGuest ? l10n.exitGuestMode : l10n.logOutOfWaypoint,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                        side: BorderSide(
                          color: Colors.redAccent.withValues(alpha: 0.4),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
        );
      },
    );
  }

  Widget _buildLanguageSelectionCard(BuildContext context,
      AppLocalizations l10n, LocaleService localeService) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.language_rounded, color: neonLime, size: 20),
              const SizedBox(width: 8),
              Text(
                l10n.language,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildLangOption(
                  title: 'English',
                  subtitle: 'LTR',
                  isSelected: localeService.isEnglish,
                  onTap: () => localeService.setLocale(const Locale('en')),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildLangOption(
                  title: 'العربية',
                  subtitle: 'RTL',
                  isSelected: localeService.isArabic,
                  onTap: () => localeService.setLocale(const Locale('ar')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLangOption({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? neonLime.withValues(alpha: 0.12)
              : const Color(0xFF171720),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? neonLime : Colors.white.withValues(alpha: 0.06),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
              color: isSelected ? neonLime : Colors.white38,
              size: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader({
    required String displayName,
    required String email,
    required String subtitle,
    required bool isGuest,
    required AppLocalizations l10n,
  }) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isGuest
                  ? softPurple.withValues(alpha: 0.15)
                  : neonLime.withValues(alpha: 0.15),
              border: Border.all(
                color: isGuest ? softPurple : neonLime,
                width: 2,
              ),
            ),
            child: Icon(
              isGuest ? Icons.rocket_launch_rounded : Icons.person_rounded,
              color: isGuest ? softPurple : neonLime,
              size: 38,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Center(
          child: Text(
            displayName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Center(
          child: Text(
            email,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white60,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Center(
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white38,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  void _showTrackModal(
      BuildContext context, CareerTrackInfo track, AppLocalizations l10n) {
    final title = l10n.localizedCareerTitle(track.keyId);
    final badge = l10n.localizedCareerBadge(track.keyId);
    final techStack = l10n.localizedCareerTechStack(track.keyId);
    final description = l10n.localizedCareerDescription(track.keyId);

    showModalBottomSheet(
      context: context,
      backgroundColor: card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: track.color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(track.icon, color: track.color, size: 28),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              badge,
                              style: TextStyle(
                                color: track.color,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.keyTechnologies,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Text(
                      techStack,
                      style: const TextStyle(
                        color: neonLime,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Screen1()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: neonLime,
                        foregroundColor: background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        l10n.assessMyFit,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CareerTrackInfo {
  final String keyId;
  final IconData icon;
  final Color color;
  final String imageAsset;

  const CareerTrackInfo({
    required this.keyId,
    required this.icon,
    required this.color,
    required this.imageAsset,
  });
}

class CompassRadarPainter extends CustomPainter {
  final Color neonColor;
  final Color purpleColor;

  CompassRadarPainter({
    required this.neonColor,
    required this.purpleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    // Outer and inner orbit circles
    final orbitPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final glowPaint = Paint()
      ..color = neonColor.withValues(alpha: 0.16)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final purpleGlow = Paint()
      ..color = purpleColor.withValues(alpha: 0.14)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(center, maxRadius * 0.94, orbitPaint);
    canvas.drawCircle(center, maxRadius * 0.72, glowPaint);
    canvas.drawCircle(center, maxRadius * 0.48, purpleGlow);
    canvas.drawCircle(center, maxRadius * 0.26, glowPaint);

    // Cross lines through center
    final crossPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..strokeWidth = 0.8;
    canvas.drawLine(Offset(center.dx, 10), Offset(center.dx, size.height - 10), crossPaint);
    canvas.drawLine(Offset(10, center.dy), Offset(size.width - 10, center.dy), crossPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
