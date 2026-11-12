import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Application localizations providing English and Arabic translations for Waypoint.
class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en'));
  }

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  bool get isArabic => locale.languageCode == 'ar';

  // ---------------------------------------------------------------------------
  // Core & Navigation Strings
  // ---------------------------------------------------------------------------
  String get appName => isArabic ? 'وايبوينت' : 'Waypoint';
  String get careerNavigationPlatform =>
      isArabic ? 'منصة التوجيه المهني التقني' : 'Career Navigation Platform';
  String get live => isArabic ? 'مباشر' : 'LIVE';
  String get back => isArabic ? 'رجوع' : 'Back';
  String get continueText => isArabic ? 'متابعة' : 'Continue';
  String get cancel => isArabic ? 'إلغاء' : 'Cancel';
  String get confirm => isArabic ? 'تأكيد' : 'Confirm';
  String get retry => isArabic ? 'إعادة المحاولة' : 'Retry';
  String get priority => isArabic ? 'أولوية' : 'Priority';
  String tracksCount(int count) => isArabic ? '$count مسارات' : '$count Tracks';
  String get tracks => isArabic ? 'مسارات' : 'Tracks';
  String get interactive => isArabic ? 'تفاعلي' : 'Interactive';
  String get cloudSync => isArabic ? 'مزامنة سحابية' : 'Cloud Sync';
  String get language => isArabic ? 'اللغة' : 'Language';
  String get english => 'English';
  String get arabic => 'العربية';
  String get changeLanguage => isArabic ? 'تغيير اللغة' : 'Change Language';
  String get selectLanguagePrompt =>
      isArabic ? 'اختر لغة التطبيق' : 'Select Application Language';
  String get connectingToWaypoint =>
      isArabic ? 'جاري الاتصال بوايبوينت...' : 'Connecting to Waypoint...';

  // ---------------------------------------------------------------------------
  // Auth: Login Screen
  // ---------------------------------------------------------------------------
  String get welcomeBack => isArabic ? 'مرحباً بعودتك' : 'Welcome Back';
  String get loginSubtitle => isArabic
      ? 'سجّل الدخول للوصول إلى خططك المهنية المحفوظة، وتقييماتك، ومسارات نموك.'
      : 'Sign in to access your saved tech career blueprints, assessments, and growth tracks.';
  String get emailAddress => isArabic ? 'البريد الإلكتروني' : 'Email Address';
  String get emailHint => 'name@example.com';
  String get password => isArabic ? 'كلمة المرور' : 'Password';
  String get passwordHint => isArabic ? 'أدخل كلمة المرور' : 'Enter your password';
  String get forgotPassword => isArabic ? 'نسيت كلمة المرور؟' : 'Forgot Password?';
  String get signIn =>
      isArabic ? 'تسجيل الدخول إلى وايبوينت' : 'Sign In to Waypoint';
  String get exploreAsGuest => isArabic ? 'استكشف كزائر' : 'Explore as Guest';
  String get dontHaveAccount =>
      isArabic ? 'ليس لديك حساب؟ ' : "Don't have an account? ";
  String get signUp => isArabic ? 'إنشاء حساب' : 'Sign Up';

  // ---------------------------------------------------------------------------
  // Auth: Sign Up Screen
  // ---------------------------------------------------------------------------
  String get startOdyssey =>
      isArabic ? 'ابدأ رحلتك التقنية' : 'START YOUR TECH ODYSSEY';
  String get joinWaypoint => isArabic ? 'انضم إلى وايبوينت' : 'Join Waypoint';
  String get signUpSubtitle => isArabic
      ? 'أنشئ ملفك الشخصي لاكتشاف مسارات مهنية مخصصة وتتبع نمو مهاراتك.'
      : 'Create your profile to unlock personalized career paths and track your skill growth.';
  String get fullName => isArabic ? 'الاسم الكامل' : 'Full Name';
  String get fullNameHint => isArabic ? 'مثال: أحمد محمد' : 'e.g. Alex Morgan';
  String get confirmPassword =>
      isArabic ? 'تأكيد كلمة المرور' : 'Confirm Password';
  String get confirmPasswordHint =>
      isArabic ? 'أعد إدخال كلمة المرور' : 'Re-enter your password';
  String get createAccount =>
      isArabic ? 'إنشاء حساب وايبوينت' : 'Create Waypoint Account';
  String get alreadyHaveAccount =>
      isArabic ? 'لديك حساب بالفعل؟ ' : 'Already have an account? ';

  // ---------------------------------------------------------------------------
  // Auth: Forgot Password Screen
  // ---------------------------------------------------------------------------
  String get recoverAccount => isArabic ? 'استعادة حسابك' : 'Recover Your Account';
  String get recoverSubtitle => isArabic
      ? 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطاً لاستعادة كلمة المرور.'
      : 'Enter the email associated with your Waypoint account and we will send you a password recovery link.';
  String get sendResetLink =>
      isArabic ? 'إرسال رابط الاستعادة' : 'Send Reset Link';
  String get resetEmailSentTitle =>
      isArabic ? 'تم إرسال رابط الاستعادة!' : 'Reset Email Sent!';
  String resetEmailSentDesc(String email) => isArabic
      ? 'أرسلنا التعليمات إلى $email. يرجى مراجعة صندوق الوارد والبريد غير الهام.'
      : 'We sent instructions to $email. Please check your inbox and spam folder.';
  String get backToSignIn =>
      isArabic ? 'العودة لتسجيل الدخول' : 'Back to Sign In';

  // ---------------------------------------------------------------------------
  // Form Validation & Errors
  // ---------------------------------------------------------------------------
  String get emailRequired =>
      isArabic ? 'يرجى إدخال بريدك الإلكتروني.' : 'Please enter your email.';
  String get emailInvalid => isArabic
      ? 'يرجى إدخال بريد إلكتروني صالح.'
      : 'Please enter a valid email format.';
  String get passwordRequired =>
      isArabic ? 'يرجى إدخال كلمة المرور.' : 'Please enter your password.';
  String get passwordMinLength => isArabic
      ? 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل.'
      : 'Password must be at least 6 characters.';
  String get fullNameRequired =>
      isArabic ? 'يرجى إدخال اسمك الكامل.' : 'Please enter your full name.';
  String get fullNameMinLength => isArabic
      ? 'يجب ألا يقل الاسم عن حرفين.'
      : 'Name must be at least 2 characters.';
  String get confirmPasswordRequired =>
      isArabic ? 'يرجى تأكيد كلمة المرور.' : 'Please confirm your password.';
  String get passwordsDoNotMatch =>
      isArabic ? 'كلمتا المرور غير متطابقتين.' : 'Passwords do not match.';

  // ---------------------------------------------------------------------------
  // Home Screen
  // ---------------------------------------------------------------------------
  String get discoverFuture => isArabic
      ? 'اكتشف مستقبلك في عالم التقنية'
      : 'DISCOVER YOUR FUTURE IN TECH';
  String get findYourPath =>
      isArabic ? 'جد مسارك.\nاصنع مستقبلك.' : 'Find Your Path.\nBuild Your Future.';
  String get heroDescription => isArabic
      ? 'اكتشف شخصيتك التقنية، وتعرف على أهم التخصصات المطلوبة، واحصل على خارطة طريق تعليمية مخصصة.'
      : 'Uncover your tech personality, discover trending industry disciplines, and get a tailored curriculum roadmap.';
  String get startCareerAssessment =>
      isArabic ? 'ابدأ تقييم المسار المهني' : 'Start Career Assessment';
  String get activeBlueprint =>
      isArabic ? 'المسار المهني النشط' : 'ACTIVE CAREER BLUEPRINT';
  String secondarySynergy(String career) => isArabic
      ? 'المسار البديل المقترح: ${localizedCareerTitle(career)}'
      : 'Secondary synergy: $career';
  String get openSavedRecommendation =>
      isArabic ? 'عرض التوصية المحفوظة' : 'Open Saved Recommendation';
  String get exploreCareerTracks =>
      isArabic ? 'استكشف المسارات التقنية' : 'Explore Career Tracks';
  String get personalizedGuidance =>
      isArabic ? 'توجيه شخصي ذكي' : 'Personalized Guidance';
  String get notSureWhereToStart =>
      isArabic ? 'لست متأكداً من المسار المناسب لك؟' : 'Not sure where you belong?';
  String get assessmentBannerDesc => isArabic
      ? 'أجب عن 4 أسئلة تفاعلية سريعة لاكتشاف المجال الذي يطابق نقاط قوتك وشغفك.'
      : 'Answer 4 quick interactive questions to discover which career matches your cognitive strengths and passions.';
  String get launchCareerQuiz =>
      isArabic ? 'ابدأ اختبار التوجيه المهني' : 'Launch Career Quiz';
  String get keyTechnologies =>
      isArabic ? 'أبرز التقنيات والأدوات' : 'Key Technologies';
  String get assessMyFit =>
      isArabic ? 'قيّم ملاءمتي لهذا المسار' : 'Assess My Fit for this Track';

  // ---------------------------------------------------------------------------
  // Screen1 (Career Assessment)
  // ---------------------------------------------------------------------------
  String get careerAssessment =>
      isArabic ? 'تقييم المسار المهني' : 'Career Assessment';
  String stepIndicator(int current, String title) =>
      isArabic ? 'الخطوة $current: $title' : 'STEP $current: $title';
  String get viewMyRecommendations =>
      isArabic ? 'عرض توصياتي المهنية' : 'View My Recommendations';

  // ---------------------------------------------------------------------------
  // Screen2 (Recommendations & Roadmap)
  // ---------------------------------------------------------------------------
  String get personalizedRecommendation =>
      isArabic ? 'التوصية المهنية المخصصة' : 'Personalized Recommendation';
  String get savedRecommendation =>
      isArabic ? 'التوصية المحفوظة' : 'Saved Recommendation';
  String matchOptimalPath(int percentage) => isArabic
      ? '$percentage% تطابق • المسار المثالي'
      : '$percentage% MATCH • OPTIMAL PATH';
  String historicalSaved(String date) => isArabic
      ? 'نتيجة تاريخية • محفوظة في فايرستور ($date)'
      : 'Historical Result • Saved to Firestore ($date)';
  String get savingToFirestore => isArabic
      ? 'جاري حفظ التقييم في فايرستور...'
      : 'Saving assessment to Cloud Firestore...';
  String get savedToFirestore => isArabic
      ? 'تم الحفظ بنجاح في ملفك السحابي في فايرستور'
      : 'Saved to your Waypoint profile in Cloud Firestore';
  String failedToSync(String error) => isArabic
      ? 'تعذر المزامنة مع فايرستور: $error'
      : 'Failed to sync with Firestore: $error';
  String get guestSavePrompt => isArabic
      ? 'وضع الزائر: سجّل الدخول لحفظ خارطة الطريق هذه في ملفك السحابي.'
      : 'Guest Mode: Sign in to save this roadmap to your cloud profile.';
  String get whyMatchesYou =>
      isArabic ? 'لماذا يناسبك هذا المسار المهني' : 'Why This Career Matches You';
  String get recommendedBlueprint => isArabic
      ? 'خارطة الطريق التعليمية المقترحة'
      : 'Recommended Learning Blueprint';
  String get coreTechSubtitle => isArabic
      ? 'التقنيات الأساسية التي يجب عليك التركيز عليها لاحتراف هذا الدور:'
      : 'Core technologies you should focus on to land this role:';
  String get marketOutlook =>
      isArabic ? 'حالة السوق والطلب الوظيفي' : 'Market Outlook & Demand';
  String get industryDemand =>
      isArabic ? 'مستوى الطلب في السوق' : 'Industry Demand';
  String get avgSalary =>
      isArabic ? 'متوسط الرواتب التقريبية' : 'Avg Entry/Mid Comp';
  String get commonJobTitles =>
      isArabic ? 'المسميات الوظيفية الشائعة' : 'Common Job Titles';
  String get secondaryPathway => isArabic
      ? 'مسار بديل مقترح (توافق ثانوي)'
      : 'SECONDARY PATHWAY (ALTERNATIVE FIT)';
  String get saveResultToProfile =>
      isArabic ? 'حفظ النتيجة في ملفي الشخصي' : 'Save Result to Profile';
  String get backToHome => isArabic ? 'العودة للرئيسية' : 'Back to Home';
  String get takeAssessmentAgain =>
      isArabic ? 'إعادة التقييم مرة أخرى' : 'Take Assessment Again';

  // ---------------------------------------------------------------------------
  // Profile Sheet & History
  // ---------------------------------------------------------------------------
  String get userProfile => isArabic ? 'الملف الشخصي' : 'User Profile';
  String get registeredExplorer =>
      isArabic ? 'مستكشف مسجّل' : 'REGISTERED EXPLORER';
  String get guestExplorer => isArabic ? 'مستكشف زائر' : 'GUEST EXPLORER';
  String get browsingAsGuest =>
      isArabic ? 'تصفح بوضع الزائر' : 'Browsing in Guest Mode';
  String get activeExplorer => isArabic ? 'مستكشف نشط' : 'Active Explorer';
  String memberSince(String date) =>
      isArabic ? 'عضو منذ $date' : 'Member since $date';
  String get cloudSecurityTitle =>
      isArabic ? 'أمان وايبوينت السحابي' : 'Waypoint Cloud Security';
  String get cloudSecurityRegistered => isArabic
      ? 'ملفك وبياناتك مشفرة ومحمية عبر فايربيس.'
      : 'Your profile & credentials are encrypted with Firebase.';
  String get cloudSecurityGuest => isArabic
      ? 'أنشئ حساباً لمزامنة نتائج تقييمك بشكل دائم.'
      : 'Sign up to permanently sync your assessment scores.';
  String get assessmentHistory =>
      isArabic ? 'سجل التقييمات السابقة' : 'Assessment History';
  String get firestoreSynced =>
      isArabic ? 'متزامن سحابياً' : 'Firestore Synced';
  String get noSavedAssessmentsTitle =>
      isArabic ? 'لا توجد تقييمات محفوظة بعد' : 'No Saved Assessments Yet';
  String get noSavedAssessmentsDesc => isArabic
      ? 'أكمل أول اختبار مهني لتسجيل خطتك في فايرستور.'
      : 'Complete your first career quiz to record your blueprint in Firestore.';
  String get takeAssessment =>
      isArabic ? 'ابدأ التقييم ←' : 'Take Assessment →';
  String recordedOn(String date, String secondary) => isArabic
      ? 'سُجّل بتاريخ $date • ${localizedCareerTitle(secondary)}'
      : 'Recorded $date • $secondary';
  String get logOutOfWaypoint =>
      isArabic ? 'تسجيل الخروج من وايبوينت' : 'Log Out of Waypoint';
  String get exitGuestMode =>
      isArabic ? 'الخروج من وضع الزائر' : 'Exit Guest Mode';
  String get guestSessionActive =>
      isArabic ? 'جلسة زائر نشطة' : 'Guest Session Active';
  String get guestSessionDesc => isArabic
      ? 'أنشئ حساباً لمزامنة سجل تقييماتك المهنية تلقائياً على فايرستور.'
      : 'Create an account to automatically sync your career assessment history to Cloud Firestore.';
  String get signUpOrSignIn =>
      isArabic ? 'إنشاء حساب أو تسجيل الدخول' : 'Sign Up or Sign In';

  // ---------------------------------------------------------------------------
  // Career Tracks Localization Helpers
  // ---------------------------------------------------------------------------
  String localizedCareerTitle(String key) {
    final lower = key.trim().toLowerCase();
    if (lower == 'frontend' || lower.contains('front')) {
      return isArabic ? 'تطوير واجهات المواقع' : 'Frontend Development';
    }
    if (lower == 'backend' || lower.contains('back')) {
      return isArabic ? 'تطوير الأنظمة الخلفية' : 'Backend Development';
    }
    if (lower == 'data' || lower.contains('data')) {
      return isArabic ? 'تحليل البيانات' : 'Data Analysis';
    }
    if (lower == 'cybersecurity' || lower.contains('cyber') || lower.contains('security')) {
      return isArabic ? 'الأمن السيبراني' : 'Cybersecurity';
    }
    if (lower == 'uiux' || lower.contains('design') || lower.contains('ui')) {
      return isArabic ? 'تصميم تجربة وواجهة المستخدم' : 'UI/UX Design';
    }
    if (lower == 'mobile' || lower.contains('mobile')) {
      return isArabic ? 'تطوير تطبيقات الموبايل' : 'Mobile Development';
    }
    return key;
  }

  String localizedCareerBadge(String key) {
    if (!isArabic) {
      switch (key) {
        case 'Mobile Development':
          return 'High Demand';
        case 'Frontend Engineering':
          return 'Interactive UI';
        case 'Backend Systems':
          return 'System Architect';
        case 'Cybersecurity':
          return 'Digital Defense';
        case 'Data Science & AI':
          return 'AI & Intelligence';
        case 'UI / UX Design':
          return 'Product Experience';
        default:
          return 'Trending';
      }
    }
    switch (key) {
      case 'Mobile Development':
        return 'طلب مرتفع جداً';
      case 'Frontend Engineering':
        return 'واجهات تفاعلية';
      case 'Backend Systems':
        return 'معماري أنظمة';
      case 'Cybersecurity':
        return 'دفاع رقمي';
      case 'Data Science & AI':
        return 'ذكاء اصطناعي';
      case 'UI / UX Design':
        return 'تجربة منتج';
      default:
        return 'تخصص واعد';
    }
  }

  String localizedCareerTagline(String key) {
    if (!isArabic) {
      switch (key) {
        case 'Mobile Development':
          return 'Architect of Pocket-Sized Digital Experiences';
        case 'Frontend Engineering':
          return 'Creator of Modern Web & Interactive Ecosystems';
        case 'Backend Systems':
          return 'Master of Scalable Infrastructure & Data Pipes';
        case 'Cybersecurity':
          return 'Guardian of Sensitive Data & Digital Trust';
        case 'Data Science & AI':
          return 'Unlocking Knowledge from Chaos with Algorithms';
        case 'UI / UX Design':
          return 'Architect of Intuitive Human-Centered Experiences';
        default:
          return 'Future-Proof Tech Career';
      }
    }
    switch (key) {
      case 'Mobile Development':
        return 'مهندس التجارب الرقمية في جيوب الملايين';
      case 'Frontend Engineering':
        return 'مبتكر الأنظمة والواجهات الرقمية التفاعلية للويب';
      case 'Backend Systems':
        return 'مهندس البنية التحتية القابلة للتوسع وتدفقات البيانات';
      case 'Cybersecurity':
        return 'حامي البيانات الحساسة وصمام الثقة الرقمية';
      case 'Data Science & AI':
        return 'استخلاص المعرفة من البيانات بواسطة الخوارزميات';
      case 'UI / UX Design':
        return 'مصمم التجارب الرقمية المرتكزة حول الإنسان';
      default:
        return 'مسار مهني تقني متطور';
    }
  }

  String localizedCareerDescription(String key) {
    if (!isArabic) {
      switch (key) {
        case 'Mobile Development':
          return 'You thrive on delivering tangible, high-performance apps that people interact with hundreds of times a day. Your focus bridges smooth touch interactions, native device capabilities, and reactive state management.';
        case 'Frontend Engineering':
          return 'Your strength is bringing software to life visually. You transform complex business logic into beautiful, responsive web experiences with crisp accessibility, component modularity, and lightning-fast load times.';
        case 'Backend Systems':
          return 'You love the invisible power of technology. You care deeply about sub-millisecond query responses, resilient database transactions, clean API design, and distributed cloud microservices that never sleep.';
        case 'Cybersecurity':
          return 'You possess an inquisitive, adversarial mindset. You find the vulnerabilities others miss, build automated intrusion defenses, and safeguard infrastructure against modern exploits and cyber warfare.';
        case 'Data Science & AI':
          return 'You see stories in numbers. You specialize in turning noisy, raw data into predictive algorithms, training machine learning models, and building intelligent features that transform business decision-making.';
        case 'UI / UX Design':
          return 'You merge user psychology with pixel-perfect visual artistry. You study how humans interact with technology, eliminating confusion and engineering moments of delight across websites, apps, and digital platforms.';
        default:
          return 'Explore this career path to build essential engineering skills.';
      }
    }
    switch (key) {
      case 'Mobile Development':
        return 'تتميز ببناء تطبيقات ملموسة وعالية الأداء يتفاعل معها الناس يومياً، جامعاً بين سلاسة الواجهات وقدرات الأجهزة والبرمجة التفاعلية.';
      case 'Frontend Engineering':
        return 'تكمن قوتك في تجسيد البرمجيات بصرياً وتحويل المنطق المعقد إلى تجارب ويب متجاوبة وسريعة وسهلة الوصول وجميلة المظهر.';
      case 'Backend Systems':
        return 'تعشق القوة الخفية للتقنية، وتهتم بسرعة الاستعلامات واستقرار قواعد البيانات وتصميم واجهات برمجة التطبيقات والخدمات السحابية الموزعة.';
      case 'Cybersecurity':
        return 'تمتلك عقلية تحليلية استقصائية تكتشف الثغرات وتبني أنظمة الحماية وتصد التهديدات والهجمات السيبرانية لحماية البنية الرقمية.';
      case 'Data Science & AI':
        return 'ترى القصص الكامنة خلف الأرقام، وتتخصص في تحويل البيانات الخام إلى نماذج تنبؤية وخوارزميات ذكاء اصطناعي تدعم القرارات الذكية.';
      case 'UI / UX Design':
        return 'تدمج علم نفس المستخدم مع الحس الجمالي المتقن لإزالة التعقيد وصنع تجارب رقمية جذابة وسهلة الاستخدام تثري تجربة المستخدم.';
      default:
        return 'استكشف هذا المسار المهني لبناء مهارات تقنية متقدمة.';
    }
  }

  String localizedCareerTechStack(String key) {
    if (!isArabic) {
      switch (key) {
        case 'Mobile Development':
          return 'Flutter • Dart • iOS • Android';
        case 'Frontend Engineering':
          return 'React • TypeScript • Tailwind • Next.js';
        case 'Backend Systems':
          return 'Python • Go • PostgreSQL • Microservices';
        case 'Cybersecurity':
          return 'Ethical Hacking • Network Sec • SecOps';
        case 'Data Science & AI':
          return 'Python • PyTorch • SQL • LLMs';
        case 'UI / UX Design':
          return 'Figma • Design Systems • Wireframing';
        default:
          return 'Modern Tools';
      }
    }
    switch (key) {
      case 'Mobile Development':
        return 'فلاتر • دارت • iOS • أندرويد';
      case 'Frontend Engineering':
        return 'رياكت • تايب سكريبت • تيلويند • نيكست';
      case 'Backend Systems':
        return 'بايثون • غو • بوستغريس • خدمات مصغرة';
      case 'Cybersecurity':
        return 'اختراق أخلاقي • أمن الشبكات • عمليات الأمان';
      case 'Data Science & AI':
        return 'بايثون • بايتورش • SQL • نماذج لغوية';
      case 'UI / UX Design':
        return 'فيغما • أنظمة التصميم • نماذج أولية';
      default:
        return 'أدوات حديثة';
    }
  }

  String localizedCareerDemand(String key) {
    if (!isArabic) {
      switch (key) {
        case 'Mobile Development':
          return '🔥 Very High Demand (Top 5 Tech Role)';
        case 'Frontend Engineering':
          return '🔥 Steady High Demand across Global Tech';
        case 'Backend Systems':
          return '🔥 Universal Demand across All Industries';
        case 'Cybersecurity':
          return '🔥 Exponential Demand & Critical Global Shortage';
        case 'Data Science & AI':
          return '🔥 Rapidly Expanding AI-Era Demand';
        case 'UI / UX Design':
          return '🔥 High Strategic Value in Tech Products';
        default:
          return '🔥 High Demand';
      }
    }
    switch (key) {
      case 'Mobile Development':
        return '🔥 طلب وظيفي مرتفع جداً (ضمن أعلى 5 وظائف تقنية)';
      case 'Frontend Engineering':
        return '🔥 طلب مستمر ومرتفع في كبرى الشركات التقنية';
      case 'Backend Systems':
        return '🔥 طلب واسع في مختلف القطاعات والمؤسسات';
      case 'Cybersecurity':
        return '🔥 طلب هائل ونقص عالمي حاد في الكفاءات';
      case 'Data Science & AI':
        return '🔥 طلب متسارع وضخم في عصر الذكاء الاصطناعي';
      case 'UI / UX Design':
        return '🔥 قيمة استراتيجية عالية في بناء المنتجات التقنية';
      default:
        return '🔥 طلب مرتفع';
    }
  }

  String localizedCareerSalary(String key) {
    if (!isArabic) {
      switch (key) {
        case 'Mobile Development':
          return '\$85,000 - \$145,000 / yr';
        case 'Frontend Engineering':
          return '\$80,000 - \$140,000 / yr';
        case 'Backend Systems':
          return '\$90,000 - \$155,000 / yr';
        case 'Cybersecurity':
          return '\$95,000 - \$160,000 / yr';
        case 'Data Science & AI':
          return '\$92,000 - \$165,000 / yr';
        case 'UI / UX Design':
          return '\$78,000 - \$135,000 / yr';
        default:
          return '\$80,000 - \$140,000 / yr';
      }
    }
    switch (key) {
      case 'Mobile Development':
        return '85,000\$ - 145,000\$ سنوياً';
      case 'Frontend Engineering':
        return '80,000\$ - 140,000\$ سنوياً';
      case 'Backend Systems':
        return '90,000\$ - 155,000\$ سنوياً';
      case 'Cybersecurity':
        return '95,000\$ - 160,000\$ سنوياً';
      case 'Data Science & AI':
        return '92,000\$ - 165,000\$ سنوياً';
      case 'UI / UX Design':
        return '78,000\$ - 135,000\$ سنوياً';
      default:
        return '80,000\$ - 140,000\$ سنوياً';
    }
  }

  List<String> localizedCareerTraits(String key) {
    if (!isArabic) {
      switch (key) {
        case 'Mobile Development':
          return [
            'Device-native thinking',
            'Appreciation for buttery-smooth 60/120fps UI',
            'Strong problem-solving with reactive states',
            'Passion for shipping software to millions via App Stores',
          ];
        case 'Frontend Engineering':
          return [
            'High visual sensitivity & design empathy',
            'Component-driven architecture mindset',
            'Mastery of web performance & responsive layouts',
            'Love for creative animations and immediate visual feedback',
          ];
        case 'Backend Systems':
          return [
            'Deep analytical and logical mindset',
            'Obsession with system reliability & uptime',
            'Data modeling & schema optimization skills',
            'Comfort working with command lines, servers, and networks',
          ];
        case 'Cybersecurity':
          return [
            'Thorough investigative & deductive reasoning',
            'Adversarial thinking & proactive curiosity',
            'High attention to edge cases & security flaws',
            'Calm problem-solving under incident response pressure',
          ];
        case 'Data Science & AI':
          return [
            'Strong mathematical and statistical aptitude',
            'Hypothesis-driven scientific methodology',
            'Pattern recognition in large complex datasets',
            'Curiosity about generative models & neural networks',
          ];
        case 'UI / UX Design':
          return [
            'Deep human empathy & user-first thinking',
            'Flawless eye for typography, balance, and color harmony',
            'Interactive prototyping and user testing skills',
            'Cross-functional communication with engineers',
          ];
        default:
          return ['Analytical mindset', 'Problem solver'];
      }
    }
    switch (key) {
      case 'Mobile Development':
        return [
          'التفكير الموجه لخصائص الأجهزة الذكية',
          'الشغف بالواجهات الفائقة السلاسة بمعدل 60 و120 إطاراً في الثانية',
          'القدرة العالية على إدارة الحالات التفاعلية في التطبيقات',
          'الحماس لنشر البرمجيات لملايين المستخدمين عبر متاجر التطبيقات',
        ];
      case 'Frontend Engineering':
        return [
          'حس جمالي وبصري عالٍ والتعاطف مع المستخدم',
          'عقلية هيكلة المكونات القابلة لإعادة الاستخدام',
          'إتقان سرعة تحميل الويب والتصميم المتجاوب مع كل الشاشات',
          'حب الحركات التفاعلية والتغذية الراجعة الفورية',
        ];
      case 'Backend Systems':
        return [
          'تفكير تحليلي ومنطقي عميق ومنظم',
          'الاهتمام الفائق باستقرار وجاهزية الأنظمة دون انقطاع',
          'مهارة نمذجة البيانات وتحسين قواعد البيانات الضخمة',
          'الشغف بالعمل مع الخوادم وبيئات التطوير السحابية',
        ];
      case 'Cybersecurity':
        return [
          'حس استقصائي وتحليلي استثنائي للتفاصيل الدقيقة',
          'تفكير هجومي دفاعي وفضول استباقي للثغرات',
          'انتباه شديد للحالات النادرة والمخاطر غير المتوقعة',
          'هدوء في حل الأزمات والاستجابة للحوادث الأمنية',
        ];
      case 'Data Science & AI':
        return [
          'قدرات رياضية وإحصائية واستنتاجية قوية',
          'منهجية علمية ترتكز على اختبار الفرضيات',
          'اكتشاف الأنماط والعلاقات في مجموعات البيانات الكبيرة',
          'شغف بنماذج الذكاء الاصطناعي التوليدية والشبكات العصبية',
        ];
      case 'UI / UX Design':
        return [
          'تعاطف إنساني عميق والتفكير المرتكز حول المستخدم أولاً',
          'عين خبيرة في الخطوط وتناسق الألوان والمسافات',
          'مهارة بناء النماذج التفاعلية واختبار سهولة الاستخدام',
          'تواصل فعال مع فرق الهندسة لتطبيق التصاميم بدقة',
        ];
      default:
        return ['تفكير تحليلي', 'مهارة حل المشكلات'];
    }
  }

  List<String> localizedTypicalRoles(String key) {
    if (!isArabic) {
      switch (key) {
        case 'Mobile Development':
          return [
            'Flutter Mobile Engineer',
            'iOS / Android Developer',
            'Cross-Platform Architect',
          ];
        case 'Frontend Engineering':
          return [
            'Frontend Software Engineer',
            'UI Systems Developer',
            'Web Platform Specialist',
          ];
        case 'Backend Systems':
          return [
            'Backend Software Engineer',
            'Cloud Solutions Architect',
            'API Platform Engineer',
          ];
        case 'Cybersecurity':
          return [
            'Security Analyst / SecOps',
            'Penetration Tester',
            'Information Security Engineer',
          ];
        case 'Data Science & AI':
          return [
            'Data Scientist',
            'Machine Learning Engineer',
            'AI Solutions Specialist',
          ];
        case 'UI / UX Design':
          return [
            'Product Designer',
            'UX Researcher',
            'UI Design System Architect',
          ];
        default:
          return ['Software Specialist'];
      }
    }
    switch (key) {
      case 'Mobile Development':
        return [
          'مهندس تطبيقات فلاتر',
          'مطور أندرويد و iOS',
          'معماري تطبيقات متعددة المنصات',
        ];
      case 'Frontend Engineering':
        return [
          'مهندس برمجيات واجهات ويب',
          'مطور أنظمة واجهات المستخدم',
          'أخصائي منصات الويب الحديثة',
        ];
      case 'Backend Systems':
        return [
          'مهندس برمجيات خوادم خلفية',
          'معماري حلول سحابية',
          'مهندس واجهات برمجية (APIs)',
        ];
      case 'Cybersecurity':
        return [
          'محلل أمن سيبراني وعمليات',
          'مختبر اختراق أخلاقي',
          'مهندس أمن معلومات',
        ];
      case 'Data Science & AI':
        return [
          'عالم بيانات',
          'مهندس تعلّم آلة',
          'أخصائي حلول الذكاء الاصطناعي',
        ];
      case 'UI / UX Design':
        return [
          'مصمم منتجات رقمية',
          'باحث تجربة مستخدم (UX)',
          'معماري أنظمة تصميم الواجهات',
        ];
      default:
        return ['أخصائي تقني'];
    }
  }

  List<Map<String, String>> localizedSkills(String key) {
    if (!isArabic) {
      switch (key) {
        case 'Mobile Development':
          return [
            {'name': 'Flutter & Dart', 'category': 'Core Framework'},
            {'name': 'Firebase Suite', 'category': 'Cloud Backend'},
            {
              'name': 'State Management (Bloc/Riverpod)',
              'category': 'Architecture'
            },
            {'name': 'REST APIs & GraphQL', 'category': 'Networking'},
            {'name': 'Offline Storage & SQLite', 'category': 'Data Persistence'},
            {'name': 'CI/CD & App Distribution', 'category': 'DevOps'},
          ];
        case 'Frontend Engineering':
          return [
            {'name': 'React / Next.js', 'category': 'Framework'},
            {'name': 'TypeScript & JavaScript', 'category': 'Core Language'},
            {'name': 'Tailwind CSS / modern styling', 'category': 'Styling'},
            {'name': 'Web Performance & SEO', 'category': 'Optimization'},
            {
              'name': 'State Management (Redux/Zustand)',
              'category': 'Architecture'
            },
            {'name': 'Git & Automated Testing', 'category': 'Workflow'},
          ];
        case 'Backend Systems':
          return [
            {'name': 'Python / Go / Node.js', 'category': 'Language'},
            {'name': 'PostgreSQL & MongoDB', 'category': 'Databases'},
            {'name': 'RESTful APIs & gRPC', 'category': 'Communication'},
            {'name': 'Docker & Microservices', 'category': 'Containers'},
            {'name': 'Redis & Message Queues', 'category': 'Throughput'},
            {'name': 'Cloud Services (AWS / GCP)', 'category': 'Cloud Infra'},
          ];
        case 'Cybersecurity':
          return [
            {'name': 'Network Protocols & Firewalls', 'category': 'Networking'},
            {
              'name': 'Ethical Hacking & Penetration Testing',
              'category': 'Offense'
            },
            {'name': 'Linux Administration & Bash', 'category': 'Systems'},
            {'name': 'Identity & Access Management (IAM)', 'category': 'Security'},
            {'name': 'SIEM & Threat Hunting', 'category': 'Detection'},
            {'name': 'Cryptography Fundamentals', 'category': 'Data Protection'},
          ];
        case 'Data Science & AI':
          return [
            {
              'name': 'Python (Pandas, NumPy, Scikit)',
              'category': 'Data Science'
            },
            {'name': 'SQL & Data Warehousing', 'category': 'Data Storage'},
            {'name': 'PyTorch / TensorFlow', 'category': 'Deep Learning'},
            {'name': 'LLM Prompting & Fine-Tuning', 'category': 'Generative AI'},
            {'name': 'Data Visualization & BI', 'category': 'Insights'},
            {'name': 'Model Deployment & MLOps', 'category': 'Production'},
          ];
        case 'UI / UX Design':
          return [
            {'name': 'Figma & FigJam Mastery', 'category': 'Design Suite'},
            {'name': 'Design Systems & Tokens', 'category': 'UI Systems'},
            {'name': 'User Research & Journey Mapping', 'category': 'UX Research'},
            {'name': 'Interactive Prototyping', 'category': 'Interaction'},
            {'name': 'Accessibility (WCAG Standards)', 'category': 'Inclusion'},
            {'name': 'Information Architecture', 'category': 'Structure'},
          ];
        default:
          return [];
      }
    }
    switch (key) {
      case 'Mobile Development':
        return [
          {'name': 'فلاتر ودارت (Flutter & Dart)', 'category': 'إطار العمل الأساسي'},
          {'name': 'حزمة فايربيس (Firebase Suite)', 'category': 'السحابة الخلفية'},
          {
            'name': 'إدارة الحالة (Bloc / Riverpod)',
            'category': 'الهيكلة المعمارية'
          },
          {'name': 'واجهات REST APIs وGraphQL', 'category': 'الاتصال بالشبكة'},
          {'name': 'التخزين المحلي وSQLite', 'category': 'حفظ البيانات'},
          {'name': 'التوزيع المستمر ومتاجر التطبيقات', 'category': 'العمليات والتوزيع'},
        ];
      case 'Frontend Engineering':
        return [
          {'name': 'رياكت ونيكست (React / Next.js)', 'category': 'إطار العمل'},
          {'name': 'تايب سكريبت وجافا سكريبت', 'category': 'اللغات الأساسية'},
          {'name': 'تيلويند (Tailwind CSS)', 'category': 'التنسيق والواجهات'},
          {'name': 'أداء الويب وتحسين محركات البحث', 'category': 'تحسين الأداء'},
          {'name': 'إدارة الحالة (Redux / Zustand)', 'category': 'الهيكلة المعمارية'},
          {'name': 'نظام Git والاختبارات الآلية', 'category': 'سير العمل'},
        ];
      case 'Backend Systems':
        return [
          {'name': 'بايثون / غو / نود (Python / Go)', 'category': 'لغات البرمجة'},
          {'name': 'بوستغريس ومونغو (PostgreSQL)', 'category': 'قواعد البيانات'},
          {'name': 'واجهات RESTful وgRPC', 'category': 'بروتوكولات الاتصال'},
          {'name': 'دوكر والخدمات المصغرة (Docker)', 'category': 'الحاويات'},
          {'name': 'ريديس وطوابير الرسائل (Redis)', 'category': 'كفاءة التدفق'},
          {'name': 'الخدمات السحابية (AWS / GCP)', 'category': 'البنية السحابية'},
        ];
      case 'Cybersecurity':
        return [
          {'name': 'بروتوكولات الشبكات والجدران النارية', 'category': 'الشبكات'},
          {'name': 'الاختراق الأخلاقي وفحص الثغرات', 'category': 'الهجوم الإيجابي'},
          {'name': 'إدارة نظام لينكس وسكربتات Bash', 'category': 'إدارة الأنظمة'},
          {'name': 'إدارة الهوية والوصول (IAM)', 'category': 'أمن الحسابات'},
          {'name': 'أنظمة رصد التهديدات (SIEM)', 'category': 'كشف التسلل'},
          {'name': 'أسس التشفير وحماية البيانات', 'category': 'حماية المعلومات'},
        ];
      case 'Data Science & AI':
        return [
          {'name': 'بايثون ومكتبات Pandas وNumPy', 'category': 'علم البيانات'},
          {'name': 'لغة SQL ومستودعات البيانات', 'category': 'تخزين البيانات'},
          {'name': 'مكتبة PyTorch والتعلّم العميق', 'category': 'الذكاء الاصطناعي'},
          {'name': 'النماذج اللغوية وهندسة الأوامر', 'category': 'الذكاء التوليدي'},
          {'name': 'التصوير البياني للبيانات (BI)', 'category': 'استخراج الرؤى'},
          {'name': 'نشر النماذج وعمليات MLOps', 'category': 'الإنتاج السحابي'},
        ];
      case 'UI / UX Design':
        return [
          {'name': 'احتراف فيغما (Figma & FigJam)', 'category': 'أدوات التصميم'},
          {'name': 'أنظمة التصميم ورموز Design Tokens', 'category': 'هيكلة الواجهات'},
          {'name': 'أبحاث المستخدم ورسم رحلة العميل', 'category': 'أبحاث التجربة'},
          {'name': 'النمذجة التفاعلية (Prototyping)', 'category': 'التفاعل'},
          {'name': 'سهولة الوصول الشامل (WCAG)', 'category': 'الشمولية'},
          {'name': 'هندسة بنية المعلومات (IA)', 'category': 'التنظيم الهيكلي'},
        ];
      default:
        return [];
    }
  }

  // ---------------------------------------------------------------------------
  // Assessment Questions Localization Helper
  // ---------------------------------------------------------------------------
  List<LocalizedAssessmentQuestion> get assessmentQuestions {
    if (!isArabic) {
      return const [
        LocalizedAssessmentQuestion(
          stepTitle: 'FOCUS & PASSION',
          question: 'What excites you most about working with technology?',
          subtitle:
              'Choose the area where you naturally feel the most curiosity and energy.',
          options: [
            LocalizedAssessmentOption(
              careerTrack: 'Mobile Development',
              title: 'Crafting Mobile Experiences',
              subtitle:
                  'Building fast, fluid apps for smartphones that users carry everywhere.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Frontend Engineering',
              title: 'Interactive Web & Interfaces',
              subtitle:
                  'Bringing websites to life with modern UI animations and reactive components.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Backend Systems',
              title: 'APIs, Databases & Architecture',
              subtitle:
                  'Architecting distributed systems that process millions of requests securely.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Cybersecurity',
              title: 'Security, Defense & Ethical Hacking',
              subtitle:
                  'Protecting infrastructure, analyzing vulnerabilities, and thwarting threats.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Data Science & AI',
              title: 'Data Intelligence & Machine Learning',
              subtitle:
                  'Uncovering hidden insights, training AI models, and predictive modeling.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'UI / UX Design',
              title: 'Visual Design & User Psychology',
              subtitle:
                  'Understanding human behavior, sketching design systems, and wireframing.',
            ),
          ],
        ),
        LocalizedAssessmentQuestion(
          stepTitle: 'PROBLEM SOLVING STYLE',
          question: 'How do you naturally approach solving complex challenges?',
          subtitle:
              'Pick the problem-solving mindset that aligns with how you think.',
          options: [
            LocalizedAssessmentOption(
              careerTrack: 'Mobile Development',
              title: 'Device-Centric Prototyping',
              subtitle:
                  'Testing touch gestures, optimizing battery performance, and instant UI iteration.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Frontend Engineering',
              title: 'Component Design & Visual Logic',
              subtitle:
                  'Translating visual mockups into modular, accessible, and responsive code.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Backend Systems',
              title: 'Algorithmic & Structural Thinking',
              subtitle:
                  'Optimizing SQL queries, building concurrency patterns, and microservice communication.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Cybersecurity',
              title: 'Adversarial & Threat Modeling',
              subtitle:
                  'Thinking like an attacker to discover loopholes before anyone else can.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Data Science & AI',
              title: 'Statistical & Pattern Recognition',
              subtitle:
                  'Analyzing correlation, validating hypotheses, and tuning parameters.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'UI / UX Design',
              title: 'Empathy & User Flow Mapping',
              subtitle:
                  'Conducting interviews, removing friction, and refining usability heuristics.',
            ),
          ],
        ),
        LocalizedAssessmentQuestion(
          stepTitle: 'PRODUCT GOAL',
          question: 'What kind of project would you be most proud to showcase?',
          subtitle:
              'Select the capstone portfolio accomplishment that inspires you.',
          options: [
            LocalizedAssessmentOption(
              careerTrack: 'Mobile Development',
              title: 'An App Store Featured Mobile App',
              subtitle:
                  'A top-rated iOS/Android Flutter app with offline caching and smooth gestures.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Frontend Engineering',
              title: 'An Award-Winning Web Experience',
              subtitle:
                  'A blazing-fast SaaS dashboard with dark mode and dynamic micro-interactions.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Backend Systems',
              title: 'A High-Throughput Cloud Platform',
              subtitle:
                  'A 99.999% uptime backend handling resilient real-time streaming data.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Cybersecurity',
              title: 'An Impenetrable Security Perimeter',
              subtitle:
                  'A zero-trust identity architecture with automated intrusion prevention.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Data Science & AI',
              title: 'An AI-Powered Prediction Engine',
              subtitle:
                  'A machine learning pipeline offering accurate real-time recommendations.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'UI / UX Design',
              title: 'A Comprehensive Design System',
              subtitle:
                  'A polished design tokens library and interactive Figma design system.',
            ),
          ],
        ),
        LocalizedAssessmentQuestion(
          stepTitle: 'IDEAL WORK ENVIRONMENT',
          question:
              'Which daily development rhythm fits your personality best?',
          subtitle: 'Choose where you can produce your best flow state.',
          options: [
            LocalizedAssessmentOption(
              careerTrack: 'Mobile Development',
              title: 'Rapid Cross-Device Iteration',
              subtitle:
                  'Testing on physical devices, tweaking hot reload, and polishing touch UX.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Frontend Engineering',
              title: 'Browser DevTools & Pixel Crafting',
              subtitle:
                  'Fine-tuning CSS layouts, debugging DOM events, and shipping instant visual results.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Backend Systems',
              title: 'Deep Focus & Terminal Mastery',
              subtitle:
                  'Profiling queries, inspecting server metrics, and orchestrating Docker containers.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Cybersecurity',
              title: 'High-Stakes Investigation & Defense',
              subtitle:
                  'Analyzing network packets, auditing permissions, and forensic log triage.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'Data Science & AI',
              title: 'Notebook Experiments & Analytics',
              subtitle:
                  'Iterating in Jupyter notebooks, graphing trends, and testing data pipelines.',
            ),
            LocalizedAssessmentOption(
              careerTrack: 'UI / UX Design',
              title: 'Design Critique & Creative Collaboration',
              subtitle:
                  'Whiteboarding user flows, collaborating on prototypes, and testing with real users.',
            ),
          ],
        ),
      ];
    }

    // Arabic Assessment Questions & Options
    return const [
      LocalizedAssessmentQuestion(
        stepTitle: 'التركيز والشغف',
        question: 'ما أكثر ما يثير حماسك عند العمل في مجال التكنولوجيا؟',
        subtitle:
            'اختر المجال الذي تشعر فيه بأكبر قدر من الفضول والطاقة بشكل طبيعي.',
        options: [
          LocalizedAssessmentOption(
            careerTrack: 'Mobile Development',
            title: 'بناء وتطوير تطبيقات الهواتف',
            subtitle:
                'تطوير تطبيقات سريعة وسلسة يستخدمها الناس على هواتفهم أينما ذهبوا.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Frontend Engineering',
            title: 'تطوير واجهات الويب التفاعلية',
            subtitle:
                'إحياء مواقع الويب بتصاميم حديثة ومكونات تفاعلية وحركات سلسة.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Backend Systems',
            title: 'الأنظمة الخلفية وقواعد البيانات',
            subtitle:
                'هندسة أنظمة سحابية موزعة تعالج ملايين الطلبات بأمان وكفاءة.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Cybersecurity',
            title: 'الأمن السيبراني والدفاع الرقمي',
            subtitle:
                'حماية البنية التحتية، واكتشاف الثغرات الأمنية، والتصدي للهجمات.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Data Science & AI',
            title: 'ذكاء البيانات وتعلّم الآلة',
            subtitle:
                'استخراج الأنماط الخفية، وتدريب نماذج الذكاء الاصطناعي والتنبؤ.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'UI / UX Design',
            title: 'تصميم تجربة وواجهة المستخدم',
            subtitle:
                'فهم سلوك المستخدم، وبناء أنظمة التصميم، وتصميم المخططات الهيكلية.',
          ),
        ],
      ),
      LocalizedAssessmentQuestion(
        stepTitle: 'أسلوب حل المشكلات',
        question: 'كيف تتعامل بطبيعتك مع التحديات والمشكلات المعقدة؟',
        subtitle: 'اختر العقلية التي تتطابق مع أسلوب تفكيرك وتحليلك.',
        options: [
          LocalizedAssessmentOption(
            careerTrack: 'Mobile Development',
            title: 'النمذجة السريعة الموجهة للأجهزة',
            subtitle:
                'اختبار إيماءات اللمس، وتحسين استهلاك البطارية، والتجربة اللحظية.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Frontend Engineering',
            title: 'تصميم المكونات والمنطق المرئي',
            subtitle:
                'تحويل التصاميم المرئية إلى شفرات برمجية معيارية متجاوبة وسهلة الاستخدام.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Backend Systems',
            title: 'التفكير الخوارزمي والهيكلي',
            subtitle:
                'تحسين استعلامات قواعد البيانات، وبناء المعالجة المتزامنة والخدمات المصغرة.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Cybersecurity',
            title: 'التفكير الهجومي ونمذجة التهديدات',
            subtitle:
                'التفكير بعقلية المهاجم لاكتشاف الثغرات الرقمية قبل استغلالها.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Data Science & AI',
            title: 'التحليل الإحصائي واكتشاف الأنماط',
            subtitle:
                'تحليل الارتباطات الإحصائية، واختبار الفرضيات، وضبط معاملات النماذج.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'UI / UX Design',
            title: 'التعاطف مع المستخدم ورسم رحلته',
            subtitle:
                'إجراء المقابلات مع المستخدمين، وتسهيل الاستخدام وإزالة العقبات.',
          ),
        ],
      ),
      LocalizedAssessmentQuestion(
        stepTitle: 'الهدف والمنتج النهائي',
        question: 'ما نوع المشروع الذي ستكون أكثر فخراً بإنجازه وعرضه؟',
        subtitle: 'اختر إنجاز المحفظة البرمجية الذي يلهمك أكثر.',
        options: [
          LocalizedAssessmentOption(
            careerTrack: 'Mobile Development',
            title: 'تطبيق مميز على متاجر التطبيقات',
            subtitle:
                'تطبيق Flutter بتقييم عالٍ على iOS وأندرويد مع دعم العمل دون إنترنت.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Frontend Engineering',
            title: 'منصة ويب حائزة على جوائز',
            subtitle:
                'لوحة تحكم برمجية فائقة السرعة مع الوضع الداكن وتفاعلات ديناميكية متقنة.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Backend Systems',
            title: 'منصة سحابية عالية التحمل والجاهزية',
            subtitle:
                'خادم سحابي بنسبة توفر 99.999% يعالج تدفقات البيانات اللحظية بكفاءة.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Cybersecurity',
            title: 'جدار أمني رقمي غير قابل للاختراق',
            subtitle:
                'هندسة ثقة صفرية مع كشف واعتراض تلقائي لمحاولات الاختراق والتسلل.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Data Science & AI',
            title: 'محرك تنبؤ مدعوم بالذكاء الاصطناعي',
            subtitle:
                'خط معالجة لتعلّم الآلة يقدم توصيات وتنبؤات فورية بالغة الدقة.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'UI / UX Design',
            title: 'نظام تصميم متكامل وشامل',
            subtitle:
                'مكتبة عناصر وتصميم متقنة في Figma توحد هوية وتجربة المنتج الرقمي.',
          ),
        ],
      ),
      LocalizedAssessmentQuestion(
        stepTitle: 'بيئة العمل المثالية',
        question: 'أي من بيئات وتجارب التطوير اليومية تناسب شخصيتك أكثر؟',
        subtitle: 'اختر البيئة التي تمنحك أعلى درجات التركيز والإنتاجية.',
        options: [
          LocalizedAssessmentOption(
            careerTrack: 'Mobile Development',
            title: 'التجربة السريعة عبر مختلف الأجهزة',
            subtitle:
                'التجربة المباشرة على الهواتف، والتحديث الفوري السريع، وصقل تجربة اللمس.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Frontend Engineering',
            title: 'أدوات المتصفح وضبط التفاصيل المرئية',
            subtitle:
                'تعديل تنسيقات CSS بدقة، وتصحيح DOM، ومتابعة النتائج المرئية فور ظهورها.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Backend Systems',
            title: 'التركيز العميق والعمل عبر الطرفية',
            subtitle:
                'فحص أداء الاستعلامات، ومراقبة مقاييس الخوادم، وإدارة حاويات Docker.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Cybersecurity',
            title: 'التحقيق الأمني والتصدي عالي الدقة',
            subtitle:
                'تحليل حزم البيانات في الشبكات، والتدقيق الجنائي، ومراجعة سجلات الأمان.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'Data Science & AI',
            title: 'تجارب دفاتر البيانات والتحليلات',
            subtitle:
                'التجربة والتحليل في دفاتر Jupyter، ورسم المخططات البيانية، واختبار النماذج.',
          ),
          LocalizedAssessmentOption(
            careerTrack: 'UI / UX Design',
            title: 'جلسات نقد التصميم والتعاون الإبداعي',
            subtitle:
                'رسم مسارات المستخدمين على اللوحات، والتعاون في النماذج الأولية واختبارها.',
          ),
        ],
      ),
    ];
  }
}

class LocalizedAssessmentQuestion {
  final String stepTitle;
  final String question;
  final String subtitle;
  final List<LocalizedAssessmentOption> options;

  const LocalizedAssessmentQuestion({
    required this.stepTitle,
    required this.question,
    required this.subtitle,
    required this.options,
  });
}

class LocalizedAssessmentOption {
  final String careerTrack;
  final String title;
  final String subtitle;

  const LocalizedAssessmentOption({
    required this.careerTrack,
    required this.title,
    required this.subtitle,
  });
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

