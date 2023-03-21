import 'dart:convert';

import 'package:ems_test/routes/route_names.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/employee_mode.dart';

const String endPoint = "http://15.207.222.215:8080/api/employees/";

//not neeede
class EmployeeRepository {
  //get employee data
  Future<List<EmployeeModel>> getEmployee() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => EmployeeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future createEmployee({required EmployeeModel postData}) async {
    final url = Uri.parse(endPoint);
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final jsonBody = jsonEncode(postData);
    final response = await http.post(url, headers: headers, body: jsonBody);

    if (response.statusCode != 200 || response.statusCode != 201) {
      throw Exception(response.reasonPhrase);
    }
  }

  Future updateEmployee(
      {required EmployeeModel employeeModel, required String id}) async {
    var empId = id;

    var urlString = endPoint + empId.substring(0, empId.length - 1);
    final url = Uri.parse(urlString);
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    final json = jsonEncode(employeeModel.toJson());
    final response = await http.put(url, body: json, headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      return "success";
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
