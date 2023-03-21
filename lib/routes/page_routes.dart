import 'package:ems_test/routes/route_names.dart';
import 'package:ems_test/views/add_employee/add_employee.dart';
import 'package:ems_test/views/employee_details/employee_details.dart';
import 'package:ems_test/views/homePage/home_page.dart';
import 'package:flutter/material.dart';


class PageRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomePage(),
        );
      case employeeDetails:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) {
              return const EmployeeDetails();
            },);
      case addEmployee:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) {
              return const AddEmployee();
            },);
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'error! no routes',
              ),
            ),
          ),
        );
    }
  }
}
