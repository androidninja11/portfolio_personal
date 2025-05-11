import 'package:flutter/material.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/theme/app_theme.dart';
import 'package:mysite/core/util/size_helper.dart';
import 'package:sizer/sizer.dart';

class SkillsDesktop extends StatefulWidget {
  const SkillsDesktop({Key? key}) : super(key: key);

  @override
  State<SkillsDesktop> createState() => _SkillsDesktopState();
}

class _SkillsDesktopState extends State<SkillsDesktop> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int? _hoveredIndex;
  String? _hoveredSection;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills",
            style: TextStyle(
              fontSize: isFontSize(context, 20),
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
          ),
          Space.y(2.w)!,
          Text(
            "Android Development Expertise",
            style: TextStyle(
              fontSize: isFontSize(context, 30),
              fontWeight: FontWeight.bold,
              color: theme.textColor,
            ),
          ),
          Space.y(3.w)!,
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              gradient: theme.serviceCard,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildSkillsColumn(
                    title: "Core Development",
                    sectionKey: "core",
                    skills: [
                      {"name": "Android Studio", "level": 0.95},
                      {"name": "Java", "level": 0.9},
                      {"name": "Kotlin", "level": 0.85},
                      {"name": "MVVM Architecture", "level": 0.9},
                      {"name": "Room Database", "level": 0.85},
                      {"name": "Dagger Hilt", "level": 0.8},
                    ],
                  ),
                ),
                Space.x(4.w)!,
                Expanded(
                  child: _buildSkillsColumn(
                    title: "Advanced Features",
                    sectionKey: "advanced",
                    skills: [
                      {"name": "Jetpack Compose", "level": 0.85},
                      {"name": "Kotlin Coroutines", "level": 0.9},
                      {"name": "Retrofit", "level": 0.9},
                      {"name": "Firebase Integration", "level": 0.85},
                      {"name": "Push Notifications", "level": 0.8},
                      {"name": "In-App Billing", "level": 0.8},
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsColumn({
    required String title,
    required String sectionKey,
    required List<Map<String, dynamic>> skills,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              sectionKey == "core" ? Icons.developer_mode : Icons.extension,
              color: secondaryColor,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: isFontSize(context, 20),
                fontWeight: FontWeight.bold,
                color: theme.textColor,
              ),
            ),
          ],
        ),
        Space.y(2.w)!,
        ...skills.asMap().entries.map((entry) {
          final index = entry.key;
          final skill = entry.value;
          final isHovered = _hoveredIndex == index && _hoveredSection == sectionKey;
          
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: MouseRegion(
              onEnter: (_) => setState(() {
                _hoveredIndex = index;
                _hoveredSection = sectionKey;
              }),
              onExit: (_) => setState(() {
                _hoveredIndex = null;
                _hoveredSection = null;
              }),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: isHovered ? pinkpurple : null,
                  color: isHovered ? null : theme.navBarColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 12,
                          spreadRadius: 2,
                        )
                      ]
                    : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          skill["name"],
                          style: TextStyle(
                            fontSize: isFontSize(context, 16),
                            fontWeight: FontWeight.w600,
                            color: isHovered ? whiteColor : theme.textColor,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isHovered 
                              ? whiteColor.withOpacity(0.2)
                              : theme.navBarColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "${(skill["level"] * 100).toInt()}%",
                            style: TextStyle(
                              fontSize: isFontSize(context, 14),
                              fontWeight: FontWeight.w600,
                              color: isHovered ? whiteColor : secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Stack(
                      children: [
                        Container(
                          height: 12,
                          decoration: BoxDecoration(
                            color: isHovered 
                              ? whiteColor.withOpacity(0.2)
                              : Colors.grey[300],
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 12,
                          width: MediaQuery.of(context).size.width * 0.35 * skill["level"] * _animation.value,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: isHovered
                                ? [whiteColor.withOpacity(0.8), whiteColor]
                                : [secondaryColor, primaryColor],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: isHovered
                              ? [
                                  BoxShadow(
                                    color: whiteColor.withOpacity(0.5),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  )
                                ]
                              : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
} 