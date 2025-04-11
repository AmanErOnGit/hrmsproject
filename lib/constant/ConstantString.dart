class ConstantString {
  static final String base_Url = "https://hrms.volvrit.in";

  static final String register = "${base_Url}/register.php";
  static final String login = "${base_Url}/login.php";
  static final String getPlan = "${base_Url}/get_plan.php";
  static final String createShop = "${base_Url}/create_shop.php";
  static final String fetch_user = "${base_Url}/fetch_user.php";
  static final String create_employee = "${base_Url}/create_employee.php";
  static final String fetch_employees = "${base_Url}/fetch_employees.php";
  static final String create_task = "${base_Url}/create_task.php";
  static final String fetch_task = "${base_Url}/fetch_task.php";
  static final String delete_employee = "${base_Url}/delete_employee.php";
  static final String select_plan = "${base_Url}/select_plan.php";
  static final String update_task_status = "${base_Url}/update_task_status.php";

  // static final String clientProjects="${base_Url}/client-projects";
  // static final String getCategoryWiseTask="${base_Url}/get-category-wise-task";
  // static final String getClientInfo="${base_Url}/get-client-info";
  // static final String feedback="${base_Url}/feedback";

  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';

  //------------Shared Preference----------
  static final String loginKey = "LOGIN_DETAIL_KEY";
  static final String language = "LANGUAGE";
}
