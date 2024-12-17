import 'package:buspay_owner/Screens/AuthenticationScreen/AuthenticationScreen.dart';
import 'package:buspay_owner/Screens/AuthenticationScreen/BusManagerScreen.dart';
import 'package:buspay_owner/Screens/AuthenticationScreen/HomeScreen.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/CreateBusScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';

  String baseUrl = "http://api.buspay.co"; 
  String login = "";
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  login = preferences.getString("LOGIN") ?? "";


  
  runApp(buspay_owner());
}

class buspay_owner extends StatelessWidget {
  const buspay_owner({super.key});
  @override
  Widget build(BuildContext context) {
      
    return ScreenUtilInit(
      designSize: const Size(390,850),
      builder : (context,child)=>MaterialApp( home: (login == "IN")? HomeScreen():AuthenticationScreen()),
    );
  }
}
