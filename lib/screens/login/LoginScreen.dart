import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/screens/createuser/CreateUserScreen.dart';
import 'package:hrmsapp/screens/dashboard/dashboard_screen.dart';
import 'package:hrmsapp/screens/employee_dashboard/Employee_Dashboard_Screen.dart';
import 'package:hrmsapp/screens/login/LoginController.dart';
import 'package:hrmsapp/screens/signup/RegisterScreen.dart';
import 'package:hrmsapp/support/app_theme.dart';

class LoginScreen extends StatelessWidget {
  bool? isHr=true;
  LoginScreen({this.isHr,super.key});

  // Controllers for input fields


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Responsive sizing

    return GetBuilder(
        init: Get.put(LoginController(context)),
        builder: (controller) {
          return
            SafeArea(


              child: Scaffold(
                backgroundColor: Colors.white,
                body:

                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.05),

                        // App Logo
                        Image.asset(
                          ConstantImage.splashlogo,
                          // Add your logo in assets folder
                          height: size.height * 0.12,
                        ),

                        SizedBox(height: size.height * 0.02),

                        // Welcome Text
                        Text(
                          "Welcome Back !",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Login to continue using the app",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),

                        SizedBox(height: size.height * 0.05),

                        // Email Field
                        _buildTextField(
                          controller: controller.emailTextCon,
                          focusNode: controller.emailFocus,
                          hintText: "example@gmail.com",
                          icon: Icons.email_outlined,


                          obscureText: false,
                        ),

                        SizedBox(height: 20),

                        // Password Field
                        CustomWidget.textInputFiled(controller.passwordTextCon,
                            focusNode: controller.passwordFocus,
                            textAlign: TextAlign.left,
                            topPadding: 8,
                            leftPadding: 0,
                            rightPadding: 0,
                            bottomPadding: 0,
                            textInputType: TextInputType.text,
                            hintText: "**********",
                            fillColorFiled: true,
                            enableBorder: false,
                            fillColors: Colors.grey.shade100,
                            maxLine: 1,
                            passwordHide: controller.passwordHide,
                            prefixIconWidget: Icon(Icons.lock,color: AppColor.secondary,),
                            suffixIconWidget: InkWell(
                                onTap: (){
                                  controller.passwordHide=!controller.passwordHide;
                                  controller.update();
                                },
                                child: Icon(controller.passwordHide?Icons.visibility_off:Icons.visibility))
                        ),

                        SizedBox(height: 3),

                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {}, // Implement forgot password logic
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.02),

                        // Continue Button
                        ElevatedButton(
                          onPressed: () {
                            // Handle Login Logic
                            // print("Email: ${emailController.text}");
                            // print("Password: ${passwordController.text}");
                            if(controller.validation())
                            controller.getLoginDetail();
                          },
                          style: ElevatedButton.styleFrom(

                            backgroundColor: AppColor.primary,
                            minimumSize: Size(size.width, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),

                        SizedBox(height: size.height * 0.04),

                        // OR Login With
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.black26)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Or Login With",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.black26)),
                          ],
                        ),

                        SizedBox(height: size.height * 0.03),

                        // Google Login Button
                        OutlinedButton.icon(
                          onPressed: () {
                            // Handle Google Login
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(size.width, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: Image.asset(
                            ConstantImage.google, // Add Google icon in assets
                            height: 24,
                          ),
                          label: Text(
                            "Continue with Google",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),

                        SizedBox(height: size.height * 0.04),

                        // Sign Up Option
                        InkWell(
                          overlayColor: WidgetStatePropertyAll(Colors.transparent),
                          onTap: (){
                            Get.to(RegisterScreen(),
                                transition: Transition.rightToLeft,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.ease);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don’t have an account? "),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(RegisterScreen(),
                                        transition: Transition.rightToLeft,
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.ease);
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      color: Colors.green[600],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.05),
                      ],
                    ),
                  ),
                ),

              ),
            );
        }
    );
  }

  // TextField Builder Function
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    FocusNode? focusNode,
    required bool obscureText,
    Color iconColor = AppColor.primary
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
          focusNode: focusNode,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color:iconColor),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black45),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
