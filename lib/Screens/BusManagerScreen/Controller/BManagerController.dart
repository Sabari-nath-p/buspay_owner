import 'dart:convert';

import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusListModel.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusModel.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusPreferences.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Controllers/DBController.dart';
import 'package:buspay_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class BMController extends GetxController {
  bool isLoading = true;
  List<BusListModel> busList = [];
  List<BusPreferences> preferenceList = [];
  
  Future<void> fetchBusData() async {
    isLoading = true;
    busList.clear();
    update();
    final String apiUrl = '$baseUrl/v1/bus';
    try {
      final response = await get(Uri.parse(apiUrl),headers: authHeader);
       print('Bus Data Response: ${response.body}');
      if (response.statusCode == 200) {
        for (var data in jsonDecode(response.body)['data']) {
          busList.add(BusListModel.fromJson(data));
        }
      }
    } catch (e) {
      print('Error fetching bus data: $e');
    }
    isLoading = false;
    update();

    print(busList);
  }

  Future<void> fetchBusPreferences() async {
    final response = await get(Uri.parse(baseUrl + '/v1/preference'), headers: authHeader);
     print('Bus Preferences Response: ${response.body}');
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body)["data"])
        preferenceList.add(BusPreferences.fromJson(data));
    } else {
      throw Exception('Failed to load bus preferences');
    }

    update();
    print('Response: ${response.body}');
  }

  Future<void> createBus(var busData) async {
    isLoading = true;
    update();
    try {
      final response = await post(
        Uri.parse(baseUrl + '/v1/bus'),
    
        headers: authToken,
        body: json.encode(busData),
      );
      
      if (response.statusCode == 201) {
        Get.back();
        fetchBusData();
      } else {
        Fluttertoast.showToast(msg: "'Error: ${response.body}'");
       
      }
       print("Response:${response.body}");

    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to create bus. Please try again.");
    }
    isLoading = false;
    update();
  }

  Future fetchBus(int busid) async {
    final response =
        await get(Uri.parse(baseUrl + '/v1/bus/$busid'), headers: authToken);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return BusModel.fromJson(data["data"]);
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchBusData();
    fetchBusPreferences();
  }
}
