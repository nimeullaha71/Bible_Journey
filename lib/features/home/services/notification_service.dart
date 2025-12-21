import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../app/Urls.dart';
import '../models/notification_model.dart';
import 'package:bible_journey/core/services/local_storage_service.dart';

class NotificationService {
  static Future<Map<String, List<NotificationModel>>> fetchNotifications() async {
    try {
      final token = await LocalStorage.getToken();

      if (token == null || token.isEmpty) {
        throw Exception("Auth token not found");
      }

      final response = await http.get(
        Uri.parse('${Urls.baseUrl}/notifications/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        final todayRaw = decoded['today'] ?? [];
        final yesterdayRaw = decoded['yesterday'] ?? [];

        return {
          "today": List<NotificationModel>.from(
            todayRaw.map((e) => NotificationModel.fromJson(e)),
          ),
          "yesterday": List<NotificationModel>.from(
            yesterdayRaw.map((e) => NotificationModel.fromJson(e)),
          ),
        };
      }

      else if (response.statusCode == 401) {
        throw Exception("Unauthorized (Invalid or Expired Token)");
      }

      else {
        throw Exception(
          "Server Error: ${response.statusCode} ${response.reasonPhrase}",
        );
      }
    } catch (e) {
      throw Exception("Notification API Error: $e");
    }
  }

  static Future<void> markAsRead(int notificationId) async {
    try {
      final token = await LocalStorage.getToken();
      if (token == null || token.isEmpty) throw Exception("Auth token not found");

      final response = await http.post(
        Uri.parse('${Urls.baseUrl}/notifications/read/$notificationId/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"is_read": true}),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to mark as read: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Mark as read error: $e");
    }
  }

  static Future<void> clearAll() async {
    try {
      final token = await LocalStorage.getToken();
      if (token == null || token.isEmpty) throw Exception("Auth token not found");

      final response = await http.post(
        Uri.parse('${Urls.baseUrl}/notifications/clear/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"is_read": true}),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to clear notifications: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Clear all notifications error: $e");
    }
  }

}
