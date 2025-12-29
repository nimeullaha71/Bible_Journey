import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/services/local_storage_service.dart';
import 'package:bible_journey/app/Urls.dart';

class ActionApi {
  static Future<Map<String, dynamic>> getDayAction({
    required int journeyId,
    required int dayId,
  }) async {
    final token = await LocalStorage.getToken();

    final url =
        "${Urls.baseUrl}/progress/today/action?journey_id=$journeyId&day_id=$dayId";

    print("ACTION URL => $url");
    print("TOKEN => $token");

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    print("STATUS => ${response.statusCode}");
    print("BODY => ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "Status: ${response.statusCode}, Body: ${response.body}",
      );
    }
  }

}
