import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../app/Urls.dart';
import '../../../core/services/local_storage_service.dart';

class DeactivateAccountService {
  static Future<bool> deactivateAccount() async {
    final token = await LocalStorage.getToken();

    final response = await http.post(
      Uri.parse(Urls.disableAccountUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "active": "true",
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
