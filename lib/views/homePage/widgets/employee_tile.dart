import 'package:ems_test/models/employee_mode.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../../core/screenargument.dart';
import '../../../routes/route_names.dart';

class EmployeeTile extends StatelessWidget {
  final List<EmployeeModel> employeelist;
  final int? index;
  const EmployeeTile({
    Key? key,
    required this.employeelist,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            employeeDetails,
            arguments: ScreenArguments(employeelist, index!)
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: ksecondaryColor,
              child: Image.asset('assets/images/Profile Picture.png'),
            ),
            kWidth7,
            Text(employeelist[index!].empFirstName! + "" +
                employeelist[index!].empLastName!)
          ],
        ),
      ),
    );
  }
}
