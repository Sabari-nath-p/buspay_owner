import 'dart:convert';
import 'package:buspay_owner/Screens/BusManagerScreen/Controller/BManagerController.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusListModel.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusModel.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusPreferences.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Controllers/DBController.dart';
import 'package:buspay_owner/Src/appButtons.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/appTextField.dart';
import 'package:buspay_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBusRouteBottomSheet extends StatefulWidget {
  const AddBusRouteBottomSheet({Key? key}) : super(key: key);

  @override
  _AddBusRouteBottomSheetState createState() =>
      _AddBusRouteBottomSheetState();
}

class _AddBusRouteBottomSheetState extends State<AddBusRouteBottomSheet> {
  List<String> selectedDays = [];
  List<RouteBus> routeList = [];
  int? selectedRouteId;  // Track the selected route id
  var busData;

  TextEditingController startTimeController = TextEditingController();
  TextEditingController finishTimeController = TextEditingController();
  TextEditingController routeSearchController = TextEditingController();

  final BMController _bmController = Get.find<BMController>();

  @override
  void initState() {
    super.initState();
    _fetchRouteList();
  }

  void _fetchRouteList() {
    // Fetch the bus data and extract the RouteBus data from the BusModel
    busData = _bmController.busList; // Get the bus data from the controller
    if (busData.isNotEmpty) {
      setState(() {
        routeList = busData[0].routeBus ?? []; // Assuming the busData has routeBus data
      });
    }
  }

  void _submitRoute(BuildContext context) async {
    const String apiUrl = "http://api.buspay.co/v1/route-bus";

    // Data to send
    Map<String, dynamic> requestData = {
      "bus_id": busData[0].id,  // Use the bus ID
      "route_id": selectedRouteId, // Use selectedRouteId
      "start_timing": startTimeController.text,
      "days_of_week": selectedDays,
      "finish_timing": finishTimeController.text,
    };

    try {
      final response = await post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print("Success: ${responseData['message']}");
        Navigator.pop(context);
      } else {
        print("Failed to add route: ${response.body}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  // Day selector widget
  Widget _buildDaySelector(dynamic func) {
    List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: days.map((day) {
        bool isSelected = selectedDays.contains(day);

        return GestureDetector(
          onTap: () {
            if (isSelected) {
              selectedDays.remove(day);
            } else {
              selectedDays.add(day);
            }
            func(() {});
          },
          child: Container(
            height: 33,
            width: 56,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromRGBO(15, 103, 177, 1)
                  : const Color.fromRGBO(221, 220, 220, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                day,
                style: GoogleFonts.poppins(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Route list builder widget
  Widget _buildRouteList() {
    return SizedBox(
      height: 150.h, // Set an appropriate height
      child: ListView.builder(
        shrinkWrap: true,  // Ensure it wraps its content when nested
        physics: NeverScrollableScrollPhysics(), // Disable scrolling inside SingleChildScrollView
        itemCount: routeList.length,
        itemBuilder: (context, index) {
          final route = routeList[index];
          return ListTile(
            title: Text(
              '${route.startTiming} → ${route.finishTiming}',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(96, 96, 96, 1),
              ),
            ),
            subtitle: Text(
              'Days: ${route.daysOfWeek!.join(', ')}',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
            ),
            leading: Radio(
              value: route.id,
              groupValue: selectedRouteId, // Track the selected route
              onChanged: (value) {
                setState(() {
                  selectedRouteId = value as int?;
                });
              },
            ),
          );
        },
      ),
    );
  }

  // Function to filter routes based on the search query
  void _filterRoutes(String query) {
    List<RouteBus> filteredRoutes = busData[0].routeBus!.where((route) {
      return route.startTiming!.toLowerCase().contains(query.toLowerCase()) ||
          route.finishTiming!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      routeList = filteredRoutes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: 390.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 28),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Add Bus Route',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 1,
                      width: 115,
                      color: Color.fromRGBO(166, 165, 165, 1),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Apptextfield.primary(
                    hintText: '12:00:00 PM',
                    controller: startTimeController,
                    labelText: 'Starting Time',
                  ),
                  Apptextfield.primary(
                    hintText: '12:00:00 PM',
                    controller: finishTimeController,
                    labelText: 'Finishing Time',
                  ),
                  const SizedBox(height: 10),
                  appText.primaryText(text: 'Trip Day'),
                  const SizedBox(height: 8),
                  _buildDaySelector(setState),
                  const SizedBox(height: 16),
                  Apptextfield.primary(
                    labelText: 'Search Route',
                    hintText: "Search route",
                    controller: routeSearchController,
                    onChanged: _filterRoutes, // This now works with the corrected _filterRoutes
                  ),
                  const SizedBox(height: 8),
                  _buildRouteList(),
                  const SizedBox(height: 16),
                  Center(
                    child: appButton.PrimaryButton(
                      name: 'Add Route',
                      onClick: () => _submitRoute(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
