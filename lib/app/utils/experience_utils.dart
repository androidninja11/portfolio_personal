class ExperienceUtils {
  final String name;
  final String icon;
  final List<String> tool;
  final String description;
  final String period;
  final String role;
  final String responsibilities;

  ExperienceUtils({
    required this.name,
    required this.icon,
    required this.description,
    required this.tool,
    required this.period,
    required this.role,
    required this.responsibilities,
  });
}

List<ExperienceUtils> experienceUtils = [
  ExperienceUtils(
    name: 'Grow Solutions',
    icon: 'assets/icons/android.svg',
    description: "Surat",
    period: "May 2024 – May 2025",
    role: "Sr. Android Developer",
    responsibilities: "Led the development of enterprise Android applications using modern architecture patterns. Implemented Jetpack Compose for UI development and managed the integration of various third-party services. Conducted code reviews and mentored junior developers. Collaborated with cross-functional teams to deliver high-quality mobile solutions.",
    tool: [
      'Jetpack Compose',
      'Kotlin Coroutines',
      'MVVM Architecture',
      'Dagger Hilt',
      'Room Database',
      'Retrofit',
      'Firebase Integration',
      'In-App Billing',
      'Push Notifications',
      'Git, GitHub',
    ],
  ),
  ExperienceUtils(
    name: 'YesQuest - Info. Technology',
    icon: 'assets/icons/android.svg',
    description: "Surat",
    period: "October 2023 – March 2024",
    role: "Sr. Android Developer",
    responsibilities: "Developed and maintained Android applications using MVVM architecture. Implemented real-time features using MQTT protocol for IoT applications. Optimized app performance and conducted regular code reviews. Worked closely with UI/UX team to implement design specifications.",
    tool: [
      'MVVM, Kotlin Coroutines',
      'Dagger-hilt',
      'Room-DB',
      'Jetpack Compose',
      'Figma',
      'ClickUp',
      'Bitbucket',
      'Sourcetree, Slack',
      'Event Bus Pattern',
      'MQTT - IoT Messaging',
    ],
  ),
  ExperienceUtils(
    name: 'Artoon Solutions Pvt. Ltd',
    icon: 'assets/icons/apple.svg',
    description: "Surat",
    period: "August 2018 – Oct 2023",
    role: "Android Developer (Lead)",
    responsibilities: "Led a team of Android developers in creating and maintaining multiple applications. Implemented payment integrations including GPay and in-app billing. Developed video streaming features using Vimeo and Zoom SDKs. Managed project timelines and coordinated with stakeholders.",
    tool: [
      'MVVM, Kotlin, Room-DB',
      'Crashlytics, Library Integration',
      'In-App billing subscription, GPay (UK)',
      'Retrofit, Fast Android Networking',
      'Git, GitHub, Asana',
      'Chrome Cast to android TV',
      'Vimeo Player integration',
      'Zoom Meeting Integration',
      'Socket.io',
      'Android (Kotlin and Java)',
    ],
  ),
  ExperienceUtils(
    name: 'Webglame Infotech LLP',
    icon: 'assets/icons/graphic.svg',
    description: "Navsari",
    period: "June 2017 - August 2018",
    role: "Android Developer",
    responsibilities: "Developed Android applications using Java and SQLite. Implemented Firebase services for authentication and push notifications. Created UI/UX designs following Material Design guidelines. Integrated REST APIs and third-party libraries.",
    tool: [
      'SQLite Database, Volley',
      'UI/UX Design: Material Design',
      'Push Notification, Firebase',
      'Photoshop',
      'API Integration',
      'Android Studio(Java)',
    ],
  ),
  ExperienceUtils(
    name: 'CRP Infrastructure Pvt. Ltd',
    icon: 'assets/icons/website.svg',
    description: "Surat",
    period: "August 2016 - May 2017",
    role: "Computer Operator",
    responsibilities: "Managed infrastructure tender documentation and processing. Created and edited promotional videos using Filmora and ProShow Producer. Handled data entry and documentation for construction projects.",
    tool: [
      'E-Tender (Infrastructure)',
      'Excel, Bridge/Building Tender filling',
      'Photoshop',
      'Wondershare - Filmora(Video Editing)',
      'ProShow Producer(Video Maker)',
    ],
  ),
];
