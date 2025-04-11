



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/model/LoginModel.dart';
import 'package:hrmsapp/screens/employee_list/EmployeeListScreen.dart';
import 'package:hrmsapp/screens/shop_list/ShopListController.dart';

import '../../constant/ConstantImage.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(ShopListController(context)),
        builder: (controleler){
      return Scaffold(
        body: Column(
          children: [
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    overlayColor:
                    const WidgetStatePropertyAll(Colors.transparent),
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Image.asset(
                        ConstantImage.backarrow,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "Shop List",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
            ),
            if(controleler.loginModel.shops!=null)
            Expanded(
              child: ListView.builder(
                itemCount: controleler.loginModel.shops!.length,
                padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                itemBuilder: (BuildContext context, int index) {
                  Shops model=controleler.loginModel.shops![index];
                  return  buildShopCard(
                    shopName:model.shopName??"",
                    address: model.shopAddress??"",
                    description:model.description??"",
                    // employeeCount: model.,
                    onSeeAllTap: () {
                      // Navigate or perform action
                      Get.to(EmployeeListScreen((model.shopId??"").toString()));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }


  Widget buildShopCard({
    required String shopName,
    required String address,
    required String description,
    // required int employeeCount,
    required VoidCallback onSeeAllTap,
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon container
                Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/shop.png"),
                ),
                const SizedBox(width: 16),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(shopName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text("Shop Address – $address",
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 4),
                      Text("Description – $description",
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 4),
                      // RichText(
                      //   text: TextSpan(
                      //     text: "Employee– ",
                      //     style: const TextStyle(color: Colors.grey),
                      //     children: [
                      //       TextSpan(
                      //         text: "$employeeCount",
                      //         style: const TextStyle(
                      //             color: Colors.black, fontWeight: FontWeight.bold),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            InkWell(
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              onTap: onSeeAllTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("See all Employee",
                        style: TextStyle(color: Colors.grey)),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
