import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ResponsiveSize {
  static double responsiveSize(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return size * 1.2;
    } else if (screenWidth > 800) {
      return size;
    } else {
      return size * 0.8;
    }
  }

  static double responsiveHeight(BuildContext context, double ratio) {
    return MediaQuery.of(context).size.height * ratio;
  }

  static double responsiveWidth(BuildContext context, double ratio) {
    return MediaQuery.of(context).size.width * ratio;
  }
} 