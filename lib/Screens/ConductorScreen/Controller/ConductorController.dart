import 'dart:convert';
import 'package:buspay_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CreateConductorController extends GetxController {
  bool isLoading = false;
  List<dynamic> assignList = [];
  int? busAssign;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> fetchBusData() async {
    isLoading = true;
    update();
    final String apiUrl = '$baseUrl/v1/bus';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        assignList = json.decode(response.body)['data'];
      } else {
        Fluttertoast.showToast(msg: "Failed to fetch bus data.");
      }
    } catch (e) {
      print('Error fetching bus data: $e');
      Fluttertoast.showToast(msg: "Error fetching bus data.");
    }
    isLoading = false;
    update();
  }

  Future<void> createConductor() async {
    if (!_validateInput()) {
      Fluttertoast.showToast(msg: "Please fill all fields correctly.");
      return;
    }

    isLoading = true;
    update();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("accessToken");
      if (token == null) {
        Fluttertoast.showToast(msg: "User not authenticated.");
        return;
      }

      final conductorData = {
        "name": nameController.text,
        "phone": phoneController.text,
        "email": mailController.text,
        "bus_id": busAssign,
        "password": passwordController.text,
      };

      final response = await http.post(
        Uri.parse('$baseUrl/v1/user/add-new-conductor'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(conductorData),
      );

      if (response.statusCode == 201) {
        Get.back(); // Close the screen
        Fluttertoast.showToast(msg: "Conductor created successfully.");
      } else {
        Fluttertoast.showToast(msg: "Failed to create conductor.");
      }
    } catch (e) {
      print('Error creating conductor: $e');
      Fluttertoast.showToast(msg: "Error creating conductor.");
    }
    isLoading = false;
    update();
  }

  bool _validateInput() {
    return nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        mailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        busAssign != null &&
        passwordController.text == confirmPasswordController.text;
  }

  @override
  void onInit() {
    super.onInit();
    fetchBusData();
  }
}
