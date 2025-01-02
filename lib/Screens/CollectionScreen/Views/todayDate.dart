import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayDate extends StatelessWidget {
  const TodayDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 357.w,
      margin:  EdgeInsets.only(left: 17.w, right: 17.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0x1E767680),
      ),
      child: Row(
        children: [
          Container(
            width: 101.w,
            height: 28.h,
            margin:  EdgeInsets.only(left: 10.w, right: 15.w),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:  EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Today',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
           SizedBox(width: 8.w),
          Row(
            children: [
              Text(
                '24/05/2023  -  24/05/2023',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
             SizedBox(width: 10.h),
              Container(
                height: 26.h,
                width: 26.w,
                decoration: BoxDecoration(
                  color: Color(0x1E76B580),
                  borderRadius: BorderRadius.circular(6),
                ),
                child:  Icon(Icons.calendar_today, size: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
