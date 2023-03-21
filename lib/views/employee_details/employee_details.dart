import 'package:ems_test/core/constants.dart';
import 'package:ems_test/views/employee_details/widgets/employee_data.dart';
import 'package:ems_test/views/employee_details/widgets/topButtons.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/screenargument.dart';
import '../../models/employee_mode.dart';
import '../../routes/route_names.dart';
import '../homePage/widgets/employee_tile.dart';
import '../widgets/background_container.dart';
import '../widgets/header_widget.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    List<EmployeeModel> employeelist = args.employeelist;
    int index = args.index!;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(69),
        child: HeaderWidget(heading: 'EMPLOYEE DETAILS'),
      ),
      body: Column(
        children:  [
          kHeight20,
           TopButtons(employeelist: employeelist, index: index,),
          kHeight20,
          Expanded(
            child: BackgroundContainer(widget: EmployeeData(employeelist: employeelist,index: index,)),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, addEmployee,
                  arguments: ScreenArguments(employeelist, index));
          },
          label: Text(
            'Edit',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          backgroundColor: kbuttonColor),
    );
  }
}
