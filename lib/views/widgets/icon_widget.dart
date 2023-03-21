import 'package:flutter/material.dart';

import '../../core/colors.dart';

class IconButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final IconData icon;
  final Function() ontap;

  const IconButtonWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.radius, required this.icon, required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: ksecondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Icon(icon,
        color: kprimaryColor,
        ),
      ),
    );
  }
}