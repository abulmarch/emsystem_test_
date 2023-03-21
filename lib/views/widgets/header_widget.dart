import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String heading;
  const HeaderWidget({Key? key, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/TopHeader.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: Text(
            heading,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      )),
    );
  }
}
