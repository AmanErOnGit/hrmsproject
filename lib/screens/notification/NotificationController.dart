import 'package:get/get.dart';
import 'package:hrmsapp/screens/notification/NotificationModel.dart';

class NotificationController extends GetxController {
  // Reactive list of notifications using RxList (Observable) to update the UI automatically
  var notifications = <NotificationModel>[].obs; // Initialize an empty observable list

  // Lifecycle method that runs when the controller is initialized
  @override
  void onInit() {
    super.onInit();
    // Add sample notifications to the list when the controller is initialized
    notifications.addAll([
      // First notification (Refund Under Process)
      NotificationModel(
        title: 'Refund Under Process', // Title of the first notification
        description:
        'Lorem Ipsum Dolor Sit Amet. Et Architecto Sequi Sed Aperiam Autem Ea Consequuntur Vero Ut Omnis Sint Qui Voluptate Quidem In Deserunt Recusandae.', // Description text
        time: '05:57 Pm', // Time of the notification
        isPositive: true, // Positive notification (green checkmark)
      ),
      // Second notification (Your Leave Is Cancelled)
      NotificationModel(
        title: 'Your Leave Is Cancelled', // Title of the second notification
        description:
        'Lorem Ipsum Dolor Sit Amet. Et Architecto Sequi Sed Aperiam Autem Ea Consequuntur Vero Ut Omnis Sint Qui Voluptate Quidem In Deserunt Recusandae.', // Description text
        time: '05:57 Pm', // Time of the notification
        isPositive: false, // Negative notification (red cross)
      ),
    ]);
  }

  // Method to add a new notification to the list (for future use)
  void addNotification({
    required String title, // Title of the new notification
    required String description, // Description of the new notification
    required String time, // Time of the new notification
    required bool isPositive, // Positive or negative flag
  }) {
    // Add the new notification to the observable list
    notifications.add(NotificationModel(
      title: title, // Set the title
      description: description, // Set the description
      time: time, // Set the time
      isPositive: isPositive, // Set the positive/negative flag
    ));
  }
}