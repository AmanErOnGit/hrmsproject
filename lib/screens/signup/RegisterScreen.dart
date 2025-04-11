import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/screens/login/LoginScreen.dart';
import 'package:hrmsapp/screens/shop_entry/ShopEntryScreen.dart';

import '../../support/app_theme.dart';
import 'RegisterController.dart';

class RegisterScreen extends StatelessWidget {
  String? id;

  RegisterScreen({this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(RegisterController(context, id ?? "")),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        ConstantImage.splashlogo,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Create an Account",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Register to continue using the app",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Full Name Field
                    const Text(
                      "Full Name",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    _buildTextField(
                      controller: controller.nameTextFiledController,
                      focusNode: controller.nameFocus,
                      hintText: "Enter your name",
                      prefixIcon: Row(
                        children: [
                          Image.asset(ConstantImage.man_underline,
                              width: 20, height: 20),
                          Image.asset(ConstantImage.line,
                              color: AppColor.textColor, width: 20, height: 20),
                        ],
                      ),
                      textInputType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      autoFocus: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your full name";
                        }
                        return null;
                      },
                    ),

                    // Mobile Number Field
                    const SizedBox(height: 15),
                    const Text(
                      "Mobile Number",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),

                    _buildTextField(
                      controller: controller.numberTextFiledController,
                      focusNode: controller.numberFocus,
                      hintText: "Enter Phone Number",
                      prefixIcon: Row(
                        children: [
                          const Text("+91",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          Image.asset(ConstantImage.line,
                              width: 20, height: 20),
                        ],
                      ),
                      textInputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your mobile number";
                        } else if (value.length != 10) {
                          return "Mobile number must be 10 digits";
                        }
                        return null;
                      },
                    ),

                    // Email Field
                    SizedBox(height: 15),
                    Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),

                    _buildTextField(
                      controller: controller.emailTextFiledController,
                      hintText: "Enter your email",
                      prefixIcon: Row(
                        children: [
                          Image.asset(ConstantImage.email,
                              color: AppColor.primary, width: 20, height: 20),
                          Image.asset(ConstantImage.line,
                              color: AppColor.textColor, width: 20, height: 20),
                        ],
                      ),
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),

                    // Create Password Field
                    const SizedBox(height: 15),
                    const Text(
                      "Create Password",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),

                    _buildTextField(
                      controller: controller.passwordTextFiledController,
                      focusNode: controller.passwordFocus,
                      hintText: "Create Password",
                      prefixIcon: Row(
                        children: [
                          Image.asset(ConstantImage.password,
                              color: AppColor.primary, width: 20, height: 20),
                          Image.asset(ConstantImage.line,
                              color: AppColor.textColor, width: 20, height: 20),
                        ],
                      ),
                      passwordHide: controller.seePassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.seePassword = !controller.seePassword;
                          controller.update();
                        },
                        child: Icon(
                          controller.seePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey.shade500,
                          size: 20,
                        ),
                      ),
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please create a password";
                        } else if (value.length < 8) {
                          return "Password must be at least 6 characters";
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return "Password must contain at least one capital letter";
                        }
                        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                            .hasMatch(value)) {
                          return "Password must contain at least one special character";
                        }
                        return null;
                      },
                    ),

                    // Confirm Password Field
                    SizedBox(height: 15),
                    Text(
                      "Confirm Password",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),

                    _buildTextField(
                      controller: controller.confpasswordTextFiledController,
                      focusNode: controller.confpasswordFocus,
                      hintText: "Confirm Password",
                      prefixIcon: Row(
                        children: [
                          Image.asset(ConstantImage.password,
                              color: AppColor.primary, width: 20, height: 20),
                          Image.asset(ConstantImage.line,
                              color: AppColor.textColor, width: 20, height: 20),
                        ],
                      ),
                      passwordHide: controller.seePassword2,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.seePassword2 = !controller.seePassword2;
                          controller.update();
                        },
                        child: Icon(
                          controller.seePassword2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey.shade500,
                          size: 20,
                        ),
                      ),
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        } else if (value !=
                            controller.passwordTextFiledController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.validation()) {
                            controller.getRegister();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      onTap: (){
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                             Get.to(LoginScreen());
                            },
                            child: Text(
                              "Login.",
                              style: TextStyle(
                                color: Colors.green[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required Widget prefixIcon,
    FocusNode? focusNode,
    TextInputType? textInputType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    List<TextInputFormatter>? inputFormatters,
    bool autoFocus = false,
    bool passwordHide = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return CustomWidget.textInputFiled(
      controller,
      focusNode: focusNode,
      textAlign: TextAlign.left,
      hintText: hintText,
      enableBorder: false,
      topPadding: 0,
      cursorColor: Colors.black,
      prefixIconWidget: Container(
        width: 65,
        padding: const EdgeInsets.all(8),
        child: prefixIcon,
      ),
      suffixIconWidget: suffixIcon != null
          ? Container(
              width: 40,
              alignment: Alignment.center,
              child: suffixIcon,
            )
          : null,
      fillColors: AppColor.textfieldbg,
      fillColorFiled: true,
      textInputType: textInputType ?? TextInputType.text,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      autoFocus: autoFocus,
      passwordHide: passwordHide,
      maxLine: 1,
      validator: validator,
    );
  }
}
