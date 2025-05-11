import 'package:flutter/material.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/res/responsive_size.dart';
import '../../../../core/util/responsive_size.dart';

class ProjectCard extends StatefulWidget {
  final ProjectUtils project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);
  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => openURL(widget.project.links),
      onHover: (isHovering) {
        setState(() => isHover = isHovering);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : grayBack,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: isHover ? 0.1 : 1.0,
                child: Image.asset(
                  widget.project.banners,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Project Icon
                  SizedBox(
                    height: ResponsiveSize.responsiveHeight(context, 0.06),
                    child: Image.asset(
                      widget.project.icons,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 1.5.w),
                  
                  // Project Title
                  SizedBox(
                    height: ResponsiveSize.responsiveHeight(context, 0.06),
                    child: Text(
                      widget.project.titles,
                      style: TextStyle(
                        fontSize: ResponsiveSize.responsiveSize(context, 18),
                        fontWeight: FontWeight.bold,
                        color: isHover ? whiteColor : theme.textColor,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 1.w),
                  
                  // Project Description
                  Expanded(
                    child: Text(
                      widget.project.description,
                      style: TextStyle(
                        fontSize: ResponsiveSize.responsiveSize(context, 14),
                        color: isHover ? whiteColor.withOpacity(0.8) : theme.textColor.withOpacity(0.8),
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  
                  // View Project Button
                  if (isHover) ...[
                    SizedBox(height: 1.5.w),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 1.w,
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: whiteColor.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View Project',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: ResponsiveSize.responsiveSize(context, 12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 0.5.w),
                            Icon(
                              Icons.arrow_forward,
                              color: whiteColor,
                              size: ResponsiveSize.responsiveSize(context, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
