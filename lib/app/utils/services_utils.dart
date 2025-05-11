class ServicesUtils {
  final String name;
  final String icon;
  final List<ToolCategory> categories;
  final String description;
  final List<String> highlights;

  ServicesUtils({
    required this.name,
    required this.icon,
    required this.description,
    required this.categories,
    required this.highlights,
  });
}

class ToolCategory {
  final String name;
  final String icon;
  final List<String> tools;

  ToolCategory({
    required this.name,
    required this.icon,
    required this.tools,
  });
}

List<ServicesUtils> servicesUtils = [
  ServicesUtils(
    name: 'Android App Development',
    icon: 'assets/icons/android.svg',
    description: "Crafting modern Android applications with cutting-edge technologies and best practices. Specializing in beautiful UI/UX and robust architecture.",
    highlights: [
      'Modern UI with Material Design 3',
      'Clean Architecture & Best Practices',
      'Performance Optimization',
      'Secure Data Management',
      'Seamless Integration',
    ],
    categories: [
      ToolCategory(
        name: 'UI Development',
        icon: 'assets/icons/ui.svg',
        tools: [
          'Jetpack Compose UI',
          'Material Design 3',
          'Custom Animations',
          'Responsive Layouts',
          'Theme Management',
        ],
      ),
      ToolCategory(
        name: 'Core Development',
        icon: 'assets/icons/code.svg',
        tools: [
          'Kotlin & Coroutines',
          'MVVM Architecture',
          'Clean Code Practices',
          'Dependency Injection',
          'Unit Testing',
        ],
      ),
      ToolCategory(
        name: 'Data Management',
        icon: 'assets/icons/database.svg',
        tools: [
          'Room Database',
          'DataStore',
          'Firebase Services',
          'Retrofit & Networking',
          'Data Security',
        ],
      ),
      ToolCategory(
        name: 'Development Tools',
        icon: 'assets/icons/tools.svg',
        tools: [
          'CI/CD Pipeline',
          'Git Version Control',
          'Code Analysis',
          'Performance Profiling',
          'Automated Testing',
        ],
      ),
    ],
  ),
];
