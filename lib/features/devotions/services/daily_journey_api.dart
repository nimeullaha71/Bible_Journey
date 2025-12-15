import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/services/local_storage_service.dart';
import '../models/daily_journey_model.dart';
import '../../../app/Urls.dart';

class JourneyContentApi {
  static Future<JourneyContentResponse> getJourneyContent(int journeyId, int dayId) async {
    final token = await LocalStorage.getToken();
    final url = Uri.parse(Urls.dailyJourneyUrl);

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return JourneyContentResponse.fromJson(data);
    } else {
      throw Exception("Failed to load journey content");
    }
  }
}
