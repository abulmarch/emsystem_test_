class EmployeeModel {
  int? id;
  String? empFirstName;
  String? empLastName;
  String? empGender;
  String? empPhoneNumber;
  String? empDateOfBirth;
  String? empDateOfJoining;
  String? empEmailId;
  String? empHomeAddrLine1;
  String? empHomeAddrLine2;
  String? empHomeAddrStreet;
  String? empHomeAddrDistrict;
  String? empHomeAddrState;
  String? empHomeAddrCountry;
  String? empHomeAddrPinCode;

  EmployeeModel({
    this.id,
    this.empFirstName,
    this.empLastName,
    this.empGender,
    this.empDateOfBirth,
    this.empDateOfJoining,
    this.empPhoneNumber,
    this.empEmailId,
    this.empHomeAddrLine1,
    this.empHomeAddrLine2,
    this.empHomeAddrStreet,
    this.empHomeAddrDistrict,
    this.empHomeAddrState,
    this.empHomeAddrCountry,
    this.empHomeAddrPinCode,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    empFirstName = json['empFirstName'];
    empLastName = json['empLastName'];
    empGender = json['empGender'];
    empDateOfBirth = json['empDateOfBirth'];
    empDateOfJoining = json['empDateOfJoining'];
    empPhoneNumber = json['empPhoneNumber'];
    empEmailId = json['empEmailId'];
    empHomeAddrLine1 = json['empHomeAddrLine1'];
    empHomeAddrLine2 = json['empHomeAddrLine2'];
    empHomeAddrDistrict = json['empHomeAddrDistrict'];
    empHomeAddrStreet = json['empHomeAddrStreet'];
    empHomeAddrState = json['empHomeAddrState'];
    empHomeAddrCountry = json['empHomeAddrCountry'];
    empHomeAddrPinCode = json['empHomeAddrPinCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'empFirstName': empFirstName,
      'empLastName': empLastName,
      'empGender': empGender,
      'empDateOfBirth': empDateOfBirth,
      'empDateOfJoining': empDateOfJoining,
      'empPhoneNumber': empPhoneNumber,
      'empEmailId' : empEmailId,
      'empHomeAddrLine1' : empHomeAddrLine1,
      'empHomeAddrLine2' : empHomeAddrLine2,
      'empHomeAddrStreet': empHomeAddrStreet,
      'empHomeAddrDistrict': empHomeAddrDistrict,
      'empHomeAddrState' : empHomeAddrState,
      'empHomeAddrCountry': empHomeAddrCountry,
      'empHomeAddrPinCode': empHomeAddrPinCode
    };
  }
}
