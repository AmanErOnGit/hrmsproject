class HrTaskModel {
  String? status;
  String? message;
  List<Tasks>? tasks;

  HrTaskModel({this.status, this.message, this.tasks});

  HrTaskModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasks {
  int? id;
  String? taskTitle;
  String? department;
  String? taskDescription;
  String? deadline;
  String? priority;
  String? createdAt;
  int? employeeId;
  String? employeeName;
  String? status;
  int? userId;
  int? shopId;

  Tasks(
      {this.id,
        this.taskTitle,
        this.department,
        this.taskDescription,
        this.deadline,
        this.priority,
        this.createdAt,
        this.employeeId,
        this.employeeName,
        this.status,
        this.userId,
        this.shopId});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskTitle = json['task_title'];
    department = json['department'];
    taskDescription = json['task_description'];
    deadline = json['deadline'];
    priority = json['priority'];
    createdAt = json['created_at'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    status = json['status'];
    userId = json['user_id'];
    shopId = json['shop_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task_title'] = this.taskTitle;
    data['department'] = this.department;
    data['task_description'] = this.taskDescription;
    data['deadline'] = this.deadline;
    data['priority'] = this.priority;
    data['created_at'] = this.createdAt;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    return data;
  }
}
