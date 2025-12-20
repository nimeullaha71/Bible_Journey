import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/services/local_storage_service.dart';
import '../models/devotion_model.dart';
import 'package:bible_journey/app/Urls.dart';

class DevotionApi {
  static Future<DevotionResponse> getTodayDevotion(int journeyId, int dayId) async {
    final token = await LocalStorage.getToken();
    final url = "${Urls.baseUrl}/progress/today/devotion?journey_id=$journeyId&day_id=$dayId";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return DevotionResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch devotion");
    }
  }
}
