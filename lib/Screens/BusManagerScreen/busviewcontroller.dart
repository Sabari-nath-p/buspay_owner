import 'dart:convert';
import 'package:http/http.dart' as http;

class busviewController {
  final String baseUrl;
  busviewController(this.baseUrl);

  Future<List<dynamic>> fetchDistricts() async {
    final response = await http.get(Uri.parse('$baseUrl/v1/districts'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load districts');
    }
  }

  Future<List<dynamic>> fetchBusTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/v1/bus-type'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load bus types');
    }
  }

  Future<List<dynamic>> fetchBusPreferences() async {
    final response = await http.get(Uri.parse('$baseUrl/v1/preference'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load bus preferences');
    }
  }
}
