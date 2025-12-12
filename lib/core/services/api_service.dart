import 'dart:convert';
import 'package:bible_journey/app/Urls.dart';
import 'package:http/http.dart' as http;
import 'local_storage_service.dart';

class ApiServices{

  static Future<Map<String, dynamic>?> getProfile() async {
    final token = await LocalStorage.getToken();

    final url = Uri.parse(Urls.profileUrl);

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Profile Error: ${response.statusCode}");
      print(response.body);
      return null;
    }
  }
}