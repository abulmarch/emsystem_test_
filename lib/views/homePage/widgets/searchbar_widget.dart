import 'package:ems_test/core/colors.dart';
import 'package:ems_test/core/screenargument.dart';
import 'package:flutter/material.dart';

import '../../../routes/route_names.dart';
import '../../widgets/icon_widget.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 220,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: ksecondaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: ksecondaryColor,
                ),
              ),
              labelText: 'Search',
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        IconButtonWidget(
          height: 30,
          width: 30,
          radius: 0,
          icon: Icons.add,
          ontap: () {
            Navigator.pushNamed(context, addEmployee,);
          },
        ),
      ],
    );
  }
}
