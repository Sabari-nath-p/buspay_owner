import 'dart:convert';
import 'package:buspay_owner/Screens/BusManagerScreen/BottomSheetScreen.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Controller/BManagerController.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusModel.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Views/busRouteListView.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Controllers/DBController.dart';
import 'package:buspay_owner/Src/appDropDown.dart';
import 'package:buspay_owner/Src/appTextField.dart';
import 'package:buspay_owner/Src/utils.dart';
import 'package:buspay_owner/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:buspay_owner/Screens/BusManagerScreen/BusManagerScreen.dart';
//import 'package:buspay_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BusViewScreen extends StatefulWidget {
  int busID;
  BusViewScreen({Key? key, required this.busID}) : super(key: key);

  @override
  _BusViewScreenState createState() => _BusViewScreenState();
}

class _BusViewScreenState extends State<BusViewScreen> {
  String? selectedState;
  int? selectedDistrict;
  int? selectedBusType;

  final List<String> states = ['Kerala'];
  List districts = [];
  List selectedPreferences = [];
  List busTypes = [];
  List preferences = [];
  final TextEditingController busNameController = TextEditingController();
  final TextEditingController rcNumberController = TextEditingController();
  final TextEditingController seatingCapacityController =
      TextEditingController();
  BusModel? model;
  @override
  void initState() {
    super.initState();
    loadBus();
  }

  loadBus() async {
    model = await bmctrl.fetchBus(widget.busID);

    if (model != null) {
      busNameController.text = model!.name ?? "";
      rcNumberController.text = model!.busNo ?? "";
      seatingCapacityController.text =
          model!.noOfSeats.toString().replaceAll("null", "0");

      selectedDistrict = model!.districtId;
      selectedBusType = model!.busTypeId;
      setState(() {});
    }
  }

  BMController bmctrl = Get.put(BMController());

  DBController dbctrl = Get.put(DBController());
  void toggleBusPreference(preference) {
    setState(() {
      if (selectedPreferences.contains(preference)) {
        selectedPreferences.remove(preference);
      } else {
        selectedPreferences.add(preference);
      }
    });
  }

//tetxtfeild

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
        title: Text(
          'Bus View',
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
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
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
              // Appdropdown.primary(
              //   labelText: 'State*',
              //   hintText: 'Select route state',
              //   value: selectedState,
              //   items: states,
              //   onChanged: (newValue) {
              //     setState(() {
              //       selectedState = newValue;
              //     });
              //   },
              // ),
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
                'Bus Preference',
                style: GoogleFonts.poppins(
                  //fontFamily: "Inter",
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
              SpacerH(20.h),
              if (model != null)
                BusRouteListView(
                  model: model!,
                ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 323.74.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusManagerScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Update',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        //   fontFamily: "Poppins",
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  "Delete Bus",
                  style: GoogleFonts.poppins(
                    // fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color.fromRGBO(221, 65, 65, 1),
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
