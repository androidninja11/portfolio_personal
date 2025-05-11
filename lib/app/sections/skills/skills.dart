import 'package:flutter/material.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/app/sections/skills/skills_desktop.dart';
import 'package:mysite/app/sections/skills/skills_mobile.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: SkillsDesktop(),
      mobile: SkillsMobile(),
      tablet: SkillsMobile(),
    );
  }
} 