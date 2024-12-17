 
import 'dart:convert';
import 'package:buspay_owner/Screens/BusManagerScreen/BottomSheetScreen.dart';
import 'package:http/http.dart' as http;
import 'package:buspay_owner/Screens/BusManagerScreen/BusManagerScreen.dart';
import 'package:buspay_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BusViewScreen extends StatefulWidget {
  var busData;
   BusViewScreen({Key? key, required String status, required this.busData}) : super(key: key);

  @override
  _BusViewScreenState createState() => _BusViewScreenState();
}

class _BusViewScreenState extends State<BusViewScreen> {
  String? selectedState;
  String? selectedDistrict;
   int? selectedBusType;
 //List<String> selectedDays = [];
  bool airBusSelected = false;
  bool acBusSelected = false;
  bool pushBackSeatSelected = false;
 
   
  final List<String> states = ['Kerala'];
   List districts = [];
   List selectedPreferences = [];
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
    busNameController.text = widget.busData["name"] ?? "";
    rcNumberController.text = widget.busData["bus_no"] ?? "";
    seatingCapacityController.text = (widget.busData["no_of_seats"]??"").toString();
    

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
    final response =
        await http.get(Uri.parse(baseUrl +'/v1/bus-type'));
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
        await http.get(Uri.parse(baseUrl+'v1/preference'));
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
  

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return AddBusRouteBottomSheet();  
    },
  );
}

  


//tetxtfeild
 
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

  

  // Dropdown 
  
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
        backgroundColor: Color.fromRGBO(252,252,252,1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
        title: const Text(
          'Bus View',
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
                labelText: 'Bus Name',
                hintText: 'Enter bus name',
                 controller: busNameController,
              ),
              buildTextField(
                labelText: 'RC Number',
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
                labelText: 'Seating Capacity',
                hintText: 'Enter seating capacity',
              ),
              buildDropdown(
                labelText: 'Bus  Type',
                hintText: 'Select route ',
                value: selectedDistrict,
                items: busTypes,
                fieldName: 'type',
                keyId: 'id',
                onChanged: (newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                  });
                },
              ),
              const Text(
                'Bus Preference',
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
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),
           


         Container(
          width: 350,
         // height:142,
          padding: EdgeInsets.only(left:16,top:10,right:16),
          decoration: BoxDecoration(
            color: Color.fromRGBO(221, 220, 220, 1),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,
              
              ),
            ],
          ),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bus Route',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color.fromRGBO(0,0,0,1),
                    ),
                  ),
               Container(
  width: 56,  
  height: 21,  
  decoration: BoxDecoration(
    color: Color.fromRGBO(15, 103, 177, 1),
    borderRadius: BorderRadius.circular(5),
  ),
  child: Center(
    child: TextButton(
      onPressed: () {
     _showBottomSheet(context);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, 
      ),
      child: Text(
        'Add',
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        textAlign: TextAlign.center, 
      ),
    ),
  ),
)


                ],
              ),
              Padding(
        padding:  EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),

      SizedBox(height: 5),
      


      Center(
        child: Column(
          children: [
            Icon(
              Icons.info,
              color: Colors.grey,
              size: 40,
            ),
                    SizedBox(height:10),
                    Text(
                      'Add Bus Route',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(141,141,141,1),
                        fontFamily: "Inter",
                      ),
                    ),

                   SizedBox(height:18),
                   
                  ],
                ),
              ),
            ],
          ),
        ),

          SizedBox(height:15),
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
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
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
              SizedBox(height:8),

                Center(
                  child: Text(
                                "Delete Bus",
                                style: TextStyle(
                  fontFamily: "Poppins",
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
