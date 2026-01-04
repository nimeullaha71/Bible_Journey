 import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../app/Urls.dart';
import '../../../core/services/local_storage_service.dart';

class ProgressApi {

  static Future<void> completeStep({
    required int dayId,
    required String itemType,
  }) async {

    final token = await LocalStorage.getToken();

    final url = Uri.parse(Urls.stepCompletedUrl);

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "day_id": dayId,
        "item_type": itemType,
      }),
    );

    if (response.statusCode != 200 &&
        response.statusCode != 201) {
      throw Exception("Failed to complete $itemType");
    }
  }
}
