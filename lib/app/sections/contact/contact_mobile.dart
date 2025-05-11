import 'package:flutter/material.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

class ContactMobileTab extends StatefulWidget {
  const ContactMobileTab({Key? key}) : super(key: key);

  @override
  State<ContactMobileTab> createState() => _ContactMobileTabState();
}

class _ContactMobileTabState extends State<ContactMobileTab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int? _activeIndex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSocialButton(MapEntry<int, ContactUtils> e, ThemeData theme) {
    final isActive = _activeIndex == e.key;
    return GestureDetector(
      onTapDown: (_) => setState(() => _activeIndex = e.key),
      onTapUp: (_) => setState(() => _activeIndex = null),
      onTapCancel: () => setState(() => _activeIndex = null),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive ? theme.textColor.withOpacity(0.1) : Colors.transparent,
        ),
        child: IconButton(
          icon: Image.network(
            e.value.icon,
            color: isActive ? primaryColor : theme.textColor,
          ),
          onPressed: () => openURL(e.value.url),
          highlightColor: Colors.transparent,
          iconSize: 20.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Space.y(10.w)!,
        CustomSectionHeading(text: contactHeadding),
        Space.y(3.w)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: contactSubHeadding),
        ),
        Space.y(5.w)!,
        Container(
          padding: EdgeInsets.all(5.w),
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            gradient: theme.contactCard,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.2),
                blurRadius: 15,
                spreadRadius: 3,
              )
            ],
          ),
          child: Column(
            children: [
              GestureDetector(
                onTapDown: (_) => _controller.forward(),
                onTapUp: (_) => _controller.reverse(),
                onTapCancel: () => _controller.reverse(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    gradient: buttonGradi,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white.withOpacity(0.2),
                height: 1,
                margin: EdgeInsets.symmetric(vertical: 4.w),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 30,
                spacing: 20,
                children: contactUtils
                    .asMap()
                    .entries
                    .map((e) => _buildSocialButton(e, theme))
                    .toList(),
              ),
            ],
          ),
        ),
        Space.y(5.w)!,
      ],
    );
  }
}
