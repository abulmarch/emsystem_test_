import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget widget;
  const BackgroundContainer({
    Key? key, required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/Blue Window.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: widget,
    );
  }
}