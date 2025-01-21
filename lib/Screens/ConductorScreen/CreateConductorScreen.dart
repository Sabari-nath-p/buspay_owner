import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:buspay_owner/Screens/ConductorScreen/ConductorViewScreen.dart';
import 'package:buspay_owner/Src/appDropDown.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/appTextField.dart';
import 'package:buspay_owner/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CreateConductorScreen extends StatefulWidget {
 
  CreateConductorScreen({Key? key, }) : super(key: key) ;

  @override
  State<CreateConductorScreen> createState() => _CreateConductorScreenState();
}

class _CreateConductorScreenState extends State<CreateConductorScreen> {
  int? BusAssign;

  List Assign = [];

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final Response = await http.get(Uri.parse(baseUrl + "/v1/bus"));
    if (Response.statusCode == 200) {
      setState(() {
        Assign = json.decode(Response.body)["data"];
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Unable to load data")));
    }
  }

  Future <void> createconductor() async {
    if (namecontroller.text.isEmpty ||
        phcontroller.text.isEmpty ||
        mailcontroller.text.isEmpty ||
        Passwordcontroller.text.isEmpty ||
        confirmpasscontroller.text.isEmpty ||
        BusAssign == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please Fill all data")));
      return;
    }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("accessToken").toString();
    final conductor = {
      "name": namecontroller.text,
      "phone": phcontroller.text,
      "email": mailcontroller.text,
      "bus_id": BusAssign,
      "password": Passwordcontroller.text,
    };
    final Response = await http.post(
      Uri.parse(baseUrl + "/v1/user/add-new-conductor"),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      },
      body: json.encode(conductor),
    );
    print('Request Data: ${json.encode(conductor)}');

    print(token);

    print('Response Code: ${Response.statusCode}');
    print('Response Body: ${Response.body}');

    if (Response.statusCode == 201) {
      Navigator.pop(
        context,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create bus. Please try again.')),
      );
    }
    print(Response.body);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F67B1),
        title: Text(
          'Conductors',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right:20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 13,
                ),
                Apptextfield.primary(
                    labelText: "Conductor Name",
                    hintText: "Enter Conductor Name",
                    controller: namecontroller),
                Apptextfield.primary(
                    labelText: "Conductor Phone",
                    hintText: "Enter Conductor Phone",
                    controller: phcontroller),
                Apptextfield.primary(
                    labelText: "Conductor Mail",
                    hintText: "Enter Conductor mail",
                    controller: mailcontroller),
                Appdropdown.primary(
                    labelText: "Assigned Bus",
                    hintText: "Assigned bus",
                    items: Assign,
                    value: BusAssign,
                    fieldName: "name",
                    keyId: "id",
                    onChanged: (newValue) {
                      setState(() {
                        BusAssign = newValue;
                      });
                    }),
                Apptextfield.password(
                    labelText: "Password",
                    hintText: "Enter Password",
                    controller: Passwordcontroller),
                Apptextfield.password(
                    labelText: "Confirm Password",
                    hintText: "Enter Password",
                    controller: confirmpasscontroller),
                SizedBox(height: 105.h),
                Container(
                  width: 323.74.w,
                  height: 40.h,
                  margin: EdgeInsets.only(bottom: 23, left: 33, right: 33),
                  child: ElevatedButton(
                    onPressed: () {
                      if (Passwordcontroller.text == confirmpasscontroller.text)
                        createconductor();
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Incorrect password.')),
                        );
                      }
                    },
                    child: appText.primaryText(
                      text:'Create Conductor',
                     
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        //    fontFamily: "Poppins",
                        color: Color(0xFFFFFFFF),
                      
                      
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0F67B1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    
    );
  }
}