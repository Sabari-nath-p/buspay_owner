import 'dart:convert';

import 'package:buspay_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  List selectedPreferences = [];
  List districts = [];
  List busTypes = [];
  List preferences = [];
  final TextEditingController busNameController = TextEditingController();
  final TextEditingController rcNumberController = TextEditingController();
  final TextEditingController seatingCapacityController =TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDistricts();
    fetchBusTypes();
    fetchBusPreferences();
  }

  Future<void> fetchDistricts() async {
    final response = await http.get(Uri.parse(baseUrl + '/v1/districts'));
    if (response.statusCode == 200) {
      setState(() {
        districts = json.decode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load districts'); 
    }
  }

  Future<void> fetchBusTypes() async {
    final response = await http.get(Uri.parse(baseUrl + '/v1/bus-type'));
    if (response.statusCode == 200) {
      setState(() {
        busTypes = json.decode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load bus types');
    }
  }

  Future<void> fetchBusPreferences() async {
    final response =
        await http.get(Uri.parse(baseUrl +'/v1/preference'));
    if (response.statusCode == 200) {
      setState(() {
        preferences = json.decode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load bus preferences');
    }
  }

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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all data')),
      );
      return;
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken").toString();
    if (token == null || token.isEmpty) {
      print("Token is missing or invalid.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not authenticated. Please login.')),
      );
      return;
    }
    final busData = {
      'name': busNameController.text,
      'bus_no': rcNumberController.text,
      'no_of_seats': int.parse(seatingCapacityController.text),
      // 'state': selectedState,
      'district_id': selectedDistrict,
      'bus_type_id': selectedBusType,
      'prefernce_ids': selectedPreferences.map((value) => value["id"]).toList(),
    };
    print("Authorization Token: Bearer $token");
    print("Requesting with data: $busData");
    try {
      final response = await http.post(
        Uri.parse(baseUrl + '/v1/bus'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(busData),
      );

      print('Request Data: ${json.encode(busData)}');

      print('Response Code: ${response.statusCode}');
      print('Response Body: ${response.body}');


      if (response.statusCode == 201) {

        widget.fetchNotifier.value+=1;
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error during request: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to create bus. Please try again.')),
      );
    }
  }

  Widget buildTextField({
    required String labelText,
    required String hintText,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(
          labelText,
          style:
              GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 48.h,
          width: 327.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromRGBO(242, 244, 245, 1)),
          ),
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
            style: GoogleFonts.inter(
              color: const Color.fromRGBO(27, 27, 27, 1),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget buildDropdown(
      {required String labelText,
      required String hintText,
      var value,
      required List items,
      required Function(dynamic) onChanged,
      String fieldName = "",
      String keyId = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(
          labelText,
          style:
              GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 48.h,
          width: 327.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromRGBO(242, 244, 245, 1)),
          ),
          child: DropdownButtonFormField<dynamic>(
            value: value,
            decoration: InputDecoration(
              isCollapsed: true,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem(
                value: (keyId == "") ? item : item[keyId],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Text(
                    (fieldName == "") ? item : item[fieldName],
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
        title: const Text(
          'Create Bus',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
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
              buildTextField(
                labelText: 'Bus Name*',
                hintText: 'Enter bus name',
                controller: busNameController,
              ),
              buildTextField(
                labelText: 'RC Number*',
                hintText: 'Enter bus RC number',
                controller: rcNumberController,
              ),
              buildDropdown(
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
              buildDropdown(
                labelText: 'District*',
                hintText: 'Select route district',
                value: selectedDistrict,
                items: districts,
                fieldName: 'name',
                keyId: 'id',
                onChanged: (newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                  });
                },
              ),
              buildTextField(
                labelText: 'Seating Capacity*',
                hintText: 'Enter seating capacity',
                controller: seatingCapacityController,
              ),
              buildDropdown(
                labelText: 'Bus Type',
                hintText: 'Select route',
                value: selectedBusType,
                items: busTypes,
                fieldName: 'type',
                keyId: 'id',
                onChanged: (newValue) {
                  setState(() {
                    selectedBusType = newValue;
                  });
                },
              ),
              const Text(
                'Bus Preference*',
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              SizedBox(height: 8.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: preferences.map((pref) {
                    bool isSelected = selectedPreferences.contains(pref);
                    return GestureDetector(
                      onTap: () => toggleBusPreference(pref),
                      child: Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 4.h),
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
                        child: Center(
                          child: Text(
                            pref["name"],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontFamily: "Inter",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
                    minimumSize: Size(327.w, 48.h),
                  ),
                  onPressed: createBus,
                  child: const Text(
                    'Create Bus',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
