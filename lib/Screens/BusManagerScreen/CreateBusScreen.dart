import 'dart:convert';
import 'package:buspay_owner/Screens/BusManagerScreen/CreateBusController.dart';
import 'package:buspay_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:buspay_owner/Screens/BusManagerScreen/BusManagerScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateBusScreen extends StatefulWidget {
  const CreateBusScreen({Key? key}) : super(key: key);

  @override
  _CreateBusScreenState createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<CreateBusScreen> {
  String? selectedDistrict;
  String? selectedState;
  String? selectedBusType;
  final List<String> states = ['Kerala'];
  final Set<String> selectedPreferences = {};
  List<String> districts = [];
  List<String> busTypes = [];
  List<String> preferences = [];
  final TextEditingController busNameController = TextEditingController();
  final TextEditingController rcNumberController = TextEditingController();
  final TextEditingController seatingCapacityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDistricts();
    fetchBusTypes();
    fetchBusPreferences();
  }

  Future<void> fetchDistricts() async {
    final response = await http.get(Uri.parse(baseUrl +'/v1/districts'));
    if (response.statusCode == 200) {
      setState(() {
        districts = List<String>.from(json.decode(response.body)['data'].map((district) => district['name']));
      });
    } else {
      throw Exception('Failed to load districts');
    }
  }

  Future<void> fetchBusTypes() async {
    final response = await http.get(Uri.parse('http://api.buspay.co/v1/bus-type'));
    if (response.statusCode == 200) {
      setState(() {
        busTypes = List<String>.from(json.decode(response.body)['data'].map((busTypes) => busTypes['type']));
      });
    } else {
      throw Exception('Failed to load bus types');
    }
  }

  Future<void> fetchBusPreferences() async {
    final response = await http.get(Uri.parse('http://api.buspay.co/v1/preference'));
    if (response.statusCode == 200) {
      setState(() {
        preferences = List<String>.from(json.decode(response.body)['data'].map((pref) => pref['name']));
      });
    } else {
      throw Exception('Failed to load bus preferences');
    }
  }

  void toggleBusPreference(String preference) {
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
      final busData = {
      'bus_name': busNameController.text,
      'rc_number': rcNumberController.text,
      'seating_capacity': seatingCapacityController.text,
      'state': selectedState,
      'district': selectedDistrict,
      'bus_type': selectedBusType,
      'preferences': selectedPreferences.toList(),
    };

    final response = await http.post(
      Uri.parse(baseUrl+'/v1/bus'), 
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token' 
      },
      body: json.encode(busData),
    );
      print(busData);
    if (response.statusCode == 200) {
   
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BusManagerScreen()),
      );
    } else {
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to create bus. Please try again.')),
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
          style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 48.h,
          width: 327.w,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromRGBO(242, 244, 245, 1)),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
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

  Widget buildDropdown({
    required String labelText,
    required String hintText,
    String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(
          labelText,
          style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 48.h,
          width: 327.w,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromRGBO(242, 244, 245, 1)),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Text(
                    item,
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
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
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
              Row(
                children: preferences.map((pref) {
                  bool isSelected = selectedPreferences.contains(pref);
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => toggleBusPreference(pref),
                      child: Container(
                        height: 40.h,
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
                            pref,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontFamily: "Inter",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
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
