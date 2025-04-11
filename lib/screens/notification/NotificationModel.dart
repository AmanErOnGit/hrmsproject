import 'package:get/get.dart';

// Model class to represent a single notification
class NotificationModel {
  final String title; // Title of the notification (e.g., "Refund Under Process")
  final String description; // Description text of the notification
  final String time; // Time the notification was received (e.g., "05:57 Pm")
  final bool isPositive; // Flag to determine if the notification is positive (green check) or negative (red cross)

  // Constructor for the NotificationModel
  NotificationModel({
    required this.title, // Required title parameter
    required this.description, // Required description parameter
    required this.time, // Required time parameter
    required this.isPositive, // Required isPositive parameter
  });
}

// Controller class to manage the list of notifications using GetX
