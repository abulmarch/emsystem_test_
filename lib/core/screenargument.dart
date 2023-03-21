import '../models/employee_mode.dart';

class ScreenArguments {
  final List<EmployeeModel> employeelist;
  final int? index;

  ScreenArguments(this.employeelist, this.index);
}