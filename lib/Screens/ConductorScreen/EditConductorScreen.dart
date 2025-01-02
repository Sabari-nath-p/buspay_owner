import 'package:buspay_owner/Screens/ConductorScreen/ConductorViewScreen.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditConductorScreen extends StatelessWidget {
  const EditConductorScreen({super.key});

  @override
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 13),
            _textfield("Conductor Name*", "Enter conductor name"),
            _textfield("Conductor Phone*", "Enter conductor phone"),
            _textfield("Conductor Email*", "Enter conductor email"),
            _textbox("Assigned Bus*", "Assign Bus"),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () {
                    _showResetPasswordSheet(
                        context); // This method will trigger the bottom sheet
                  },
                  child: Text(
                    "Reset Password",
                    style: GoogleFonts.poppins(
                      // fontFamily: "Poppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 200.h),
            Container(
              width: 323.74,
              height: 40,
              margin: EdgeInsets.only(bottom: 23, left: 33, right: 33),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConductorViewScreen(),
                    ),
                  );
                },
                child: Text(
                  'Update Conductor',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    //  fontFamily: "Poppins",
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
            Text(
              "Delete Conductor",
              style: GoogleFonts.poppins(
                //  fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Color.fromRGBO(221, 65, 65, 1),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  void _showResetPasswordSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      builder: (context) {
        return Container(
          height: 365.h,
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6.7,
                offset: Offset(0, -1),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              Text(
                "Reset Password",
                style: GoogleFonts.poppins(
                    // fontFamily: "Inter",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(9, 10, 10, 1)),
              ),
              Container(
                width: 97.w,
                height: 1.h,
                margin: EdgeInsets.only(bottom: 23.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                ),
              ),
              // SizedBox(height: 2.h),
              _textfield("New Password*", "Enter new password"),
              _textfield("Confirm Password*", "Confirm new password"),
              SizedBox(height: 9.h),
              Container(
                width: double.infinity,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConductorViewScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Reset Password',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      //  fontFamily: "Poppins",
                      color: Colors.white,
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
              SizedBox(height: 9.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Go Back",
                  style: GoogleFonts.poppins(
                    //fontFamily: "Poppins",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// TextField Widget
_textfield(String labelText, String hintText) {
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
          color: Color.fromARGB(255, 222, 222, 222),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
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
            color: Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      SizedBox(height: 10.h),
    ],
  );
}

// Dropdown Textbox Widget
_textbox(String labelText, String hintText) {
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
          color: Color.fromARGB(255, 222, 222, 222),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          underline: Container(),
          hint: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              hintText,
              style: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
          ),
          items: ["Air", "AC", "Non AC"].map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Text(
                  e,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ),
      SizedBox(height: 1.68.h),
    ],
  );
}
