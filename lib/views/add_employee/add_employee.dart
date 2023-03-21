// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ems_test/bloc/ems_home/ems_bloc.dart';
import 'package:ems_test/core/constants.dart';
import 'package:ems_test/models/employee_mode.dart';
import 'package:ems_test/service/employee_repo.dart';
import 'package:ems_test/views/add_employee/widgets/top_button_save.dart';
import 'package:ems_test/views/homePage/home_page.dart';

import '../widgets/add_field_widgets.dart';
import '../widgets/background_container.dart';
import '../widgets/header_widget.dart';

class AddEmployee extends StatelessWidget {
  final EmployeeModel? employeeModel;
  const AddEmployee({
    Key? key,
    this.employeeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmsHomeBloc(EmployeeRepository()),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(69),
          child: HeaderWidget(heading: 'ADD EMPLOYEE DETAILS'),
        ),
        body: BlocBuilder<EmsHomeBloc, EmsHomeState>(
          builder: (context, state) {
            switch (EmsHomeState) {
              case EmployeeAddingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case EmployeeAddedState:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('employee created'),
                    duration: Duration(seconds: 20),
                  ),
                );
                break;
              case EmployeeAddErrorState:
                return const Center(
                  child: Text("error"),
                );
                case EmployeeUpdatingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
                case EmployeeUpdatedState:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('employee updated'),
                    duration: Duration(seconds: 20),
                  ),
                );
                break;
                case EmployeeUpdatingErrorState:
                return const Center(
                  child: Text("error"),
                );
            }
            // if (state is EmployeeAddingState) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // } else if (state is EmployeeAddedState) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       content: Text('employee created'),
            //       duration: Duration(seconds: 20),
            //     ),
            //   );
            // }
            return Column(
              children: [
                kHeight20,
                const TopButtonsSave(),
                kHeight20,
                Expanded(
                  child: BackgroundContainer(
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                      ),
                      child: SingleChildScrollView(
                        // physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            kHeight20,
                            AddFieldWidgets(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
