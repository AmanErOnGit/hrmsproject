class EmployeeDDModel {
  String? status;
  String? message;
  List<EmployeeDetail>? data;

  EmployeeDDModel({this.status, this.message, this.data});

  EmployeeDDModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <EmployeeDetail>[];
      json['data'].forEach((v) {
        data!.add(new EmployeeDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeDetail {
  int? id;
  String? employeeId;
  String? employeeName;
  String? profileImage;
  String? salary;
  String? email;
  String? phoneNumber;
  String? shiftTiming;
  String? shiftType;
  String? employmentType;
  String? designation;
  String? password;
  int? shopId;
  String? createdAt;
  String? shopName;
  int? userId;

  EmployeeDetail(
      {this.id,
        this.employeeId,
        this.employeeName,
        this.profileImage,
        this.salary,
        this.email,
        this.phoneNumber,
        this.shiftTiming,
        this.shiftType,
        this.employmentType,
        this.designation,
        this.password,
        this.shopId,
        this.createdAt,
        this.shopName,
        this.userId});

  EmployeeDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    profileImage = json['profile_image']??"";
    salary = json['salary'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    shiftTiming = json['shift_timing'];
    shiftType = json['shift_type'];
    employmentType = json['employment_type'];
    designation = json['designation'];
    password = json['password'];
    shopId = json['shop_id'];
    createdAt = json['created_at'];
    shopName = json['shop_name'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['profile_image'] = this.profileImage;
    data['salary'] = this.salary;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['shift_timing'] = this.shiftTiming;
    data['shift_type'] = this.shiftType;
    data['employment_type'] = this.employmentType;
    data['designation'] = this.designation;
    data['password'] = this.password;
    data['shop_id'] = this.shopId;
    data['created_at'] = this.createdAt;
    data['shop_name'] = this.shopName;
    data['user_id'] = this.userId;
    return data;
  }
}
