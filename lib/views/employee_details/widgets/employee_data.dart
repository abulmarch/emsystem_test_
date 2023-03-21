import 'package:ems_test/core/constants.dart';
import 'package:ems_test/models/employee_mode.dart';
import 'package:flutter/material.dart';

class EmployeeData extends StatelessWidget {
  final List<EmployeeModel> employeelist;
  final int index;
  const EmployeeData({
    Key? key,
    required this.employeelist,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight20,
        CircleAvatar(
          radius: 50,
          child: Image.asset('assets/images/Profile Picture.png'),
        ),
        kHeight20,
        Text(
          "${employeelist[index].id}" ,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
        ),
        kHeight20,
        kHeight20,
        Text(
          "${employeelist[index].empFirstName!} ${employeelist[index].empLastName!}",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        kHeight20,
        Text(
          employeelist[index].empGender!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        kHeight20,
        Text(
          employeelist[index].empDateOfBirth!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        kHeight20,
        Text(
          employeelist[index].empDateOfJoining!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        kHeight20,
        Text(
          employeelist[index].empPhoneNumber!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        kHeight20,
        Text(
          employeelist[index].empEmailId!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        kHeight20,
        Text(
          "${employeelist[index].empHomeAddrLine1!} ${employeelist[index].empHomeAddrLine2!}",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        Text(
          "${employeelist[index].empHomeAddrStreet} ${employeelist[index].empHomeAddrDistrict} ${employeelist[index].empHomeAddrState}",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        Text(
          "${employeelist[index].empHomeAddrCountry} ${employeelist[index].empHomeAddrPinCode}",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        kHeight20
      ],
    );
  }
}
