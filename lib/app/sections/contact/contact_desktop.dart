import 'package:flutter/material.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int? _hoveredIndex;

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

  Widget _buildSocialButton(MapEntry<int, ContactUtils> e) {
    final isHovered = _hoveredIndex == e.key;
    if (kIsWeb) {
      return MouseRegion(
        onEnter: (_) => setState(() => _hoveredIndex = e.key),
        onExit: (_) => setState(() => _hoveredIndex = null),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(isHovered ? 1.1 : 1.0),
          child: IconButton(
            icon: Image.network(
              e.value.icon,
              color: isHovered ? primaryColor : Theme.of(context).textColor,
            ),
            onPressed: () => openURL(e.value.url),
            highlightColor: Colors.transparent,
            iconSize: 24,
          ),
        ),
      );
    } else {
      return IconButton(
        icon: Image.network(
          e.value.icon,
          color: Theme.of(context).textColor,
        ),
        onPressed: () => openURL(e.value.url),
        highlightColor: Colors.transparent,
        iconSize: 24,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 8),
      child: Column(
        children: [
          const CustomSectionHeading(text: "\nGet in Touch"),
          Space.y(1.w)!,
          const CustomSectionSubHeading(
            text: "If you want to avail my services you can contact me at the links below.",
          ),
          Space.y(2.w)!,
          AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  padding: EdgeInsets.all(size.width * 0.05).copyWith(bottom: 10),
                  decoration: BoxDecoration(
                    gradient: theme.contactCard,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contactHeadding,
                                  style: TextStyle(
                                    height: 1.2,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Space.y(1.w)!,
                                Text(
                                  contactSubHeadding,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: theme.textColor.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (kIsWeb)
                            MouseRegion(
                              onEnter: (_) => _controller.forward(),
                              onExit: (_) => _controller.reverse(),
                              child: InkWell(
                                onTap: () => openURL(whatsapp),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                  decoration: BoxDecoration(
                                    gradient: buttonGradi,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: primaryColor.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      )
                                    ],
                                  ),
                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            InkWell(
                              onTap: () => openURL(whatsapp),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                decoration: BoxDecoration(
                                  gradient: buttonGradi,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Container(
                        color: Colors.white.withOpacity(0.2),
                        height: 1,
                        margin: EdgeInsets.symmetric(vertical: 3.w),
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 50,
                        spacing: 30,
                        children: contactUtils
                            .asMap()
                            .entries
                            .map(_buildSocialButton)
                            .toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
