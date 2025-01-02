import 'dart:convert';

import 'package:buspay_owner/Screens/BusManagerScreen/Controller/BManagerController.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusPreferences.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Controllers/DBController.dart';
import 'package:buspay_owner/Src/appButtons.dart';
import 'package:buspay_owner/Src/appDropDown.dart';
import 'package:buspay_owner/Src/appTextField.dart';
import 'package:buspay_owner/Src/utils.dart';
import 'package:buspay_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class CreateBusScreen extends StatefulWidget {
  ValueNotifier fetchNotifier;
  CreateBusScreen({Key? key, required this.fetchNotifier}) : super(key: key);

  @override
  _CreateBusScreenState createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<CreateBusScreen> {
  int? selectedDistrict;
  String? selectedState;
  int? selectedBusType;
  final List<String> states = ['Kerala'];
  List<BusPreferences> selectedPreferences = [];

  final TextEditingController busNameController = TextEditingController();
  final TextEditingController rcNumberController = TextEditingController();
  final TextEditingController seatingCapacityController =
      TextEditingController();

  void toggleBusPreference(preference) {
    setState(() {
      if (selectedPreferences.contains(preference)) {
        selectedPreferences.remove(preference);
      } else {
        selectedPreferences.add(preference);
      }
    });
  }

  Future<void> createBus() async {
    if (busNameController.text.isEmpty ||
        rcNumberController.text.isEmpty ||
        seatingCapacityController.text.isEmpty ||
        selectedState == null ||
        selectedDistrict == null ||
        selectedBusType == null) {
    Fluttertoast.showToast(msg: "Please fill all data");  
      return;
    }
    final busData = {
      'name': busNameController.text,
      'bus_no': rcNumberController.text,
      'no_of_seats': int.parse(seatingCapacityController.text),
      // 'state': selectedState,
      'district_id': selectedDistrict,
      'bus_type_id': selectedBusType,
      'prefernce_ids': selectedPreferences.map((value) => value.id).toList(),
    };

    bmctrl.createBus(busData);
  }

  BMController bmctrl = Get.put(BMController());
  DBController dbctrl = Get.put(DBController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
        title: Text(
          'Create Bus',
          style: GoogleFonts.poppins(
            color: Colors.white,
            // fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 21,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Apptextfield.primary(
                labelText: 'Bus Name*',
                hintText: 'Enter bus name',
                controller: busNameController,
              ),
              Apptextfield.primary(
                labelText: 'RC Number*',
                hintText: 'Enter bus RC number',
                controller: rcNumberController,
              ),
              Appdropdown.primary(
                labelText: 'State*',
                hintText: 'Select route state',
                value: selectedState,
                items: states,
                onChanged: (newValue) {
                  setState(() {
                    selectedState = newValue;
                  });
                },
              ),
              Appdropdown.primary(
                labelText: 'District*',
                hintText: 'Select route district',
                value: selectedDistrict,
                items: dbctrl.districts.map((value) => value.toJson()).toList(),
                fieldName: 'name',
                keyId: 'id',
                onChanged: (newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                  });
                },
              ),
              Apptextfield.primary(
                labelText: 'Seating Capacity*',
                hintText: 'Enter seating capacity',
                controller: seatingCapacityController,
              ),
              Appdropdown.primary(
                labelText: 'Bus Type',
                hintText: 'Select route',
                value: selectedBusType,
                items: dbctrl.bustypes.map((value) => value.toJson()).toList(),
                fieldName: 'type',
                keyId: 'id',
                onChanged: (newValue) {
                  setState(() {
                    selectedBusType = newValue;
                  });
                },
              ),
              Text(
                'Bus Preference*',
                style: GoogleFonts.poppins(
                  //   fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 5.w,
                runSpacing: 10.h,
                children: bmctrl.preferenceList.map((pref) {
                  bool isSelected = selectedPreferences.contains(pref);
                  return GestureDetector(
                    onTap: () => toggleBusPreference(pref),
                    child: Container(
                      height: 40.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color.fromRGBO(15, 103, 177, 1)
                            : const Color.fromRGBO(246, 248, 250, 1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? const Color.fromRGBO(15, 103, 177, 1)
                              : const Color.fromRGBO(242, 244, 245, 1),
                        ),
                      ),
                      child: Text(
                        pref.name ?? "",
                        style: GoogleFonts.poppins(
                          color: isSelected ? Colors.white : Colors.black,
                          //  fontFamily: "Inter",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),
              appButton.PrimaryButton(
                  name: "Create Bus",
                  loading: bmctrl.isLoading,
                  onClick: () {
                    createBus();
                  }),
              SpacerH(20.h)
            ],
          ),
        ),
      ),
    );
  }
}
