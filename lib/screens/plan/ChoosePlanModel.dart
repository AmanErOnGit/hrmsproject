class ChoosePlanModel {
  String? status;
  String? message;
  List<Plans>? plans;

  ChoosePlanModel({this.status, this.message, this.plans});

  ChoosePlanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  int? id;
  String? planName;
  String? price;
  int? shopNumber;
  int? employeeLimit;

  Plans(
      {this.id,
        this.planName,
        this.price,
        this.shopNumber,
        this.employeeLimit});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planName = json['plan_name'];
    price = json['price'];
    shopNumber = json['shop_number'];
    employeeLimit = json['employee_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_name'] = this.planName;
    data['price'] = this.price;
    data['shop_number'] = this.shopNumber;
    data['employee_limit'] = this.employeeLimit;
    return data;
  }
}
