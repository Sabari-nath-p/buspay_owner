import 'dart:convert';

import 'package:buspay_owner/Screens/DashboardScreen/Models/BusTypeModel.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Models/DisctrictModel.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Models/RouteModel.dart';
import 'package:buspay_owner/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

var authToken;

class DBController extends GetxController {
  List<DistrictDataModel> districts = [];
  List<BusTypeModel> bustypes = [];
  List<RouteModel> RouteList = [];

  Future<void> fetchDistricts() async {
    districts.clear();
    final response = await get(Uri.parse(baseUrl + '/v1/districts'));
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body)['data']) {
        districts.add(DistrictDataModel.fromJson(data));
      }
    } else {
      throw Exception('Failed to load districts');
    }
    update();
  }

  Future<void> fetchBusTypes() async {
    final response = await get(Uri.parse(baseUrl + '/v1/bus-type'));
    if (response.statusCode == 200) {
      // busTypes = json.decode(response.body)['data'];

      for (var data in json.decode(response.body)["data"])
        bustypes.add(BusTypeModel.fromJson(data));
    } else {
      throw Exception('Failed to load bus types');
    }
    update();
  }

  int districtToID(var name) {
    for (var data in districts) {
      if (data.name == name) {
        return data.id ?? -1;
      }
    }
    return -1;
  }

  String districtToName(var name) {
    for (var data in districts) {
      if (data.id.toString() == name.toString()) {
        return data.name ?? "";
      }
    }
    return "--:--";
  }

  int RouteToID(var name) {
    for (var data in RouteList) {
      if (data.name == name) {
        return data.id ?? -1;
      }
    }
    return -1;
  }

  String RouteToName(var name) {
    for (var data in RouteList) {
      if (data.id.toString() == name.toString()) {
        return data.name ?? "";
      }
    }
    return "--:--";
  }

  loadUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken").toString();
    authToken = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  fetchBusRoute() async {
    RouteList.clear();
    final response = await get(Uri.parse(baseUrl + '/v1/route'));
    if (response.statusCode == 200) {
      // busTypes = json.decode(response.body)['data'];

      for (var data in json.decode(response.body)["data"])
        RouteList.add(RouteModel.fromJson(data));
    } else {
      throw Exception('Failed to load bus types');
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUser();
    fetchDistricts();
    fetchBusTypes();
    fetchBusRoute();
  }
}
