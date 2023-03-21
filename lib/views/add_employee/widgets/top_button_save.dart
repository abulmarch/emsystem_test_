import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../widgets/icon_widget.dart';

class TopButtonsSave extends StatelessWidget {
  const TopButtonsSave({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 23,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButtonWidget(
            height: 40,
            width: 40,
            radius: 20,
            icon: Icons.arrow_back,
            ontap: () {
              Navigator.pop(context);
            },
          ),
          // MaterialButton(
          //   onPressed: () {
                            

          //   },
          //   color: kbuttonColor,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   height: 50,
          //   minWidth: 120,
          //   child: Center(
          //       child: Text(
          //     'Save',
          //     style: Theme.of(context).textTheme.button,
          //   )),
          // ),
        ],
      ),
    );
  }
}
