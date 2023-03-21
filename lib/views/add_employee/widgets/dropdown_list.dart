import 'package:ems_test/core/colors.dart';
import 'package:flutter/material.dart';

class DropdownList extends StatefulWidget {
  final List<String> list;
  final Function(String) onchanged;
  const DropdownList({Key? key, required this.list, required this.onchanged})
      : super(key: key);

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 150,
      decoration: BoxDecoration(
          color: ktextColor, borderRadius: BorderRadius.circular(15)),
      child: DropdownButton<String>(
        alignment: AlignmentDirectional.center,
        underline: Container(),
        style: Theme.of(context).textTheme.bodyText2,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: ktextColor,
        ),
        value: dropdownValue,
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
            widget.onchanged(dropdownValue!);
          });
        },
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}


