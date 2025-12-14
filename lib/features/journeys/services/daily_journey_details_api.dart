import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/daily_journey_details_model.dart';
import '../../../app/Urls.dart';
import '../../../core/services/local_storage_service.dart';

class DailyJourneyApi {
  static Future<DailyJourneyResponse> getDailyJourney(int journeyId) async {
    final token = await LocalStorage.getToken();
    final url = Uri.parse(Urls.dailyJourneyDetailsUrl);

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    print("DailyJourney API URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");


    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return DailyJourneyResponse.fromJson(data);
    } else {
      throw Exception("Failed to load daily journey");
    }
  }
}
