import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/screens/notification/NotificationController.dart';

import '../../support/app_theme.dart';

// Define the NotificationScreen as a StatelessWidget since the UI doesn't manage its own state
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using GetX to manage notification data
    final NotificationController controller = Get.put(NotificationController());

    return Scaffold(
      // AppBar for the top bar with back button and title
      appBar: AppBar(
        // Back button to navigate to the previous screen
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          // Back arrow icon
          onPressed: () {
            Get.back(); // Navigate back using GetX navigation
          },
        ),
        // Title of the screen, centered and styled
        title: const Text(
          'Notification', // Title text as per the design
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold), // Style for the title
        ),
        centerTitle: true,
        // Center the title in the AppBar
        backgroundColor: Colors.white,
        // White background for the AppBar
        elevation: 0, // No shadow under the AppBar
      ),
      // Set the background color of the entire screen
      backgroundColor: Colors.grey[100],
      // Light grey background as per the design
      // Body of the screen, using Obx to make the UI reactive to changes in the controller
      body: ListView.builder(
        // Padding around the list to match the design spacing
        padding: const EdgeInsets.all(16.0),
        // 16px padding on all sides
        // Number of items in the list, fetched from the controller
        itemCount: controller.notifications.length,
        // Total notifications from the controller
        // Builder function to create each notification item
        itemBuilder: (context, index) {
          // Get the notification data for the current index
          final notification = controller
              .notifications[index]; // Access notification from controller
          // Card widget to display each notification in a card-like container
          return Card(
            elevation: 2,
            // Slight shadow under the card
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Rounded corners for the card
            ),
            margin: const EdgeInsets.only(bottom: 16.0),
            // Space between cards (bottom margin)
            // Padding inside the card for content spacing
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              // 16px padding inside the card
              // Row to layout the icon and notification details side by side
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Align items at the top
                children: [
                  // Icon for the notification (green check or red cross)
                  Container(
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.all(4),
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Image.asset(ConstantImage.roundedshape),
                        notification.isPositive
                            ? Center(
                                child: Image.asset(
                                ConstantImage.refund,
                                width: 15,
                                height: 15,
                              ))
                            : Center(
                                child: Image.asset(
                                ConstantImage.blockleave,
                                width: 15,
                                height: 15,
                              ))
                      ],
                    ),
                  ),
                  // Space between the icon and the text
                  const SizedBox(width: 16),
                  // 16px horizontal spacing
                  // Expanded widget to take the remaining space for the notification details
                  Expanded(
                    // Column to stack the title, time, and description vertically
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Align text to the left
                      children: [
                        // Row to place the title and time side by side
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // Space between title and time
                          children: [
                            // Notification title
                            Text(
                              notification.title,
                              // Title from the notification model
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Sans",
                                // Font size for the title
                                fontWeight: FontWeight.w600, // Bold text
                              ),
                            ),
                            // Notification time
                            Text(
                              notification.time,
                              // Time from the notification model
                              style: const TextStyle(
                                fontFamily: "Sans", fontWeight: FontWeight.w400,
                                fontSize: 12, // Smaller font for the time
                                color: AppColor
                                    .textColor, // Grey color for the time
                              ),
                            ),
                          ],
                        ),
                        // Space between the title/time row and the description
                        SizedBox(height: 4), // 4px vertical spacing
                        // Notification description
                        Text(
                          notification.description,
                          // Description from the notification model
                          style: const TextStyle(
                            fontFamily: "Sans", fontWeight: FontWeight.w400,
                            fontSize: 12, // Font size for the description
                            color: AppColor
                                .textColor, // Grey color for the description
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
