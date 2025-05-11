part of '../services.dart';

class ServiceCard extends StatefulWidget {
  final ServicesUtils service;
  final bool isHovered;
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.service,
    required this.isHovered,
    required this.onTap,
  }) : super(key: key);

  @override
  ServiceCardState createState() => ServiceCardState();
}

class ServiceCardState extends State<ServiceCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int? _hoveredCategoryIndex;
  bool _isHeaderHovered = false;
  bool _isDescriptionHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
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
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme),
          _buildDescription(theme),
          _buildCategoriesGrid(theme),
          _buildBottomGradient(),
          SizedBox(height: 2.w),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHeaderHovered = true),
      onExit: (_) => setState(() => _isHeaderHovered = false),
      child: Container(
        padding: EdgeInsets.all(1.w),
        decoration: BoxDecoration(
          gradient: _isHeaderHovered ? pinkpurple : null,
          color: _isHeaderHovered ? null : theme.cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                color: _isHeaderHovered 
                  ? whiteColor.withOpacity(0.2)
                  : theme.navBarColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                widget.service.icon,
                height: 30,
                width: 30,
              ),
            ),
            SizedBox(width: 1.w),
            Expanded(
              child: Text(
                widget.service.name,
                style: TextStyle(
                  fontSize: isFontSize(context, 22),
                  fontWeight: FontWeight.bold,
                  color: _isHeaderHovered ? whiteColor : theme.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required bool isHovered,
    required ThemeData theme,
    double fontSize = 12,
    EdgeInsets? padding,
  }) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.8.w),
      decoration: BoxDecoration(
        color: isHovered 
          ? whiteColor.withOpacity(0.15)
          : theme.navBarColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isHovered 
            ? whiteColor.withOpacity(0.3)
            : theme.navBarColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            margin: EdgeInsets.only(right: 0.8.w),
            decoration: BoxDecoration(
              color: isHovered ? whiteColor : secondaryColor,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: isFontSize(context, fontSize),
              color: isHovered ? whiteColor : theme.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(ThemeData theme) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isDescriptionHovered = false),
      onExit: (_) => setState(() => _isDescriptionHovered = false),
      child: Container(
        padding: EdgeInsets.fromLTRB(2.w,1.w,2.w,1.w),
        decoration: BoxDecoration(
          gradient: _isDescriptionHovered ? pinkpurple : null,
          color: _isDescriptionHovered ? null : theme.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.service.description,
              style: TextStyle(
                fontSize: isFontSize(context, 16),
                color: _isDescriptionHovered 
                  ? whiteColor.withOpacity(0.9)
                  : theme.textColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            SizedBox(height: 2.w),
            Wrap(
              spacing: 1.w,
              runSpacing: 1.5.w,
              children: widget.service.highlights.map((highlight) {
                return _buildChip(
                  label: highlight,
                  isHovered: _isDescriptionHovered,
                  theme: theme,
                  fontSize: 14,
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 768 ? 2 : 1,
              childAspectRatio: MediaQuery.of(context).size.width > 768 ? 2.5 : 3,
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 2.w,
            ),
            itemCount: widget.service.categories.length,
            itemBuilder: (context, index) {
              final category = widget.service.categories[index];
              final isHovered = _hoveredCategoryIndex == index;
              
              return MouseRegion(
                onEnter: (_) => setState(() => _hoveredCategoryIndex = index),
                onExit: (_) => setState(() => _hoveredCategoryIndex = null),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    gradient: isHovered ? pinkpurple : null,
                    color: isHovered ? null : theme.navBarColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: isHovered 
                        ? whiteColor.withOpacity(0.2)
                        : theme.navBarColor.withOpacity(0.3),
                      width: 1,
                    ),
                    boxShadow: isHovered ? [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ] : [],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(0.8.w),
                            decoration: BoxDecoration(
                              color: isHovered 
                                ? whiteColor.withOpacity(0.2)
                                : theme.navBarColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              category.icon,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Expanded(
                            child: Text(
                              category.name,
                              style: TextStyle(
                                fontSize: isFontSize(context, 16),
                                fontWeight: FontWeight.w600,
                                color: isHovered ? whiteColor : theme.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.w),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 1.w,
                            runSpacing: 1.w,
                            children: category.tools.map((tool) {
                              return _buildChip(
                                label: tool,
                                isHovered: isHovered,
                                theme: theme,
                                fontSize: 11,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1.5.w,
                                  vertical: 0.6.w,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
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

  Widget _buildBottomGradient() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.5),
          end: Offset.zero,
        ).animate(_animation),
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            height: 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [secondaryColor, primaryColor],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}
