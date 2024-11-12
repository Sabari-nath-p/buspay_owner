 
import 'package:buspay_owner/Screens/BusManagerScreen/BusManagerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BusViewScreen extends StatefulWidget {
  const BusViewScreen({Key? key}) : super(key: key);

  @override
  _BusViewScreenState createState() => _BusViewScreenState();
}

class _BusViewScreenState extends State<BusViewScreen> {
  String? selectedState;
  String? selectedDistrict;
 Set<String> selectedDays = {};
  bool airBusSelected = false;
  bool acBusSelected = false;
  bool pushBackSeatSelected = false;

  final List<String> states = ['Kerala', 'Karnataka', 'Tamilnadu'];
  final List<String> districts = [];

  // Bus preference logic 
  
void selectBusPreference(String busType) {
    setState(() {
      airBusSelected = (busType == 'Air Bus');
      acBusSelected = (busType == 'AC Bus');
      pushBackSeatSelected = (busType == 'Push Back Seat');
    });
  }

  void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(50),
        bottom: Radius.circular(20),
      ),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(left: 36, top: 28, right: 36),
      child: Container(
        height: 562,
        width: 391,
        child: Column(
          children: [
            Text(
              'Add Bus Route',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Container(
                width: 97.w,
                height: 1.h,
                margin: EdgeInsets.only(bottom: 23.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                ),
              ),
            // Starting Time
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Starting Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 327,
              height: 48,
              child: TextField(
                controller: TextEditingController(text: '12:00:00 PM'),
                enabled: true,
                decoration: InputDecoration(
                  hintText: '12:00:00 PM',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            // Trip Day
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Trip Day',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8),
            // Days of the Week Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu'].map((day) {
                bool isSelected = selectedDays.contains(day);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected
                          ? selectedDays.remove(day)
                          : selectedDays.add(day);
                    });
                  },
                  child: Container(
                    height: 33,
                    width: 56,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color.fromRGBO(15, 103, 177, 1)
                          : Color.fromRGBO(221, 220, 220, 1),
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
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDays.contains('Fri')
                          ? selectedDays.remove('Fri')
                          : selectedDays.add('Fri');
                    });
                  },
                  child: Container(
                    height: 33,
                    width: 56,
                    decoration: BoxDecoration(
                      color: selectedDays.contains('Fri')
                          ? Color.fromRGBO(15, 103, 177, 1)
                          : Color.fromRGBO(221, 220, 220, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Fri',
                        style: TextStyle(
                          color: selectedDays.contains('Fri')
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDays.contains('Sat')
                          ? selectedDays.remove('Sat')
                          : selectedDays.add('Sat');
                    });
                  },
                  child: Container(
                    height: 33,
                    width: 56,
                    decoration: BoxDecoration(
                      color: selectedDays.contains('Sat')
                          ? Color.fromRGBO(15, 103, 177, 1)
                          : Color.fromRGBO(221, 220, 220, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Sat',
                        style: TextStyle(
                          color: selectedDays.contains('Sat')
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Select Route
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Route',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height:2),
            Container(
              width: 327,
              height: 48,
              child: TextField(
                controller: TextEditingController(text: 'Search Route'),
                enabled: true,
                decoration: InputDecoration(
                  hintText: 'Search Route',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                style: TextStyle(color: Colors.grey),
              ),
            ),
           // SizedBox(height: 2),
            // ListView for routes
            Expanded(
              child: ListView(
                shrinkWrap: true,
               // physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    title: Text(
                      'Haripad → Alappuzha',
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(96, 96, 96, 1),
                      ),
                    ),
                    leading: Radio(value: 1, groupValue: 1, onChanged: (value) {}),
                  ),
                  ListTile(
                    title: Text(
                      'Haripad → Alappuzha',
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(96, 96, 96, 1),
                      ),
                    ),
                    leading: Radio(value: 2, groupValue: 1, onChanged: (value) {}),
                  ),
                  ListTile(
                    title: Text(
                      'Haripad → Alappuzha',
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(96, 96, 96, 1),
                      ),
                    ),
                    leading: Radio(value: 3, groupValue: 1, onChanged: (value) {}),
                  ),
                ],
              ),
            ),
            // Create Bus Button
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 323.74,
                height: 40,
                margin: EdgeInsets.only(bottom: 5),
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.pop(context);
                  },
                  child: Text(
                    'Add Route',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(15, 103, 177, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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

  // Dropdown widget
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
               alignLabelWithHint: true,
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
             hint: Align( 
            alignment: Alignment.centerRight,
            child: Text(
              hintText,
              style: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
          ),
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
              ),
              buildTextField(
                labelText: 'RC Number',
                hintText: 'Enter bus RC number',
              ),
              buildDropdown(
                labelText: 'State',
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
                labelText: 'District',
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
                labelText: 'Seating Capacity',
                hintText: 'Enter seating capacity',
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
                children: [
                  buildPreferenceButton('Air Bus', airBusSelected),
                  SizedBox(width: 10.w),
                  buildPreferenceButton('AC Bus', acBusSelected),
                  SizedBox(width: 10.w),
                  buildPreferenceButton('Push Back Seat', pushBackSeatSelected),
                ],
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

  
  Widget buildPreferenceButton(String title, bool isSelected) {
    return GestureDetector(
      onTap: () => selectBusPreference(title),
      child: Container(
        height: 33.h,
        width: (title == 'Push Back Seat') ? 120.w : 87.w,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(15, 103, 177, 1)
              : const Color.fromARGB(255, 222, 222, 222),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? const Color.fromRGBO(255, 255, 255, 1)
                  : const Color.fromRGBO(60, 60, 67, 0.6),
            ),
          ),
        ),
      ),
    );
  }
}
