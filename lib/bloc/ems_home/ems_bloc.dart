import 'package:bloc/bloc.dart';
import 'package:ems_test/routes/route_names.dart';
import 'package:ems_test/views/employee_details/widgets/employee_data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:ems_test/models/employee_mode.dart';
import 'package:ems_test/service/employee_repo.dart';

part 'ems_event.dart';
part 'ems_state.dart';

class EmsHomeBloc extends Bloc<EmsHomeEvent, EmsHomeState> {
  final EmployeeRepository _employeeRepository;
  EmsHomeBloc(this._employeeRepository) : super(EmployeeLoadingState()) {
    on<EmsHomeEvent>((event, emit) async {
      emit(EmployeeLoadingState());
      try {
        final employees = await _employeeRepository.getEmployee();
        emit(EmployeeLoadedState(employees));
      } catch (e) {
        emit(EmployeeErrorState(e.toString()));
      }
    });
    on<CreateEmployee>((event, emit) async {
      emit(EmployeeAddingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final newEmployee = await _employeeRepository.createEmployee(
            postData: event.employeedata);
        emit(EmployeeAddedState(newEmployee));
      } catch (e) {
        emit(EmployeeAddErrorState(e.toString()));
      }
    });
    on<UpdateEmployee>((event, emit) async {
      emit(EmployeeUpdatingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await _employeeRepository.updateEmployee(employeeModel: event.employeedata, id: event.id);
        emit(EmployeeUpdatedState());
      } catch (e) {
        emit(EmployeeUpdatingErrorState(e.toString()));
      }
    });
  }
}
