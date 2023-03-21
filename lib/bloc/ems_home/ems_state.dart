part of 'ems_bloc.dart';

@immutable
abstract class EmsHomeState extends Equatable {}

class EmployeeLoadingState extends EmsHomeState {
  @override
  List<Object?> get props => [];
}

class EmployeeLoadedState extends EmsHomeState {
  final List<EmployeeModel> employees;

  EmployeeLoadedState(this.employees);
  @override
  List<Object?> get props => [employees];
}

class EmployeeErrorState extends EmsHomeState {
  final String error;

  EmployeeErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class EmployeeAddingState extends EmsHomeState {
  @override
  List<Object> get props => [];
}

class EmployeeAddedState extends EmsHomeState {
  final EmployeeModel employeeModel;

  EmployeeAddedState(this.employeeModel);

  @override
  List<Object> get props => [];
}

class EmployeeAddErrorState extends EmsHomeState {
  final String error;

  EmployeeAddErrorState(this.error);
  @override
  List<Object> get props => [error];
}
class EmployeeUpdatingState extends EmsHomeState {
  @override
  List<Object> get props => [];
}

class EmployeeUpdatedState extends EmsHomeState {


  @override
  List<Object> get props => [];
}

class EmployeeUpdatingErrorState extends EmsHomeState {
  final String error;

  EmployeeUpdatingErrorState(this.error);


  @override
  List<Object> get props => [error];
}
