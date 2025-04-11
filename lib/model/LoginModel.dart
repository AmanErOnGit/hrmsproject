class LoginModel {
  String? status;
  String? message;
  String? userType;
  User? user;
  List<Shops>? shops;
  Employee? employee;

  LoginModel({this.status, this.message, this.userType, this.user, this.shops});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userType = json['user_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['shops'] != null) {
      shops = <Shops>[];
      json['shops'].forEach((v) {
        shops!.add(new Shops.fromJson(v));
      });
    }
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['user_type'] = this.userType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.shops != null) {
      data['shops'] = this.shops!.map((v) => v.toJson()).toList();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? fullName;
  String? email;
  int? planId;
  int? shopNumber;

  User({this.userId, this.fullName, this.email, this.planId, this.shopNumber});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullName = json['full_name'];
    email = json['email'];
    planId = json['plan_id'];
    shopNumber = json['shop_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['plan_id'] = this.planId;
    data['shop_number'] = this.shopNumber;
    return data;
  }
}

class Shops {
  int? shopId;
  String? shopName;
  String? shopContactNumber;
  String? shopAddress;
  String? email;
  String? description;

  Shops(
      {this.shopId,
        this.shopName,
        this.shopContactNumber,
        this.shopAddress,
        this.email,
        this.description});

  Shops.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopContactNumber = json['shop_contact_number'];
    shopAddress = json['shop_address'];
    email = json['email'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_contact_number'] = this.shopContactNumber;
    data['shop_address'] = this.shopAddress;
    data['email'] = this.email;
    data['description'] = this.description;
    return data;
  }
}


class Employee {
  int? id;
  String? employeeId;
  String? employeeName;
  String? email;
  String? salary;
  String? shiftType;
  String? shiftTiming;
  String? employmentType;
  String? password;
  int? shopId;
  String? designation;
  String? profileImage;

  Employee(
      {this.id,
        this.employeeId,
        this.employeeName,
        this.email,
        this.salary,
        this.shiftType,
        this.shiftTiming,
        this.employmentType,
        this.password,
        this.shopId,
        this.designation,
        this.profileImage});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    email = json['email'];
    salary = json['salary'];
    shiftType = json['shift_type'];
    shiftTiming = json['shift_timing'];
    employmentType = json['employment_type'];
    password = json['password'];
    shopId = json['shop_id'];
    designation = json['designation'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['email'] = this.email;
    data['salary'] = this.salary;
    data['shift_type'] = this.shiftType;
    data['shift_timing'] = this.shiftTiming;
    data['employment_type'] = this.employmentType;
    data['password'] = this.password;
    data['shop_id'] = this.shopId;
    data['designation'] = this.designation;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
