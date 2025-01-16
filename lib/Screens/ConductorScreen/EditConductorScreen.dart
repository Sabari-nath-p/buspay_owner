import 'package:buspay_owner/Screens/ConductorScreen/ConductorViewScreen.dart';
import 'package:buspay_owner/Screens/ConductorScreen/Views/ResetPassword.dart';
import 'package:buspay_owner/Src/appDropDown.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/appTextField.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
           
            children: [
              SizedBox(height: 13),
              Apptextfield.primary(labelText: "Conductor Name*", hintText: "Enter conductor name"),
              Apptextfield.primary(labelText: "Conductor Phone*", hintText: "Enter conductor phone"),
              Apptextfield.primary(labelText: "Conductor Email*",hintText:  "Enter conductor email"),

              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      _showResetPasswordSheet(context); 
                    },
                    child: appText.primaryText(
                      text:"Reset Password",
                      
                
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      
                    ),
                  ),
                ),
              ),
              SizedBox(height: 200.h),
              Container(
                width: 323.74.w,
                height: 40.h,
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
                  child: appText.primaryText(
                   text: 'Update Conductor',
                   
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      //  fontFamily: "Poppins",
                      color: Color.fromRGBO(255, 255, 255, 1),
                    
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0F67B1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              appText.primaryText(
                text:"Delete Conductor",
               
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color.fromRGBO(221, 65, 65, 1),
                
              ),
              SizedBox(height: 10.h),
            ],
          ),
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
      builder: (context) => ResetBottom(),
        
      
    );
  }
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
