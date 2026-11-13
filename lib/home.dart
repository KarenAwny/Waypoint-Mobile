import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'services/firestore_service.dart';
import 'services/locale_service.dart';
import 'l10n/app_localizations.dart';
import 'Screen1.dart';
import 'Screen2.dart';

class HomeScreen extends StatelessWidget {
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
    ),
    const CareerTrackInfo(
      keyId: 'backend',
      icon: Icons.dns_rounded,
      color: softPurple,
    ),
    const CareerTrackInfo(
      keyId: 'mobile',
      icon: Icons.phone_android_rounded,
      color: neonLime,
    ),
    const CareerTrackInfo(
      keyId: 'cybersecurity',
      icon: Icons.shield_rounded,
      color: softPurple,
    ),
    const CareerTrackInfo(
      keyId: 'data',
      icon: Icons.insights_rounded,
      color: neonLime,
    ),
    const CareerTrackInfo(
      keyId: 'uiux',
      icon: Icons.palette_rounded,
      color: softPurple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1140),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Bar / Branding & Profile Icon
                  _buildTopBar(context, l10n),

                  const SizedBox(height: 28),

                  // Hero Welcome Section
                  _buildHeroSection(context, l10n),

                  const SizedBox(height: 24),

                  // Quick Platform Stats Row
                  _buildPlatformStats(l10n),

                  // Real-time Firestore latest saved result card (if any)
                  _buildLatestSavedResultCard(context, l10n),

                  const SizedBox(height: 32),

                  // Section Header: Career Tracks
                  Row(
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
                          color: card,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Text(
                          l10n.tracksCount(tracks.length),
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

                  // Career Tracks Grid
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

  Widget _buildTopBar(BuildContext context, AppLocalizations l10n) {
    final authService = AuthService();
    final user = authService.currentUser;
    final isGuest = authService.isGuest;
    final localeService = LocaleService();

    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: neonLime.withValues(alpha: 0.35),
            ),
            boxShadow: [
              BoxShadow(
                color: neonLime.withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(
            'assets/images/logo_mark.png',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.appName.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
              Text(
                l10n.careerNavigationPlatform,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
        // Quick Language Switcher Pill
        InkWell(
          onTap: () => localeService.toggleLanguage(),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: neonLime.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.language_rounded,
                  color: neonLime,
                  size: 15,
                ),
                const SizedBox(width: 4),
                Text(
                  localeService.isArabic ? 'EN' : 'عربي',
                  style: const TextStyle(
                    color: neonLime,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Connected Profile Icon Button
        IconButton(
          onPressed: () => _showProfileSheet(context, l10n),
          tooltip: l10n.userProfile,
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: card,
              shape: BoxShape.circle,
              border: Border.all(
                color: (isGuest && user == null)
                    ? softPurple.withValues(alpha: 0.5)
                    : neonLime.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: Icon(
              (isGuest && user == null)
                  ? Icons.rocket_launch_rounded
                  : Icons.person_rounded,
              color: (isGuest && user == null) ? softPurple : neonLime,
              size: 19,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            card,
            Color(0xFF1C1C28),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: softPurple.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: softPurple.withValues(alpha: 0.4),
              ),
            ),
            child: Text(
              l10n.discoverFuture,
              style: const TextStyle(
                color: softPurple,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.findYourPath,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              height: 1.18,
              letterSpacing: -0.8,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.heroDescription,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Screen1()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: neonLime,
                foregroundColor: background,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      l10n.startCareerAssessment,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    l10n.isArabic
                        ? Icons.arrow_back_rounded
                        : Icons.arrow_forward_rounded,
                    size: 19,
                    color: background,
                  ),
                ],
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
        // Responsive columns & aspect ratios:
        // Desktop / wide screen (>= 860px): 3 columns, 1.35 aspect ratio
        // Tablet screen (580px - 859px): 3 columns, 1.15 aspect ratio
        // Mobile screen (< 580px): 2 columns, 0.95 aspect ratio
        final int crossAxisCount = width >= 860 ? 3 : (width >= 580 ? 3 : 2);
        final double childAspectRatio =
            width >= 860 ? 1.35 : (width >= 580 ? 1.15 : 0.95);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tracks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            final track = tracks[index];
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
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: track.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    track.icon,
                    color: track.color,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 8),
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
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  techStack,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white54,
                    height: 1.3,
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

  const CareerTrackInfo({
    required this.keyId,
    required this.icon,
    required this.color,
  });
}
