part of 'services.dart';


class ServiceDesktop extends StatefulWidget {
  const ServiceDesktop({Key? key}) : super(key: key);

  @override
  ServiceDesktopState createState() => ServiceDesktopState();
}

class ServiceDesktopState extends State<ServiceDesktop> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05)
          .copyWith(bottom: height * 0.1),
      child: Column(
        children: [
          const CustomSectionHeading(text: '\nWhat I can do?'),
          Space.y(1.w)!,
          CustomSectionSubHeading(text: servicesSubHeading),
          Space.y(1.w)!,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: servicesUtils.length,
            separatorBuilder: (context, index) => SizedBox(height: 1.w),
            itemBuilder: (context, index) {
              final service = servicesUtils[index];
              final isHovered = _hoveredIndex == index;

              return MouseRegion(
                onEnter: (_) => setState(() => _hoveredIndex = index),
                onExit: (_) => setState(() => _hoveredIndex = null),
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
