import 'dart:convert';
import 'package:bible_journey/app/Urls.dart';
import 'package:http/http.dart' as http;

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
    final body = jsonEncode({
      "login_id":login_id ,
      "password": password,
    });

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }
}
