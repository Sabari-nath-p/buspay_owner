
import 'package:buspay_owner/Screens/BusManagerScreen/BusManagerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBusScreen extends StatefulWidget {
  const CreateBusScreen({Key? key}) : super(key: key);

  @override
  _CreateBusScreenState createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<CreateBusScreen> {
  String? selectedState;
  String? selectedDistrict;
  bool airBusSelected = false;
  bool acBusSelected = false;
  bool pushBackSeatSelected = false;

  final List<String> states = ['Kerala', 'Karnataka', 'Tamilnadu'];
  final List<String> districts = ['Alappuzha', 'Ernakulam', 'Malappuram'];

  // bus preference
  void selectBusPreference(String busType) {
    setState(() {
      airBusSelected = (busType == 'Air Bus');
      acBusSelected = (busType == 'AC Bus');
      pushBackSeatSelected = (busType == 'Push Back Seat');
    });
  }

  //  TextField widget
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
              ),
              buildTextField(
                labelText: 'RC Number*',
                hintText: 'Enter bus RC number',
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
                children: [
                  buildPreferenceButton('Air Bus', airBusSelected),
                  SizedBox(width: 10.w),
                  buildPreferenceButton('AC Bus', acBusSelected),
                  SizedBox(width: 10.w),
                  buildPreferenceButton('Push Back Seat', pushBackSeatSelected),
                ],
              ),
              SizedBox(height: 20.h),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By continuing, you agree to our ',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Terms of Service ',
                      style: TextStyle(fontSize: 13, color: Colors.blue),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(fontSize: 13, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
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
                      'Create Bus',
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
