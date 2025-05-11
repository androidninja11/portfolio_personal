import 'package:flutter/material.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

import 'widgets/project_card.dart';

class PortfolioMobileTab extends StatelessWidget {
  const PortfolioMobileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          const CustomSectionHeading(text: "\nProjects"),
          Space.y(3.w)!,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: CustomSectionSubHeading(text: protfolioSubHeading),
          ),
          Space.y(5.w)!,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size.width > 600 ? 2 : 1,
              childAspectRatio: size.width > 600 ? 1.2 : 1.3,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
