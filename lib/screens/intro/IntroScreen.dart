// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:hrmsapp/constant/ConstantImage.dart';
// import 'package:hrmsapp/constant/CustomWidget.dart';
// import 'package:hrmsapp/screens/disciplinary/DisciplineScreen.dart';
// import 'package:hrmsapp/support/app_theme.dart';
//
// class IntroScreen extends StatefulWidget {
//   IntroScreen({super.key,});
//
//   @override
//   State<IntroScreen> createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 70,
//           ),
//           Hero(tag: "intro", child: Image.asset(ConstantImage.intrologo)),
//           Padding(
//               padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
//               child: Text(
//                 "Welcome to Your HRMS App",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               )),
//           Padding(
//             padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
//             child: Text(
//               "This onboarding will introduce you to the app's core features, including profile management, "
//               "document retrieval, and request submissions. Follow the prompts to complete your setup.",
//               style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w400,
//                   color: AppColor.textColor),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                     child: CustomWidget.elevatedCustomButton(
//                         textColor: Colors.black, context, "I’m a HR", () {
//                   Get.to(DisciplineScreen(isHr: true,),
//                       transition: Transition.rightToLeft,
//                       duration: Duration(milliseconds: 400),
//                       curve: Curves.ease);
//                 }, bgColor: AppColor.white, borderColor: AppColor.boxBorder)),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                     child: CustomWidget.elevatedCustomButton(
//                         textColor: Colors.black, context, "I’m a Emloye", () {
//                   Get.to(DisciplineScreen(isHr: false),
//                       transition: Transition.rightToLeft,
//                       duration: Duration(milliseconds: 400),
//                       curve: Curves.ease);
//                 }, bgColor: AppColor.white, borderColor: AppColor.boxBorder)),
//               ],
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
