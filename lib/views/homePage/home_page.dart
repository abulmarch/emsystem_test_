import 'package:ems_test/core/screenargument.dart';
import 'package:ems_test/models/employee_mode.dart';
import 'package:ems_test/service/employee_repo.dart';
import 'package:ems_test/views/homePage/widgets/employee_tile.dart';
import 'package:ems_test/views/homePage/widgets/searchbar_widget.dart';
import 'package:ems_test/views/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/ems_home/ems_bloc.dart';
import '../../core/constants.dart';
import '../../routes/route_names.dart';
import '../widgets/icon_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => EmsHomeBloc(
        RepositoryProvider.of<EmployeeRepository>(context),
      )..add(
          LoadEmployeeEvent(),
        ),
      
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(124),
          child: HeaderWidget(heading: 'EMPLOYEE MANAGEMENT SYSTEM'),
        ),
        body: BlocBuilder<EmsHomeBloc, EmsHomeState>(
          builder: (context, state) {
            if (state is EmployeeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is EmployeeLoadedState) {
              List<EmployeeModel> employeeList = state.employees;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23,
                ),
                child: Column(
                  children: [
                    kHeight20,
                    const SearchBar(),
                    kHeight20,
                    SizedBox(
                      height: size.height * .71,
                      child: ListView.builder(
                        itemCount: employeeList.length,
                        itemBuilder: (context, index) {
                          return EmployeeTile(
                            employeelist: employeeList,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is EmployeeErrorState) {
              return const Center(
                child: Text('error'),
              );
            }
            return Container();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: IconButtonWidget(
          height: 60,
          width: 60,
          radius: 0,
          icon: Icons.add,
          ontap: () {
            Navigator.pushNamed(context, addEmployee,arguments: ScreenArguments([], 0) );
          },
        ),
      ),
    );
  }
}
