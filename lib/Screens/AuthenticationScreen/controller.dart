import 'dart:convert';

import 'package:buspay_owner/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthenticationController {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final loginUrl = "$baseUrl/v1/auth/login";
    final body = jsonEncode({
      "email": email,
       "password": password});
    final headers = {
      "Content-Type": "application/json", 
      "app-type": "bus_owner"};

    try {
      final response = await http.post(Uri.parse(loginUrl), body: body, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 201 && data['message'] == 'Login successful') {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', data['tokens']['accessToken']);
        prefs.setString('user', data['user']['name']);
        prefs.setInt('user_id', data['user']['id']);
       prefs.setString("LOGIN", "IN");
        return {"success": true, "accessToken": data['tokens']['accessToken'], "user": data['user']};
      }
      return {"success": false, "error": data['message'] ?? "Login failed"};
    } catch (e) {
      return {"success": false, "error": "An error occurred: $e"};
    }
  }
}