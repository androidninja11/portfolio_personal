part of 'services.dart';

class ServiceMobile extends StatefulWidget {
  const ServiceMobile({Key? key}) : super(key: key);

  @override
  State<ServiceMobile> createState() => _ServiceMobileState();
}

class _ServiceMobileState extends State<ServiceMobile> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          const CustomSectionHeading(text: '\nWhat I can do?'),
          Space.y(3.w)!,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: CustomSectionSubHeading(text: servicesSubHeading),
          ),
          Space.y(5.w)!,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: servicesUtils.length,
            separatorBuilder: (context, index) => SizedBox(height: 4.w),
            itemBuilder: (context, index) {
              final service = servicesUtils[index];
              final isHovered = _hoveredIndex == index;

              return GestureDetector(
                onTapDown: (_) => setState(() => _hoveredIndex = index),
                onTapUp: (_) => setState(() => _hoveredIndex = null),
                onTapCancel: () => setState(() => _hoveredIndex = null),
                child: ServiceCard(
                  service: service,
                  isHovered: isHovered,
                  onTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
