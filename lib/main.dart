import 'package:buspay_owner/Screens/AuthenticationScreen/AuthenticationScreen.dart';


import 'package:buspay_owner/Screens/DashboardScreen/DashboardScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "http://api.buspay.co";
String login = "";
var authHeader;
String? token;
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  login = preferences.getString("LOGIN") ?? "";
   token = preferences.getString("accessToken") ?? "";
  if(login == "IN")
  authHeader={
    "Authorization":"Bearer $token",
    "Content-Type":"application/json"
  };

  runApp(buspay_owner());
}

class buspay_owner extends StatelessWidget {
  const buspay_owner({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 850),
      builder: (context, child) => GetMaterialApp(
          home:   (login == "IN") ? DashboardScreen() :AuthenticationScreen()),
      
    );
  }
}
