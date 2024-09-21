import 'package:buspay_owner/Screens/ConductorScreen/ConductorViewScreen.dart';
import 'package:buspay_owner/Screens/ConductorScreen/EditConductorScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CreateConductorScreen extends StatelessWidget {
  const CreateConductorScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
         backgroundColor: Color.fromRGBO(252,252,252,1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
        title: const Text(
          'Conductors',
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
      body: SafeArea(child: Column(
        children: [
          SizedBox(height: 13,),
          _textfield("Conductor Name*","Enter conductor nam" ),
          _textfield("Conductor Phone*","Enter conductor Phone"),
           _textfield("Conductor Email*","Enter conductor Phone"),
            _textbox("Assigned Bus*","Assign Bus"),
             _textfield("Password*","Enter conductor Phone"),
              _textfield("Conform Password*","Enter conductor Phone"),
              SizedBox(height: 105.h),
              Container(
                  width: 323.74,
                  height: 40,
                  margin: EdgeInsets.only(bottom:23,left:33,right:33),
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
                      'Create Conductor',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      textAlign: TextAlign.end,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(15, 103, 177, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
        ],

      )),
    );
  }
}

_textfield(String  labelText, String hintText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
   // mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height:8),
      Text(
        labelText,
        selectionColor: Color.fromRGBO(9,10,10,1),
        style:
            GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500)
            
      ),
      SizedBox(height: 8.h),
      Container(
        alignment: Alignment.centerRight,
        height: 48.h,
        width: 327.w,
        decoration: BoxDecoration(
          color:  Color.fromARGB(255, 222, 222, 222),
          border: Border.all(color: Color.fromRGBO(242,244,245, 1)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal:18.w),
               hintText: hintText, 
               hintStyle: GoogleFonts.inter(
              color: Colors.grey[600],
              fontSize: 14.sp,
            ),
               
                 ),
          style: GoogleFonts.inter(
              color:  Color.fromRGBO(27,27,27,1),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
      SizedBox(height: 1.68.h),
    ],
  );
}
  

  _textbox(String labelText, String hintText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 8.h),
       Text(
        labelText,
        selectionColor: Color.fromRGBO(9,10,10,1),
        style:
            GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500)
            
      ),
      SizedBox(height: 8.h),
      Container(
          alignment: Alignment.centerLeft,
          height: 48.h,
          width: 327.w,
          decoration: BoxDecoration(
          color:  Color.fromARGB(255, 222, 222, 222),
          border: Border.all(color: Color.fromRGBO(242,244,245, 1)),
          borderRadius: BorderRadius.circular(8),
        ),
          child:DropdownButton<String>(
              isExpanded: true,
              underline: Container(),

               hint: Padding(
            padding: EdgeInsets.symmetric(horizontal:18.w),
            child: Text(
              hintText, 
              style: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
          ),
              items: ["Air", "AC", "Non AC", "AC"]
                  .map((e) => DropdownMenuItem<String>(
                        
                        value: e,
                       child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:18.w),
                      child: Text(
                        e,
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ))
                  .toList(),
              onChanged: (value) {})),
      SizedBox(height: 1.68.h),
    ],
  );
}

      