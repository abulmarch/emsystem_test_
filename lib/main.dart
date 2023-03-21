import 'package:ems_test/routes/page_routes.dart';
import 'package:ems_test/routes/route_names.dart';
import 'package:ems_test/service/employee_repo.dart';
import 'package:ems_test/views/add_employee/add_employee.dart';
import 'package:ems_test/views/homePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/colors.dart';
import 'views/employee_details/employee_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Management System',
      theme: ThemeData(
          scaffoldBackgroundColor: kprimaryColor,
          textTheme: const TextTheme(
            headline1: TextStyle(
                color: kprimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter'),
            bodyText1: TextStyle(
                color: ktextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter'),
            bodyText2: TextStyle(
                color: ksecondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter'),
            button: TextStyle(
                color: kwhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter'),
          ),
          primarySwatch: Colors.grey),
      home: RepositoryProvider(
        create: (context) => EmployeeRepository(),
        child:  const HomePage(),
      ),
      onGenerateRoute: PageRoutes.generateRoute,
    );
  }
}
