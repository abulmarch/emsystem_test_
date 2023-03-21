import 'package:ems_test/core/screenargument.dart';
import 'package:ems_test/models/employee_mode.dart';
import 'package:ems_test/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../../widgets/icon_widget.dart';

class TopButtons extends StatelessWidget {
  final List<EmployeeModel> employeelist;
  final int index;
  const TopButtons({
    Key? key,
    required this.employeelist,
    required this.index,
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
          IconButtonWidget(
            height: 40,
            width: 40,
            radius: 0,
            icon: Icons.edit_note,
            ontap: () {
              Navigator.pushNamed(context, addEmployee,
                  arguments: ScreenArguments(employeelist, index));
              print(employeelist[index].empDateOfBirth);
            },
          )
        ],
      ),
    );
  }
}
