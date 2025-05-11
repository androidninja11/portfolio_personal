import 'package:flutter/material.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/theme/app_theme.dart';
import 'package:mysite/core/util/size_helper.dart';
import 'package:sizer/sizer.dart';

class SkillsMobile extends StatefulWidget {
  const SkillsMobile({Key? key}) : super(key: key);

  @override
  State<SkillsMobile> createState() => _SkillsMobileState();
}

class _SkillsMobileState extends State<SkillsMobile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
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
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSkillsColumn(
                  title: "Core Development",
                  skills: [
                    {"name": "Android Studio", "level": 0.95},
                    {"name": "Java", "level": 0.9},
                    {"name": "Kotlin", "level": 0.85},
                    {"name": "MVVM Architecture", "level": 0.9},
                    {"name": "Room Database", "level": 0.85},
                    {"name": "Dagger Hilt", "level": 0.8},
                  ],
                ),
                Space.y(4.w)!,
                _buildSkillsColumn(
                  title: "Advanced Features",
                  skills: [
                    {"name": "Jetpack Compose", "level": 0.85},
                    {"name": "Kotlin Coroutines", "level": 0.9},
                    {"name": "Retrofit", "level": 0.9},
                    {"name": "Firebase Integration", "level": 0.85},
                    {"name": "Push Notifications", "level": 0.8},
                    {"name": "In-App Billing", "level": 0.8},
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsColumn({required String title, required List<Map<String, dynamic>> skills}) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isFontSize(context, 20),
            fontWeight: FontWeight.bold,
            color: theme.textColor,
          ),
        ),
        Space.y(2.w)!,
        ...skills.asMap().entries.map((entry) {
          final index = entry.key;
          final skill = entry.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    skill["name"],
                    style: TextStyle(
                      fontSize: isFontSize(context, 16),
                      fontWeight: FontWeight.w500,
                      color: theme.textColor,
                    ),
                  ),
                  Text(
                    "${(skill["level"] * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: isFontSize(context, 14),
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
              Space.y(1.w)!,
              GestureDetector(
                onTapDown: (_) => setState(() => _hoveredIndex = index),
                onTapUp: (_) => setState(() => _hoveredIndex = null),
                onTapCancel: () => setState(() => _hoveredIndex = null),
                child: Stack(
                  children: [
                    Container(
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: _hoveredIndex == index ? 20 : 15,
                      width: MediaQuery.of(context).size.width * skill["level"] * _animation.value,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [secondaryColor, primaryColor],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: _hoveredIndex == index
                            ? [
                                BoxShadow(
                                  color: secondaryColor.withOpacity(0.5),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              Space.y(2.w)!,
            ],
          );
        }).toList(),
      ],
    );
  }
} 