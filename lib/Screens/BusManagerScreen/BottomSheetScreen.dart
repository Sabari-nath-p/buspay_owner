import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AddBusRouteBottomSheet extends StatefulWidget {
  const AddBusRouteBottomSheet({Key? key}) : super(key: key);

  @override
  _AddBusRouteBottomSheetState createState() =>
      _AddBusRouteBottomSheetState();
}
class _AddBusRouteBottomSheetState extends State<AddBusRouteBottomSheet> {
  List<String> selectedDays = [];
var busData;

 TextEditingController startTimeController = TextEditingController();
  TextEditingController finishTimeController = TextEditingController();
  TextEditingController routeSearchController = TextEditingController();
  List<dynamic> routeList = [];



  void _submitRoute(BuildContext context) async {
  const String apiUrl ="http://api.buspay.co/v1/route-bus";


  // Data to send
  Map<String, dynamic> requestData = {
   "bus_id": busData["id"],
    "route_id": 1,
    "start_timing": startTimeController.text,
    "days_of_week": selectedDays,
    "finish_timing": finishTimeController.text,
  };

  try {
    final response = await http.post(
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

//label
Widget _buildLabel(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}

//  TextField
Widget _buildTextField(String hint, TextEditingController controller) {
  return Container(
    width: double.infinity,
    height: 48,
    child: TextField(
      controller: TextEditingController(text: hint),
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      style: const TextStyle(color: Colors.grey),
    ),
  );
}


//dayselector
Widget _buildDaySelector(dynamic func) {
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  
  return Wrap(
    spacing: 8,
    runSpacing: 8,
    children: days.map((day) {
      bool isSelected = selectedDays.contains(day); 

      return GestureDetector(
        onTap: () {
      print("workingsss");
           
            if (isSelected) {
              selectedDays.remove(day); 
            } else {
              selectedDays.add(day); 
            }
        func((){});
        print(selectedDays);
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
              style: TextStyle(
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


//  Route List
Widget _buildRouteList() {
  return Expanded(
    child: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          title: const Text(
            'Haripad → Alappuzha',
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(96, 96, 96, 1),
            ),
          ),
          leading: Radio(
            value: index + 1,
            groupValue: 1, 
            onChanged: (value) {},
          ),
        );
      },
    ),
  );
}

//  Elevated Button
Widget _buildElevatedButton({required String label, required VoidCallback onPressed}) {
  return SizedBox(
    width: double.infinity,
    height: 40,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins",
          color: Colors.white,
        ),
      ),
    ),
  );
}

  
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 28),
      child: SizedBox(
        height: 562,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    'Add Bus Route',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
            const SizedBox(height: 23),
            _buildLabel('Starting Time'),
            const SizedBox(height: 8),
            _buildTextField('12:00:00 PM',startTimeController),
            const SizedBox(height: 23),
            _buildLabel('Finishing Time'),
            const SizedBox(height: 8),
            _buildTextField('12:00:00 PM',finishTimeController),
            const SizedBox(height: 16),
            _buildLabel('Trip Day'),
            const SizedBox(height: 8),
            _buildDaySelector(setState), 
            const SizedBox(height: 16),
            _buildLabel('Select Route'),
            const SizedBox(height: 8),
            _buildTextField('Search Route',routeSearchController),
            const SizedBox(height: 8),
            _buildRouteList(),
            const SizedBox(height: 16),
            Center(
              child: _buildElevatedButton(
                label: 'Add Route',
                onPressed: () => _submitRoute(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}