import 'dart:convert';
import 'package:bible_journey/app/Urls.dart';
import 'package:http/http.dart' as http;

import 'local_storage_service.dart';

class AuthService {
  Future<Map<String, dynamic>> signup({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    final url = Uri.parse(Urls.signUpUrl);
    final body = jsonEncode({
      "full_name": fullName,
      "email": email,
      "phone": phone,
      "password": password,
      "confirm_password": confirmPassword,
    });

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Signup failed: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> login({
    required String login_id,
    required String password,
  }) async {
    final url = Uri.parse(Urls.signInUrl);
    final body = jsonEncode({"login_id": login_id, "password": password});

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data['status'] == 'success') {
      // Save token
      await LocalStorage.saveToken(data['token']);

      // Save email from login_id (যদি API থেকে email না আসে)
      await LocalStorage.saveEmail(login_id);

      return data;
    } else {
      throw Exception(data['message'] ?? "Email or Password is incorrect");
    }
  }



  Future<Map<String, dynamic>> logOut({required String email}) async {
    final token = await LocalStorage.getToken();
    final url = Uri.parse(Urls.logOutUrl);
    final body = jsonEncode({"email": email});

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: body,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("LogOut Failed : ${response.body}");
    }
  }
}
