/// Authoritative Assessment Questions & Career Paths data matching the Waypoint Website.
/// SINGLE SOURCE OF TRUTH: quizQuestions.js & pathsData.js from the Waypoint web application.
library;

class QuizOption {
  final String value;
  final String symbol;
  final String labelEn;
  final String labelAr;

  const QuizOption({
    required this.value,
    required this.symbol,
    required this.labelEn,
    required this.labelAr,
  });

  String getLabel(bool isArabic) => isArabic ? labelAr : labelEn;
}

class QuizQuestion {
  final int id;
  final String titleEn;
  final String titleAr;
  final String subtitleEn;
  final String subtitleAr;
  final List<QuizOption> options;

  const QuizQuestion({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.subtitleEn,
    required this.subtitleAr,
    required this.options,
  });

  String getTitle(bool isArabic) => isArabic ? titleAr : titleEn;
  String getSubtitle(bool isArabic) => isArabic ? subtitleAr : subtitleEn;
}

class CareerPathInfo {
  final String id;
  final String number;
  final String titleEn;
  final String titleAr;
  final String symbol;
  final String category;
  final String personalityTypeEn;
  final String personalityTypeAr;
  final String personalitySummaryEn;
  final String personalitySummaryAr;
  final String shortDescEn;
  final String shortDescAr;
  final String descriptionEn;
  final String descriptionAr;
  final List<String> skillsEn;
  final List<String> skillsAr;
  final List<String> roadmapEn;
  final List<String> roadmapAr;
  final String projectEn;
  final String projectAr;

  const CareerPathInfo({
    required this.id,
    required this.number,
    required this.titleEn,
    required this.titleAr,
    required this.symbol,
    required this.category,
    required this.personalityTypeEn,
    required this.personalityTypeAr,
    required this.personalitySummaryEn,
    required this.personalitySummaryAr,
    required this.shortDescEn,
    required this.shortDescAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.skillsEn,
    required this.skillsAr,
    required this.roadmapEn,
    required this.roadmapAr,
    required this.projectEn,
    required this.projectAr,
  });

  String getTitle(bool isArabic) => isArabic ? titleAr : titleEn;
  String getPersonalityType(bool isArabic) =>
      isArabic ? personalityTypeAr : personalityTypeEn;
  String getPersonalitySummary(bool isArabic) =>
      isArabic ? personalitySummaryAr : personalitySummaryEn;
  String getShortDesc(bool isArabic) => isArabic ? shortDescAr : shortDescEn;
  String getDescription(bool isArabic) =>
      isArabic ? descriptionAr : descriptionEn;
  List<String> getSkills(bool isArabic) => isArabic ? skillsAr : skillsEn;
  List<String> getRoadmap(bool isArabic) => isArabic ? roadmapAr : roadmapEn;
  String getProject(bool isArabic) => isArabic ? projectAr : projectEn;
}

class AssessmentData {
  /// Canonical evaluation order for scoring & tie-breaking:
  /// matches `const order = Object.keys(scores)` in Assessment.jsx
  static const List<String> scoringOrder = [
    'frontend',
    'backend',
    'data',
    'cybersecurity',
    'uiux',
    'mobile',
  ];

  /// Career Path Registry matching pathsData.js
  static const Map<String, CareerPathInfo> paths = {
    'frontend': CareerPathInfo(
      id: 'frontend',
      number: '01',
      titleEn: 'Frontend Development',
      titleAr: 'تطوير واجهات المواقع',
      symbol: '⌘',
      category: 'DEVELOPMENT',
      personalityTypeEn: '🎨 The Visual Creator',
      personalityTypeAr: '🎨 المبدع البصري (The Visual Creator)',
      personalitySummaryEn:
          'You love seeing ideas turn into visible reality immediately. You have an eye for beauty, enjoy experimenting, and care deeply about how users interact with what you build.',
      personalitySummaryAr:
          'أنت شخص بصري بتحب تشوف أفكارك حية وبتتحرك قدام عينك فوراً! عندك حس جمالي وتنسيقي، وبتفرح جداً لما الناس تنبهر بتجربة استخدام حاجة صنعتها بنفسك.',
      shortDescEn:
          'Turn designs into interactive websites and experiences that people love to use.',
      shortDescAr:
          'حوّل التصميمات لمواقع تفاعلية وتجارب ممتعة للمستخدمين.',
      descriptionEn:
          'Build the visual and interactive parts of websites. You will work with layouts, styling, browser behavior, accessibility, and user interactions.',
      descriptionAr:
          'هتتعلم تبني الجزء اللي المستخدم بيشوفه وبيتفاعل معاه في المواقع، من التصميم وتنسيق الصفحات لحد التفاعلات وإمكانية الوصول.',
      skillsEn: [
        'HTML',
        'CSS',
        'JavaScript',
        'Git & GitHub',
        'Responsive Design',
      ],
      skillsAr: [
        'HTML',
        'CSS',
        'JavaScript',
        'Git وGitHub',
        'تصميم مناسب لكل الشاشات',
      ],
      roadmapEn: [
        'Learn HTML structure and semantic elements',
        'Practice CSS layouts, Flexbox, and Grid',
        'Learn JavaScript fundamentals and DOM',
        'Build responsive projects',
        'Publish projects and create a portfolio',
      ],
      roadmapAr: [
        'اتعلم أساسيات HTML وبناء الصفحات',
        'اتدرب على CSS وFlexbox وGrid',
        'اتعلم JavaScript والتعامل مع عناصر الصفحة',
        'نفّذ مشاريع مناسبة للموبايل والكمبيوتر',
        'انشر مشاريعك واعمل Portfolio',
      ],
      projectEn:
          'Build a responsive personal landing page with a working navigation menu.',
      projectAr:
          'اعمل صفحة شخصية متجاوبة مع الموبايل والكمبيوتر وفيها قائمة تنقل شغالة.',
    ),
    'backend': CareerPathInfo(
      id: 'backend',
      number: '02',
      titleEn: 'Backend Development',
      titleAr: 'تطوير الأنظمة الخلفية',
      symbol: '{ }',
      category: 'DEVELOPMENT',
      personalityTypeEn: '⚙️ The Mastermind Architect',
      personalityTypeAr: '⚙️ العقل المدبر والمهندس (The Mastermind)',
      personalitySummaryEn:
          'You love logic, puzzles, and behind-the-scenes systems. You don\'t need the spotlight; you take pride in building rock-solid engines that keep everything running without failure.',
      personalitySummaryAr:
          'أنت \'المايسترو\' اللي ورا الستارة! عقليتك منطقية ومرتبة، بتحب تفكك المشاكل المعقدة وتفهم الآلية الدقيقة للأنظمة، ومصدر فخرك إن المحرك شغال بدقة وسرعة من غير غلطة.',
      shortDescEn:
          'Build the logic, APIs, and systems that make applications work behind the scenes.',
      shortDescAr:
          'ابني المنطق والـ APIs والأنظمة اللي بتشغّل التطبيقات من ورا الكواليس.',
      descriptionEn:
          'Build the logic behind applications, handle data, create APIs, manage authentication, and learn how servers communicate with other systems.',
      descriptionAr:
          'هتتعلم تبني المنطق اللي بيشغّل التطبيقات، وتتعامل مع البيانات والـ APIs وتسجيل الدخول وطريقة تواصل السيرفرات.',
      skillsEn: [
        'Programming',
        'HTTP & APIs',
        'Databases',
        'Authentication',
        'Git',
      ],
      skillsAr: [
        'البرمجة',
        'HTTP وAPIs',
        'قواعد البيانات',
        'تسجيل الدخول والصلاحيات',
        'Git',
      ],
      roadmapEn: [
        'Choose one backend language',
        'Learn variables, functions, and OOP',
        'Understand HTTP and REST APIs',
        'Learn SQL and database basics',
        'Build and deploy a small API',
      ],
      roadmapAr: [
        'اختار لغة برمجة مناسبة',
        'اتعلم المتغيرات والدوال وOOP',
        'افهم HTTP وREST APIs',
        'اتعلم SQL وأساسيات قواعد البيانات',
        'اعمل API صغيرة وانشرها',
      ],
      projectEn:
          'Build a task management API with create, update, delete, and list operations.',
      projectAr:
          'اعمل API لإدارة المهام فيها إضافة وتعديل وحذف وعرض المهام.',
    ),
    'data': CareerPathInfo(
      id: 'data',
      number: '03',
      titleEn: 'Data Analysis',
      titleAr: 'تحليل البيانات',
      symbol: '▥',
      category: 'DATA & AI',
      personalityTypeEn: '📊 The Strategic Detective',
      personalityTypeAr: '📊 المحقق والمحلل الذكي (The Detective)',
      personalitySummaryEn:
          'You\'re curious, observant, and love evidence. When others see confusing tables, you see stories, hidden patterns, and golden insights that change outcomes.',
      personalitySummaryAr:
          'أنت محقق بطبعك! عينك بتلقط الأنماط اللي محدش شايفها، مبتاخدش القرارات بالبركة وإنما بالأدلة والحقائق، وبتحب تحوّل الأرقام لخطة عمل ذكية تكسب وتفرق.',
      shortDescEn:
          'Turn raw data into useful insights that help people and businesses make better decisions.',
      shortDescAr:
          'حوّل البيانات لأفكار واضحة تساعد الأفراد والشركات ياخدوا قرارات أحسن.',
      descriptionEn:
          'Use data to answer questions, spot trends, create reports, and help teams make evidence-based decisions.',
      descriptionAr:
          'هتستخدم البيانات عشان تجاوب عن الأسئلة، وتكتشف الأنماط، وتعمل تقارير تساعد الشركات تاخد قرارات مبنية على معلومات.',
      skillsEn: [
        'Excel',
        'SQL',
        'Data Cleaning',
        'Power BI',
        'Basic Statistics',
      ],
      skillsAr: [
        'Excel',
        'SQL',
        'تنظيف البيانات',
        'Power BI',
        'أساسيات الإحصاء',
      ],
      roadmapEn: [
        'Learn spreadsheet formulas and tables',
        'Practice cleaning and organizing data',
        'Learn SQL queries',
        'Build dashboards in Power BI',
        'Create a complete analysis project',
      ],
      roadmapAr: [
        'اتعلم معادلات وجداول Excel',
        'اتدرب على تنظيف وتنظيم البيانات',
        'اتعلم استعلامات SQL',
        'اعمل Dashboards باستخدام Power BI',
        'نفّذ مشروع تحليل بيانات كامل',
      ],
      projectEn:
          'Analyze a sample sales dataset and create a dashboard showing revenue and product trends.',
      projectAr:
          'حلل بيانات مبيعات تجريبية واعمل Dashboard توضح الإيرادات والمنتجات الأكثر مبيعًا.',
    ),
    'cybersecurity': CareerPathInfo(
      id: 'cybersecurity',
      number: '04',
      titleEn: 'Cybersecurity',
      titleAr: 'الأمن السيبراني',
      symbol: '⌑',
      category: 'SECURITY',
      personalityTypeEn: '🛡️ The Digital Guardian',
      personalityTypeAr: '🛡️ الحارس والمدافع الرقمي (The Guardian)',
      personalitySummaryEn:
          'You\'re naturally cautious, perceptive, and love solving puzzles before trouble happens. You question assumptions and take pride in protecting people and critical systems.',
      personalitySummaryAr:
          'حسّك الأمني عالي وسابق بخطوتين! بتلاحظ الثغرات ونقاط الضعف اللي الناس بتعديها، وشغفك هو التحدي وحماية الأنظمة وبيانات الناس من أي خطر ممكن يهددهم.',
      shortDescEn:
          'Understand digital threats and learn how to protect systems, networks, and information.',
      shortDescAr:
          'افهم التهديدات الرقمية واتعلم إزاي تحمي الأنظمة والشبكات والمعلومات.',
      descriptionEn:
          'Learn how digital systems are attacked and defended, understand networks and operating systems, and practice security in authorized lab environments.',
      descriptionAr:
          'هتتعلم الأنظمة بتتعرض للهجمات إزاي وبتتحمى إزاي، وتفهم الشبكات وأنظمة التشغيل، وتتدرب في بيئات آمنة ومصرح بيها.',
      skillsEn: [
        'Networking',
        'Linux',
        'Security Fundamentals',
        'Log Analysis',
        'Ethical Practice',
      ],
      skillsAr: [
        'الشبكات',
        'Linux',
        'أساسيات الأمن',
        'تحليل السجلات',
        'التدريب الأخلاقي',
      ],
      roadmapEn: [
        'Learn computer and networking fundamentals',
        'Practice Linux commands',
        'Understand common security concepts',
        'Use beginner-friendly security labs',
        'Document your findings and defensive steps',
      ],
      roadmapAr: [
        'اتعلم أساسيات الكمبيوتر والشبكات',
        'اتدرب على أوامر Linux',
        'افهم مفاهيم الأمن السيبراني الأساسية',
        'استخدم معامل تدريب للمبتدئين',
        'وثّق اللي اكتشفته وطرق الحماية',
      ],
      projectEn:
          'Create a home-lab security checklist and analyze sample system logs in a legal practice environment.',
      projectAr:
          'اعمل قائمة مراجعة لأمان جهازك وحلل سجلات تجريبية داخل بيئة تدريب آمنة.',
    ),
    'uiux': CareerPathInfo(
      id: 'uiux',
      number: '05',
      titleEn: 'UI/UX Design',
      titleAr: 'تصميم تجربة وواجهة المستخدم',
      symbol: '✳',
      category: 'DESIGN',
      personalityTypeEn: '💡 The Human-Centered Empath',
      personalityTypeAr: '💡 المصمم الإنساني والمبتكر (The Empath)',
      personalitySummaryEn:
          'You care deeply about people, psychology, and simplicity. You get frustrated by bad design and love crafting digital experiences that feel intuitive, welcoming, and effortless.',
      personalitySummaryAr:
          'بتفهم شعور الناس واحتياجاتهم حتى لو مقالوش! بتكره التعقيد واللف والدوران، وهدفك تصمم شاشات مريحة وسهلة تخلّي أي شخص ينجز اللي عايزه بابتسامة وبدون حيرة.',
      shortDescEn:
          'Design digital products that look great, feel intuitive, and solve real user problems.',
      shortDescAr:
          'صمّم منتجات رقمية شكلها حلو وسهلة الاستخدام وبتحل مشاكل حقيقية.',
      descriptionEn:
          'Research user needs, organize information, design interfaces, create prototypes, and test how easily people can complete tasks.',
      descriptionAr:
          'هتتعلم تفهم احتياجات المستخدمين، وتنظم المعلومات، وتصمم الواجهات، وتعمل نماذج تجريبية وتختبر سهولة الاستخدام.',
      skillsEn: [
        'User Research',
        'Wireframes',
        'Figma',
        'Prototyping',
        'Usability Testing',
      ],
      skillsAr: [
        'أبحاث المستخدم',
        'Wireframes',
        'Figma',
        'النماذج التفاعلية',
        'اختبار سهولة الاستخدام',
      ],
      roadmapEn: [
        'Learn UI and UX fundamentals',
        'Practice user research and personas',
        'Create wireframes',
        'Design screens and prototypes in Figma',
        'Test and improve a small product',
      ],
      roadmapAr: [
        'اتعلم أساسيات UI وUX',
        'اتدرب على أبحاث المستخدم وتحديد احتياجاته',
        'اعمل Wireframes',
        'صمم شاشات ونماذج على Figma',
        'اختبر منتج صغير وحسّنه',
      ],
      projectEn:
          'Redesign a simple university app screen and create a clickable Figma prototype.',
      projectAr:
          'أعد تصميم شاشة بسيطة لتطبيق جامعة واعمل نموذج تفاعلي على Figma.',
    ),
    'mobile': CareerPathInfo(
      id: 'mobile',
      number: '06',
      titleEn: 'Mobile Development',
      titleAr: 'تطوير تطبيقات الموبايل',
      symbol: '▣',
      category: 'DEVELOPMENT',
      personalityTypeEn: '📱 The Practical Pocket-Builder',
      personalityTypeAr: '📱 صانع حلول الجيب العملية (The App Builder)',
      personalitySummaryEn:
          'You are practical, fast-paced, and live on your smartphone. You love building tools that people carry everywhere in their pockets to solve daily challenges on the go.',
      personalitySummaryAr:
          'أنت عملي وحركي ومفارقش الموبايل! بتحب الحلول الفورية والمفيدة، وأعظم إنجاز عندك إنك تبني تطبيق يحطه ملايين الناس في جيبهم وينقذ يومهم بلمسة واحدة.',
      shortDescEn:
          'Create mobile apps that help people get things done, right from their phones.',
      shortDescAr:
          'طوّر تطبيقات موبايل بتساعد الناس تنجز احتياجاتها من خلال موبايلها.',
      descriptionEn:
          'Build applications for phones and tablets, create interfaces, handle user input, connect APIs, and learn how mobile apps manage data.',
      descriptionAr:
          'هتتعلم تبني تطبيقات للموبايل والتابلت، وتصمم الواجهات، وتتعامل مع إدخال المستخدم، وتربط التطبيق بالـ APIs والبيانات.',
      skillsEn: [
        'Dart',
        'Flutter',
        'Widgets',
        'Navigation',
        'APIs',
      ],
      skillsAr: [
        'Dart',
        'Flutter',
        'Widgets',
        'التنقل بين الشاشات',
        'APIs',
      ],
      roadmapEn: [
        'Learn programming fundamentals and Dart',
        'Understand Flutter widgets and layouts',
        'Build navigation between screens',
        'Connect an app to an API',
        'Create and test a complete small app',
      ],
      roadmapAr: [
        'اتعلم أساسيات البرمجة وDart',
        'افهم Widgets وLayouts في Flutter',
        'اعمل تنقل بين الشاشات',
        'اربط التطبيق بـ API',
        'نفّذ تطبيق صغير كامل واختبره',
      ],
      projectEn:
          'Build a simple habit tracker with multiple screens and saved tasks.',
      projectAr:
          'اعمل تطبيق بسيط لمتابعة العادات فيه أكتر من شاشة وحفظ للمهام.',
    ),
  };

  /// Canonical 15 Questions matching quizQuestions.js exactly
  static const List<QuizQuestion> questions = [
    QuizQuestion(
      id: 0,
      titleEn: 'When you enter a new cafe or place, what catches your eye first?',
      titleAr: 'لما بتدخل كافيه أو مكان جديد، إيه أول حاجة عينك بتلاحظها؟',
      subtitleEn: 'Pick your first natural reaction.',
      subtitleAr: 'اختار رد فعلك التلقائي الأول.',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '🎨',
          labelEn: 'The aesthetics, colors, lighting, and how stylish the place looks',
          labelAr: 'الديكور والألوان، والإضاءة والتنسيق اللي يفتح النفس',
        ),
        QuizOption(
          value: 'backend',
          symbol: '⚙️',
          labelEn: 'How the place operates: the cashier system, workflow, and speed',
          labelAr: 'السيستم شغال إزاي، وسرعة خدمة الطلبات وتنظيم الكاشير من جوة',
        ),
        QuizOption(
          value: 'data',
          symbol: '📊',
          labelEn: 'The crowd, best-selling drinks, and what time is the busiest',
          labelAr: 'معدل الزباين، وأكتر مشروب الناس بتطلبه وليه المبيعات زايدة هنا',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🛡️',
          labelEn: 'Security cameras, the open Wi-Fi network, and how safe the place is',
          labelAr: 'كاميرات المراقبة، وشبكة الـ Wi-Fi المفتوحة وإزاي المكان متأمن',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '💡',
          labelEn: 'Is the menu easy to read or confusing? Can people order comfortably?',
          labelAr: 'المنيو هل واضح ولا معقد؟ وهل الزبون بيلف حوالين نفسه عشان يطلب؟',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '📱',
          labelEn: 'Do they have an app for ordering and loyalty points from my phone?',
          labelAr: 'هل عندهم أبلكيشن لطلب الأوردر والدفع بالنقاط من الموبايل؟',
        ),
      ],
    ),
    QuizQuestion(
      id: 1,
      titleEn: 'When you play games or pass the time, which type hooks you most?',
      titleAr: 'لما تحب تلعب أو تسلّي وقتك، أنهي نوع ألعاب بتنجذب له أكتر؟',
      subtitleEn: 'What kind of challenge brings you joy?',
      subtitleAr: 'أنهي نوع تحدي بيبسطك ويشد انتباهك؟',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '✨',
          labelEn: 'Games with stunning graphics, fluid animations, and visual spectacle',
          labelAr: 'الألعاب اللي جرافيكسها خيالي وتصميمها مبهر وحركتها ممتعة للعين',
        ),
        QuizOption(
          value: 'backend',
          symbol: '🧩',
          labelEn: 'Complex strategy, building cities, management, and resource networks',
          labelAr: 'ألعاب التخطيط والبناء وإدارة الموارد وبناء مدن ومصانع معقدة',
        ),
        QuizOption(
          value: 'data',
          symbol: '🔍',
          labelEn: 'Puzzle, Sudoku, mystery investigations, and connecting clues to win',
          labelAr: 'ألعاب الألغاز والأرقام والـ Sudoku وربط الخيوط للوصول للحل',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🕵️',
          labelEn: 'Escape rooms, cracking hidden codes, and exposing enemy traps',
          labelAr: 'ألعاب غرف الهروب (Escape Rooms) وفك الشفرات وكشف الفخاخ المستخبية',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '🤝',
          labelEn: 'Interactive story games driven by character choices and emotions',
          labelAr: 'ألعاب القصة التفاعلية اللي معتمدة على مشاعر وسلوك الشخصيات',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '⚡',
          labelEn: 'Snappy, addictive mobile games you can play anywhere with one finger',
          labelAr: 'الألعاب السريعة الخفيفة على الموبايل اللي بتتلعب في المواصلات بلمسة واحدة',
        ),
      ],
    ),
    QuizQuestion(
      id: 2,
      titleEn: 'When you face a real-life problem or puzzle, what\'s your style?',
      titleAr: 'لما بتقابلك مشكلة أو لغز في حياتك، إيه أسلوبك الطبيعي في الحل؟',
      subtitleEn: 'How does your brain naturally think?',
      subtitleAr: 'دماغك بتشتغل إزاي بشكل تلقائي؟',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '🎨',
          labelEn: 'I love to experiment right away and see visual results step by step',
          labelAr: 'بحب أجرب وأشوف النتيجة قدام عيني فوراً وأعدل خطوة بخطوة',
        ),
        QuizOption(
          value: 'backend',
          symbol: '⚙️',
          labelEn: 'I break it down into root causes and build a logical step-by-step plan',
          labelAr: 'بقعد مع نفسي أحلل أصل المشكلة وأرتب خطوات منطقية 1، 2، 3',
        ),
        QuizOption(
          value: 'data',
          symbol: '📊',
          labelEn: 'I gather facts, compare clues, and make a decision based on evidence',
          labelAr: 'بجمع كل الحقائق والمعلومات والأدلة الأول عشان أقارن وأقرر صح',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🛡️',
          labelEn: 'I look for hidden loopholes or things everyone else missed',
          labelAr: 'بدور على الثغرة الخفية أو الغلطة اللي محدش واخد باله منها',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '💡',
          labelEn: 'I listen to everyone\'s needs to find a solution that makes life easier',
          labelAr: 'بسأل الناس وأفهم وجهات نظرهم عشان ألاقي حل يريّح الكل',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '📱',
          labelEn: 'I look for a practical, fast shortcut that gets it done with one click',
          labelAr: 'بدور على حل عملي وسريع يخلص الموضوع بضغطة زرار من مكاني',
        ),
      ],
    ),
    QuizQuestion(
      id: 3,
      titleEn: 'What does your desk or phone/computer screen look like?',
      titleAr: 'شكل مكتبك أو شاشة موبايلك ولابتوبك عامل إزاي؟',
      subtitleEn: 'Your personal space tells your story.',
      subtitleAr: 'مساحتك الخاصة بتعبر عن طريقتك.',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '✨',
          labelEn: 'Stylish lighting, aesthetic wallpaper matched with keyboard colors',
          labelAr: 'شياكة وإضاءة رايقة وخلفية شاشة متناسقة جداً مع ألوان جهازي',
        ),
        QuizOption(
          value: 'backend',
          symbol: '🧩',
          labelEn: 'Clean, strictly named folders with everything organized in its place',
          labelAr: 'فولدرات متسمية بدقة، وكل ملف منظم ومحطوط في مكانه الصحيح',
        ),
        QuizOption(
          value: 'data',
          symbol: '🔍',
          labelEn: 'Color-coded notes, lists, to-do trackers, and budget spreadsheets',
          labelAr: 'نوتس وقوائم وجداول لمصاريفي ومهامي وأهدافي مترتبة بوضوح',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🕵️',
          labelEn: 'Privacy screens, camera covers, 2FA enabled, and complex passwords',
          labelAr: 'برامج حماية، متصفح خاص، مصادقة ثنائية، ولاصقة على الكاميرا للخصوصية',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '🤝',
          labelEn: 'Minimalist and ergonomic so anything I need is within arm\'s reach',
          labelAr: 'مريح ونظيف ومصمم بحيث أي حاجة محتاجها أطولها في ثانية بدون مجهود',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '⚡',
          labelEn: 'Smart widgets, handy shortcuts, and quick toggles on the home screen',
          labelAr: 'اختصارات سريعة وWidgets ذكية على شاشة الموبايل تنجزني بلمسة',
        ),
      ],
    ),
    QuizQuestion(
      id: 4,
      titleEn: 'What annoys you the most when using any website or app?',
      titleAr: 'إيه أكتر حاجة ممكن تعصبك وتستفزك في أي موقع أو تطبيق؟',
      subtitleEn: 'What makes you want to close the screen immediately?',
      subtitleAr: 'إيه اللي يخليك تقفل الشاشة ومتفتحهاش تاني؟',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '🎨',
          labelEn: 'Ugly clashing colors, bad fonts, or buttons that don\'t react smoothly',
          labelAr: 'ألوان مش متناسقة، خطوط بايظة، أو زراير مش شغالة ومش متجاوبة',
        ),
        QuizOption(
          value: 'backend',
          symbol: '⚙️',
          labelEn: 'The server crashing, endless loading loops, or losing my saved data',
          labelAr: 'السيرفر يقع فجأة، أو التحميل يهنّج والبيانات تضيع بعد ما كتبتها!',
        ),
        QuizOption(
          value: 'data',
          symbol: '📊',
          labelEn: 'Pointless numbers, misleading graphs, or random advice with no logic',
          labelAr: 'أرقام وإحصائيات عشوائية ملهاش معنى ولا بتفيد بحاجة في اتخاذ قرار',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🛡️',
          labelEn: 'Weak passwords allowed, shady links, or feeling my data isn\'t safe',
          labelAr: 'موقع يطلب باسورد ضعيف أو تحسه مش آمن وممكن يسرب بياناتك',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '💡',
          labelEn: 'Going through 30 pages just to do one simple task',
          labelAr: 'ألف في ميت صفحة عشان أعمل حاجة تافهة كان ممكن تخلص في خطوة',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '📱',
          labelEn: 'A heavy, laggy app that drains the battery and freezes on my phone',
          labelAr: 'أبلكيشن تقيل وبيهنج البطارية ومش سلس في الاستخدام اليومي',
        ),
      ],
    ),
    QuizQuestion(
      id: 5,
      titleEn: 'If you could have a superpower for a day, what would you pick?',
      titleAr: 'لو هتختار قوة خارقة ليوم واحد، تحب تكون إيه؟',
      subtitleEn: 'Choose the dream ability that excites you most.',
      subtitleAr: 'اختار القدرة اللي تحس إنها بتمثلك أكتر.',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '✨',
          labelEn: 'Transform any imagination into a dazzling, animated visible reality',
          labelAr: 'أحوّل أي فكرة في خيالي لمجسم واقعي مرئي فائق الجمال والحركة',
        ),
        QuizOption(
          value: 'backend',
          symbol: '🧩',
          labelEn: 'Control all the world\'s engines and systems to run in flawless harmony',
          labelAr: 'اتحكم في كل محركات وأنظمة العالم واخليها تشتغل بتناغم تام وسرعة',
        ),
        QuizOption(
          value: 'data',
          symbol: '🔍',
          labelEn: 'Predict future event probabilities with razor-sharp mathematical accuracy',
          labelAr: 'أعرف احتمالية ونسبة حدوث أي حاجة في المستقبل بالأرقام والنسب الدقيقة',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🕵️',
          labelEn: 'Detect lies, spot invisible traps, and uncover any hidden conspiracy',
          labelAr: 'كشف الخداع والأكاذيب واكتشاف أي فخ أو ثغرة مستخبية قبل فوات الأوان',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '🤝',
          labelEn: 'Telepathically feel what others need and make their lives effortless',
          labelAr: 'أحس بما يدور في قلوب الناس وعقولهم وأخلّي حياتهم خالية من المعاناة',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '⚡',
          labelEn: 'Instantly teleport anywhere on earth in a split second at a whim',
          labelAr: 'التنقل الفوري في ثانية لأي مكان في العالم بدون مجهود وبضغطة زر',
        ),
      ],
    ),
    QuizQuestion(
      id: 6,
      titleEn: 'When planning a road trip with friends, what\'s your natural role?',
      titleAr: 'لما تطلعوا سفرية أو خروجة مع أصحابك، إيه دورك التلقائي؟',
      subtitleEn: 'What task do you naturally take charge of?',
      subtitleAr: 'إيه الجزء اللي بتلاقي نفسك مسكته تلقائياً؟',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '🎨',
          labelEn: 'Picking picture-perfect scenic spots, photo angles, and editing reels',
          labelAr: 'اختيار الأماكن اللي تصويرها شيك وتظبيط الصور والستوريز وتنسيق الأفكار',
        ),
        QuizOption(
          value: 'backend',
          symbol: '⚙️',
          labelEn: 'Mapping the route itinerary, booking transportation, and hotel logistics',
          labelAr: 'تظبيط خط السير والمواعيد وحجز المواصلات والإقامة بالتفصيل',
        ),
        QuizOption(
          value: 'data',
          symbol: '📊',
          labelEn: 'Comparing prices, budgeting costs, and splitting expenses down to the cent',
          labelAr: 'مقارنة الأسعار وحساب ميزانية السفر ومصروف كل فرد بدقة بالمليم',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🛡️',
          labelEn: 'Making sure the route is safe, keeping emergency kits, and verifying reservations',
          labelAr: 'التأكد من أمان الطريق ووجود حقيبة إسعافات وضمان كل الحجوزات الرسمية',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '💡',
          labelEn: 'Asking everyone their preferences to ensure every single person feels happy',
          labelAr: 'سؤال الكل والتأكد إن كل فرد في الرحلة مبسوط ومرتاح ومفيش حد متضايق',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '📱',
          labelEn: 'Holding the GPS, ordering food delivery on the road, and tracking stops via apps',
          labelAr: 'متابع الـ GPS وأبلكيشنز الأكل والتوصيل ومشيّل الكل من الموبايل',
        ),
      ],
    ),
    QuizQuestion(
      id: 7,
      titleEn: 'What element makes a movie or series truly unforgettable for you?',
      titleAr: 'إيه أكتر عنصر بيخليك مبهور بأي فيلم أو مسلسل بتتفرج عليه؟',
      subtitleEn: 'What grabs your heart and attention?',
      subtitleAr: 'إيه اللي يخليك تقول \'الفيلم ده عظيم\'؟',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '✨',
          labelEn: 'Cinematography, color grading, stunning CGI, and costume design',
          labelAr: 'زوايا التصوير، الألوان، المؤثرات البصرية، والأزياء المبهرة',
        ),
        QuizOption(
          value: 'backend',
          symbol: '🧩',
          labelEn: 'The masterfully engineered plot with airtight logic and zero plot holes',
          labelAr: 'حبكة القصة المحبوكة بذكاء، وتربيط الخيوط من غير ولا غلطة درامية',
        ),
        QuizOption(
          value: 'data',
          symbol: '🔍',
          labelEn: 'Deductive detective mysteries where subtle clues piece together the truth',
          labelAr: 'الغموض والتحقيقات والأدلة اللي بتكشف لغز الجريمة خطوة بخطوة',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🕵️',
          labelEn: 'Espionage, hacking, intelligence warfare, and counter-surveillance',
          labelAr: 'قصص الجاسوسية، القرصنة، والاختراقات والمعارك الاستخباراتية المشوقة',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '🤝',
          labelEn: 'Deep human empathy, character psychology, and genuine emotional dilemmas',
          labelAr: 'المشاعر الإنسانية الصادقة، وعلم النفس وتطور سلوك الشخصيات بواقعية',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '⚡',
          labelEn: 'Fast-paced, non-stop thrill that never drags and binge-watches effortlessly',
          labelAr: 'الإيقاع السريع الممتع اللي مفيش فيه ولا دقيقة ملل وتخلصه في جلسة واحدة',
        ),
      ],
    ),
    QuizQuestion(
      id: 8,
      titleEn: 'What do your close friends always come to you for?',
      titleAr: 'أصحابك والناس القريبة منك بيلجأوا لك في إيه دايماً؟',
      subtitleEn: 'Your natural role among people who know you.',
      subtitleAr: 'دورك الطبيعي وسط شلتك والناس اللي حواليك.',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '🎨',
          labelEn: 'Your taste in design, arranging ideas, photos, and matching aesthetics',
          labelAr: 'ذوقك العالي في الصور والألوان، وتنسيق أي فكرة بشكل شيك',
        ),
        QuizOption(
          value: 'backend',
          symbol: '⚙️',
          labelEn: 'Organizing complicated plans, fixing glitches, and figuring out how things work',
          labelAr: 'تخطيط المشاوير المعقدة، وتصليح أي حاجة عطلانة وفهم آليتها',
        ),
        QuizOption(
          value: 'data',
          symbol: '📊',
          labelEn: 'Comparing prices, analyzing choices, and calculating the best deal',
          labelAr: 'مقارنة الأسعار والعروض، وتحليل أي اختيار قبل ما يشتروا',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🛡️',
          labelEn: 'Recovering locked accounts, tech security tips, or checking suspicious links',
          labelAr: 'حماية حساباتهم واسترجاعها، أو التأكد من أي لينك مشبوه وصلهم',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '💡',
          labelEn: 'Venting to you because you listen, understand, and simplify their stress',
          labelAr: 'بيفضفضوا لك عشان بتفهم شعورهم وبتعرف تبسّط عليهم المواقف الصعبة',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '📱',
          labelEn: 'Recommending cool new apps and life hacks that make phone life easier',
          labelAr: 'ترشيح أحسن برامج وأدوات تسهّل عليهم حياتهم على التليفون',
        ),
      ],
    ),
    QuizQuestion(
      id: 9,
      titleEn: 'When shopping for a new smartphone or laptop, how do you decide?',
      titleAr: 'لما تيجي تشتري لابتوب أو موبايل جديد، إيه طريقتك في الاختيار؟',
      subtitleEn: 'What spec matters most to your personality?',
      subtitleAr: 'إيه أهم ميزة بتدور عليها الأول؟',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '✨',
          labelEn: 'The screen quality, color fidelity, OLED vibrancy, and sleek build',
          labelAr: 'جودة الشاشة ونقاء الألوان وشياكة التصميم وخامات الجهاز الفخمة',
        ),
        QuizOption(
          value: 'backend',
          symbol: '🧩',
          labelEn: 'The CPU/GPU architecture, RAM capacity, and sustained multi-core benchmark',
          labelAr: 'قوة المعالج والرامات وسرعة الهارد وكفاءة الأداء العالي تحت الضغط',
        ),
        QuizOption(
          value: 'data',
          symbol: '🔍',
          labelEn: 'Comparing 10 in-depth review charts, price-to-performance graphs, and specs',
          labelAr: 'بفتح مراجعات ومقارنات بالأرقام والإحصائيات والأسعار قبل ما أدفع قرش',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🕵️',
          labelEn: 'Hardware security chips, fingerprint privacy, biometric safety, and OS support',
          labelAr: 'مستوى الأمان، دعم التحديثات الطويلة، وتشفير البصمة والخصوصية العالية',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '🤝',
          labelEn: 'How intuitive the OS feels, single-handed ergonomics, and daily comfort',
          labelAr: 'سهولة الواجهة وسلاسة النظام وهل مريح في الاستخدام بإيد واحدة',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '⚡',
          labelEn: 'Battery life that lasts 2 full days, fast charging, pocketability, and portability',
          labelAr: 'حجمه مناسب للجيب، بطاريته تقعد يومين، ويدعم كل التطبيقات بمرونة',
        ),
      ],
    ),
    QuizQuestion(
      id: 10,
      titleEn: 'If you authored a bestselling book, what would it be about?',
      titleAr: 'لو هتألف كتاب ويكسر الدنيا في المبيعات، تحب موضوعه يكون إيه؟',
      subtitleEn: 'What topic represents your inner passion?',
      subtitleAr: 'إيه الشغف اللي حابب تنقله للناس؟',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '🎨',
          labelEn: 'The Psychology of Beauty: How Visual Design Shapes Human Perception',
          labelAr: 'سيكولوجية الجمال: كيف يغيّر التنسيق البصري والألوان نظرتنا للعالم',
        ),
        QuizOption(
          value: 'backend',
          symbol: '⚙️',
          labelEn: 'The Invisible Engines: How Grand Digital Architectures Power Civilization',
          labelAr: 'المحركات الخفية: كيف تدير الأنظمة العملاقة كوكب الأرض في صمت',
        ),
        QuizOption(
          value: 'data',
          symbol: '📊',
          labelEn: 'The Story Behind Numbers: Uncovering Human Behavior Through Data',
          labelAr: 'القصة وراء الأرقام: كيف تكشف البيانات والأنماط أسرار المستقبل',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🛡️',
          labelEn: 'Digital Fortresses: The Art of Ethical Defense in a Borderless World',
          labelAr: 'الحصن الرقمي: فن الحماية والدفاع الأخلاقي في عالم مليء بالاختراق',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '💡',
          labelEn: 'The Art of Simplicity: Designing a World That Anyone Can Effortlessly Navigate',
          labelAr: 'فن التبسيط: كيف تصنع منتجات وتجارب يحبها ويفهمها كل إنسان',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '📱',
          labelEn: 'Pocket Revolution: How Micro-Screens Conquered Modern Human Life',
          labelAr: 'ثورة الجيب: كيف غيّرت شاشات الموبايل الصغيرة نمط حياة البشر للأبد',
        ),
      ],
    ),
    QuizQuestion(
      id: 11,
      titleEn: 'If a friend proposes launching a startup, what\'s your first instinct?',
      titleAr: 'لو حد من صحابك قالك \'تعال نعمل بيزنس جديد\'، إيه أول فكرة هتقولها؟',
      subtitleEn: 'Where does your business mindset kick in?',
      subtitleAr: 'أول زاوية بتفكر فيها عشان المشروع ينجح:',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '✨',
          labelEn: 'Let\'s build an iconic visual identity and a website that dazzles investors',
          labelAr: 'نعمل براند شكله تحفة وموقع مبهر يجذب أي حد من أول نظرة',
        ),
        QuizOption(
          value: 'backend',
          symbol: '🧩',
          labelEn: 'Let\'s engineer the server infrastructure, database, and backend workflow first',
          labelAr: 'نضمن البنية التحتية والسيستم التقني والربط التلقائي للطلبات',
        ),
        QuizOption(
          value: 'data',
          symbol: '🔍',
          labelEn: 'Let\'s analyze market research, competitor analytics, and calculate profit margins',
          labelAr: 'ندرس السوق والمنافسين ونحلل أرقام الفئة المستهدفة ومعدل الربح المتوقع',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🕵️',
          labelEn: 'Let\'s secure the intellectual property, payment gateway, and prevent fraud',
          labelAr: 'نتأكد من حماية الفكرة وبوابات الدفع وحسابات الشركة ضد السرقة والاحتيال',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '🤝',
          labelEn: 'Let\'s interview potential customers, map their pain points, and build a frictionless journey',
          labelAr: 'نعمل استبيان للعملاء ونفهم مشكلتهم الحقيقية ونبني تجربة سلسة تريحهم',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '⚡',
          labelEn: 'Let\'s launch an instant mobile app that delivers the service in one tap',
          labelAr: 'نعمل تطبيق سريع يوفر الخدمة للعميل بضغطة زر وهو قاعد في مكانه',
        ),
      ],
    ),
    QuizQuestion(
      id: 12,
      titleEn: 'What weekend activity recharges your energy the most?',
      titleAr: 'إيه النشاط اللي بتحس إنه بيفصلك ويجدد طاقتك تماماً في الإجازة؟',
      subtitleEn: 'Your ideal way to unwind and refresh.',
      subtitleAr: 'طريقتك المفضلة لتصفية ذهنك واستعادة نشاطك.',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '🎨',
          labelEn: 'Visiting an art gallery, photography, or cinematic video editing',
          labelAr: 'زيارة معرض فني، أو التصوير وتعديل فيديوهات بطريقة سينمائية جميلة',
        ),
        QuizOption(
          value: 'backend',
          symbol: '⚙️',
          labelEn: 'Assembling complex Lego sets, tinkering with gadgets, or mechanics',
          labelAr: 'تجميع قطع ليجو معقدة، أو فك وتركيب جهاز قديم وفهم إزاي شغال',
        ),
        QuizOption(
          value: 'data',
          symbol: '📊',
          labelEn: 'Diving into fascinating analytical documentaries, charts, or personal goal tracking',
          labelAr: 'مشاهدة وثائقيات تحليلية مشوقة، أو مراجعة أهدافي وجداول مصاريفي',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🛡️',
          labelEn: 'Reading true-crime investigations, cybersecurity lore, or solving security puzzles',
          labelAr: 'قراءة قصص تحقيقات بوليسية، أو استكشاف أسرار تكنولوجية غير معروفة',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '💡',
          labelEn: 'Having a deep coffee chat with empathetic friends about psychology and life',
          labelAr: 'قعدة رايقة مع أصحاب ونقاش ممتع عن سلوك الناس وعلم النفس وتجارب الحياة',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '📱',
          labelEn: 'Exploring hidden settings, new phone widgets, and automation life hacks',
          labelAr: 'استكشاف تريكات وتطبيقات جديدة في التليفون تختصر مهامي اليومية',
        ),
      ],
    ),
    QuizQuestion(
      id: 13,
      titleEn: 'When you notice a flaw in an everyday object, what do you think?',
      titleAr: 'لما تلاحظ عيب أو لخبطة في حاجة بتستخدمها كل يوم، إيه فكرتك؟',
      subtitleEn: 'Your instinctive reaction to imperfection.',
      subtitleAr: 'أول شعور بيجيلك في اللحظة دي:',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '✨',
          labelEn: 'I wish they chose harmonious proportions and nicer visual finishing',
          labelAr: '\'يا ريتهم خلوا الشكل متناسق أكتر، اللمسة البصرية هنا محتاجة تعديل\'',
        ),
        QuizOption(
          value: 'backend',
          symbol: '🧩',
          labelEn: 'This failure happened because the underlying foundation was poorly engineered',
          labelAr: '\'الخلل ده سببه سوء في التأسيس أو ربط المنظومة الميكانيكية من الأساس\'',
        ),
        QuizOption(
          value: 'data',
          symbol: '🔍',
          labelEn: 'How many thousands of people suffered this? What is the failure percentage?',
          labelAr: '\'ياترى العيب ده اتكرر كام مرة؟ وإيه النسبة المئوية للمتضررين منه؟\'',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🕵️',
          labelEn: 'This is a dangerous loophole; someone with bad intentions could exploit it!',
          labelAr: '\'دي ثغرة خطيرة وممكن حد يستغلها بدون إذن ويضر الناس أو المكان!\'',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '🤝',
          labelEn: 'It hurts to see people getting frustrated and struggling unnecessarily',
          labelAr: '\'حرام والله، الشخص البسيط اللي هيستخدم دي هيتعقد ويضيع وقته على الفاضي!\'',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '⚡',
          labelEn: 'Why isn\'t there an over-the-air update to patch this right from the phone?',
          labelAr: '\'ليه مفيش تحديث سريع ينزل على الموبايل يصلح الموضوع ده فوراً بلمسة؟\'',
        ),
      ],
    ),
    QuizQuestion(
      id: 14,
      titleEn: 'In the end, what kind of impact gives you the ultimate sense of fulfillment?',
      titleAr: 'في النهاية، إيه أعظم إحساس بالنجاح والتأثير تتمنى تحققه في شغلك؟',
      subtitleEn: 'What legacy motivates your soul?',
      subtitleAr: 'أنهي إنجاز يخليك فخور ومبسوط من قلبك؟',
      options: [
        QuizOption(
          value: 'frontend',
          symbol: '🎨',
          labelEn: 'People opening the product and being amazed by its sheer beauty and fluidity',
          labelAr: 'الناس تفتح الموقع وتنبهر بجمال تصميمه وسلاسة الحركة والتفاعل فيه',
        ),
        QuizOption(
          value: 'backend',
          symbol: '⚙️',
          labelEn: 'A bulletproof engine seamlessly handling millions of concurrent operations',
          labelAr: 'السيستم يشيل ملايين المستخدمين في نفس اللحظة بثبات ومن غير ولا غلطة',
        ),
        QuizOption(
          value: 'data',
          symbol: '📊',
          labelEn: 'Unearthing a brilliant hidden insight that transforms key decisions and profits',
          labelAr: 'أكتشف معلومة ذكية ومخفية تغيّر قرارات بيزنس وتكسب ملايين وتوفر هدر',
        ),
        QuizOption(
          value: 'cybersecurity',
          symbol: '🛡️',
          labelEn: 'Stopping a critical attack before it strikes, keeping countless people safe',
          labelAr: 'أكتشف ثغرة خطيرة قبل ما أي حد يستغلها وأحمي بيانات آلاف البشر من السرقة',
        ),
        QuizOption(
          value: 'uiux',
          symbol: '💡',
          labelEn: 'A user saying: \'This made my life so much easier and completely stress-free!\'',
          labelAr: 'مستخدم يقولي: \'التطبيق ده بجد سهّل عليا حياتي وحلّ مشكلتي بدون أي مجهود\'',
        ),
        QuizOption(
          value: 'mobile',
          symbol: '📱',
          labelEn: 'Spotting a stranger on the subway or street actively using my app on their phone',
          labelAr: 'أشوف شخص في المترو أو الشارع فاتح الأبلكيشن بتاعي وبيستخدمه كل يوم في حياته',
        ),
      ],
    ),
  ];

  /// Calculate career path scores based on user's 15 answers
  static Map<String, int> calculateScores(Map<int, String> answers) {
    final Map<String, int> scores = {
      'frontend': 0,
      'backend': 0,
      'data': 0,
      'cybersecurity': 0,
      'uiux': 0,
      'mobile': 0,
    };

    for (int i = 0; i < questions.length; i++) {
      final ans = answers[i];
      if (ans != null && scores.containsKey(ans)) {
        scores[ans] = scores[ans]! + 1;
      }
    }

    return scores;
  }

  /// Get CareerPathInfo by key or legacy title
  static CareerPathInfo getPath(String? key) {
    if (key == null) return paths['frontend']!;
    final lower = key.trim().toLowerCase();
    if (paths.containsKey(lower)) {
      return paths[lower]!;
    }
    for (final path in paths.values) {
      if (path.id.toLowerCase() == lower ||
          path.titleEn.toLowerCase() == lower ||
          path.titleAr.toLowerCase() == lower) {
        return path;
      }
    }
    if (lower.contains('mobile')) return paths['mobile']!;
    if (lower.contains('front')) return paths['frontend']!;
    if (lower.contains('back')) return paths['backend']!;
    if (lower.contains('data')) return paths['data']!;
    if (lower.contains('cyber') || lower.contains('security')) return paths['cybersecurity']!;
    if (lower.contains('design') || lower.contains('ui')) return paths['uiux']!;
    return paths['frontend']!;
  }

  /// Exact scoring & tie-breaking logic matching Assessment.jsx lines 56-60
  static String calculateRecommendation(Map<int, String> answers) {
    final scores = calculateScores(answers);
    return scoringOrder.reduce((best, key) {
      return (scores[key] ?? 0) > (scores[best] ?? 0) ? key : best;
    });
  }

  /// Calculates secondary career alternative (runner-up)
  static String calculateSecondaryCareer(Map<int, String> answers, String primary) {
    final scores = calculateScores(answers);
    final candidates = scoringOrder.where((k) => k != primary).toList();
    return candidates.reduce((best, key) {
      return (scores[key] ?? 0) > (scores[best] ?? 0) ? key : best;
    });
  }

  /// Dynamic match percentage based on user's actual answers (topScore / 15 * 100)
  static int calculateMatchPercentage(Map<int, String> answers, String recommendation) {
    final scores = calculateScores(answers);
    final count = scores[recommendation] ?? 0;
    if (count == 0) return 0;
    return ((count / questions.length) * 100).round();
  }
}
