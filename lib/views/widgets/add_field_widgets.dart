// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ems_test/bloc/ems_home/ems_bloc.dart';
import 'package:ems_test/models/employee_mode.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/screenargument.dart';
import '../../service/employee_repo.dart';
import '../add_employee/widgets/dropdown_list.dart';
import 'custome_textfield.dart';

class AddFieldWidgets extends StatelessWidget {
  AddFieldWidgets({
    Key? key,
  }) : super(key: key);
  final TextEditingController empIDController = TextEditingController();
  final TextEditingController empFirstNameController = TextEditingController();
  final TextEditingController empLastNameController = TextEditingController();
  final TextEditingController empDateOfBirthController =
      TextEditingController();
  final TextEditingController empDateOfJoiningController =
      TextEditingController();
  final TextEditingController empPhoneNumberController =
      TextEditingController();
  final TextEditingController empEmailIdController = TextEditingController();
  final TextEditingController empHomeAddrLine1Controller =
      TextEditingController();
  final TextEditingController empHomeAddrLine2Controller =
      TextEditingController();
  final TextEditingController empHomeAddrStreetController =
      TextEditingController();
  final TextEditingController empHomeAddrDistrictController =
      TextEditingController();
  final TextEditingController empHomeAddrStateController =
      TextEditingController();
  final TextEditingController empHomeAddrCountryController =
      TextEditingController();
  final TextEditingController empHomeAddrPinCodeController =
      TextEditingController();

  final List<String> items = ['MALE', 'FEMALE', 'OTHER'];

  late String gender = items.first;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    List<EmployeeModel> employeeList = args.employeelist;
    int index = args.index!;
    final employeeBloc = BlocProvider.of<EmsHomeBloc>(context);
    if (employeeList.isNotEmpty) {
      empIDController.text = "${employeeList[index].id}";
      empFirstNameController.text = employeeList[index].empFirstName!;
      empLastNameController.text = employeeList[index].empLastName!;
      empDateOfBirthController.text = employeeList[index].empDateOfBirth!;
      empDateOfJoiningController.text = employeeList[index].empDateOfJoining!;
      empPhoneNumberController.text = employeeList[index].empPhoneNumber!;
      empEmailIdController.text = employeeList[index].empEmailId!;
      empHomeAddrLine1Controller.text = employeeList[index].empHomeAddrLine1!;
      empHomeAddrLine2Controller.text = employeeList[index].empHomeAddrLine2!;
      empHomeAddrStreetController.text = employeeList[index].empHomeAddrStreet!;
      empHomeAddrDistrictController.text =
          employeeList[index].empHomeAddrDistrict!;
      empHomeAddrStateController.text = employeeList[index].empHomeAddrState!;
      empHomeAddrCountryController.text =
          employeeList[index].empHomeAddrCountry!;
      empHomeAddrPinCodeController.text =
          employeeList[index].empHomeAddrPinCode!;
      gender = employeeList[index].empGender!;
    }
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(
                label: 'Employee ID',
                controller: empIDController,
              ),
              const CircleAvatar(
                radius: 50,
                child: Center(
                  child: Text('add photo'),
                ),
              )
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(
                label: 'First Name',
                controller: empFirstNameController,
              ),
              CustomTextField(
                label: 'Last Name',
                controller: empLastNameController,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DropdownList(
                  list: items,
                  onchanged: (dropdownValue) {
                    gender = dropdownValue;
                  }),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextField(
                label: 'Date of Birth',
                controller: empDateOfBirthController,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextField(
                label: 'Date of Joining',
                controller: empDateOfJoiningController,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(
                label: 'Phone Number',
                controller: empPhoneNumberController,
              ),
              CustomTextField(
                label: 'Email',
                controller: empEmailIdController,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(
                label: 'Address Line 1',
                controller: empHomeAddrLine1Controller,
              ),
              CustomTextField(
                label: 'Address Line 2',
                controller: empHomeAddrLine2Controller,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(
                label: 'Street',
                controller: empHomeAddrStreetController,
              ),
              CustomTextField(
                label: 'District',
                controller: empHomeAddrDistrictController,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(
                label: 'State',
                controller: empHomeAddrStateController,
              ),
              CustomTextField(
                label: 'Country',
                controller: empHomeAddrCountryController,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextField(
                label: 'Pincode',
                controller: empHomeAddrPinCodeController,
              ),
              GestureDetector(
                onTap: () async {

                  if (_formKey.currentState!.validate()) {
                    final employeedetails = EmployeeModel(
                        empFirstName: empFirstNameController.text,
                        empLastName: empLastNameController.text,
                        empGender: gender,
                        empDateOfBirth: empDateOfBirthController.text,
                        empDateOfJoining: empDateOfJoiningController.text,
                        empPhoneNumber: empPhoneNumberController.text,
                        empEmailId: empEmailIdController.text,
                        empHomeAddrLine1: empHomeAddrLine1Controller.text,
                        empHomeAddrLine2: empHomeAddrLine2Controller.text,
                        empHomeAddrStreet: empHomeAddrStreetController.text,
                        empHomeAddrDistrict: empHomeAddrDistrictController.text,
                        empHomeAddrState: empHomeAddrStateController.text,
                        empHomeAddrCountry: empHomeAddrCountryController.text,
                        empHomeAddrPinCode: empHomeAddrPinCodeController.text);
                    if (employeeList.isNotEmpty || employeeList.length != 0) {
                      employeeBloc.add(UpdateEmployee(
                          employeedetails, "${empIDController.text}}"));
                    } else {
                      employeeBloc.add(CreateEmployee(employeedetails));
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: kbuttonColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.labelLarge,
                  )),
                ),
              )
            ],
          ),
          kHeight10,
        ],
      ),
    );
  }
}
