import 'package:buspay_owner/Screens/ConductorScreen/ConductorViewScreen.dart';
import 'package:buspay_owner/Src/appTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetBottom extends StatefulWidget {
  ResetBottom({super.key});

  @override
  State<ResetBottom> createState() => _ResetBottomState();
    bool _obscureText = true;
   // bool _isLoading = false; 
}

class _ResetBottomState extends State<ResetBottom> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
              Apptextfield.password(labelText:"New Password*", hintText :"Enter new password",)
              ,
              Apptextfield.password(labelText: "Confirm Password*",hintText:  "Confirm new password"),
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
  }
}