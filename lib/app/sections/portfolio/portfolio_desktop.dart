import 'package:flutter/material.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

import 'widgets/project_card.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          const CustomSectionHeading(text: "\nProjects"),
          Space.y(1.w)!,
          CustomSectionSubHeading(text: protfolioSubHeading),
          Space.y(2.w)!,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: size.width > 1200 ? 1.3 : 1.1,
              crossAxisSpacing: 3.w,
              mainAxisSpacing: 3.w,
            ),
            itemCount: projectUtils.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: projectUtils[index]);
            },
          ),
          Space.y(3.w)!,
          OutlinedButton(
            onPressed: () => openURL(gitHub),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'See More',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
