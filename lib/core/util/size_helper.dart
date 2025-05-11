import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Space {
  static SizedBox? y(double height) {
    return SizedBox(height: height);
  }

  static SizedBox? x(double width) {
    return SizedBox(width: width);
  }
}

double isFontSize(BuildContext context, double size) {
  if (MediaQuery.of(context).size.width < 600) {
    return size * 0.8;
  } else if (MediaQuery.of(context).size.width < 900) {
    return size * 0.9;
  } else {
    return size;
  }
} 