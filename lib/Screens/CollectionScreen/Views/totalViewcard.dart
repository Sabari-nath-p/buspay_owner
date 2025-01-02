import 'package:buspay_owner/Src/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalViewCard extends StatelessWidget {
     String  imagePath, value,  label;
      TotalViewCard({super.key,
      required this.imagePath,
      required this.value,
      required this.label,
   
   });
    @override
  Widget build(BuildContext context) {
    return Container(
      width: 116.w,
      height: 65.h,
      margin:  EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
           SizedBox(width: 10.w),
          Image.asset(imagePath, height: 24.h),
         SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText.primaryText(
               text:"$value",
              
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
              
              ),
              
              appText.primaryText(
               text: "$label",
               
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
            
            ],
          ),
        ],
      ),
    );
  }
}
 