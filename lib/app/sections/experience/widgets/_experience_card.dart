part of '../experience.dart';

class _ExperienceCard extends StatefulWidget {
  final ExperienceUtils service;

  const _ExperienceCard({Key? key, required this.service}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ExperienceCard> with SingleTickerProviderStateMixin {
  bool isHover = false;
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

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

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovering) {
        if (isHovering) {
          setState(() => isHover = true);
                _controller.forward();
        } else {
          setState(() => isHover = false);
                _controller.reverse();
        }
      },
      child: Container(
        width: Responsive.isTablet(context) ? 400 : 500,
              padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : theme.serviceCard,
                borderRadius: BorderRadius.circular(24),
                boxShadow: isHover 
                  ? [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ] 
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ],
        ),
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header Section with Company and Role
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isHover ? whiteColor.withOpacity(0.2) : theme.navBarColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: SvgPicture.asset(
                          widget.service.icon,
                          height: 32,
                          color: isHover ? whiteColor : theme.textColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                            Text(
                              widget.service.name,
                style: TextStyle(
                  color: isHover ? whiteColor : theme.textColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              widget.service.role,
                              style: TextStyle(
                                color: isHover ? whiteColor.withOpacity(0.9) : theme.textColor.withOpacity(0.9),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Location and Duration Row
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isHover ? whiteColor.withOpacity(0.1) : theme.navBarColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: isHover ? whiteColor : theme.textColor.withOpacity(0.8),
                        ),
                        const SizedBox(width: 8),
            Text(
              widget.service.description,
                          style: TextStyle(
                            color: isHover ? whiteColor.withOpacity(0.9) : theme.textColor.withOpacity(0.9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: isHover ? whiteColor : theme.textColor.withOpacity(0.8),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.service.period,
                          style: TextStyle(
                            color: isHover ? whiteColor.withOpacity(0.9) : theme.textColor.withOpacity(0.9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Responsibilities Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.work_outline_rounded,
                            size: 18,
                            color: isHover ? whiteColor : secondaryColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Responsibilities",
                            style: TextStyle(
                              color: isHover ? whiteColor : theme.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      AnimatedCrossFade(
                        firstChild: Text(
                          widget.service.responsibilities,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: isHover ? whiteColor.withOpacity(0.85) : theme.textColor.withOpacity(0.85),
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        secondChild: Text(
                          widget.service.responsibilities,
                          style: TextStyle(
                            color: isHover ? whiteColor.withOpacity(0.85) : theme.textColor.withOpacity(0.85),
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 300),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => setState(() => isExpanded = !isExpanded),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            backgroundColor: isHover ? whiteColor.withOpacity(0.1) : theme.navBarColor.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                isExpanded ? "Show Less" : "Show More",
                                style: TextStyle(
                                  color: isHover ? whiteColor : secondaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                size: 16,
                                color: isHover ? whiteColor : secondaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Skills Section
                  Row(
                    children: [
                      Icon(
                        Icons.code_rounded,
                        size: 18,
                        color: isHover ? whiteColor : secondaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Technologies & Tools",
                        style: TextStyle(
                          color: isHover ? whiteColor : theme.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.service.tool.map((tool) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: isHover ? whiteColor.withOpacity(0.1) : theme.navBarColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isHover ? whiteColor.withOpacity(0.2) : theme.textColor.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          tool,
              style: TextStyle(
                            color: isHover ? whiteColor.withOpacity(0.9) : theme.textColor.withOpacity(0.9),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
