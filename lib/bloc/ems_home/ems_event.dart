part of 'ems_bloc.dart';

@immutable
abstract class EmsHomeEvent extends Equatable {
  const EmsHomeEvent();
}

class LoadEmployeeEvent extends EmsHomeEvent{
  @override
  List<Object?> get props => [];

}

class CreateEmployee extends EmsHomeEvent {
  final EmployeeModel employeedata;
  const CreateEmployee(this.employeedata,);
  
  @override
  List<Object?> get props => [];
  
}
class UpdateEmployee extends EmsHomeEvent {
  final EmployeeModel employeedata;
  final String id;

  const UpdateEmployee(this.employeedata, this.id);
  
  @override
  List<Object?> get props => [];
  
}
