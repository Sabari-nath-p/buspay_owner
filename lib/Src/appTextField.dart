import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget tBox(
        {TextEditingController? controller,
        String? hint,
        String? prefixText,
        bool? isEnable,
        TextInputType? keyType}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffC7C7C7),
          ),
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        controller: controller,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: Color(0xFF262626)),
        keyboardType: keyType,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        enabled: isEnable,
        decoration: InputDecoration(
            prefixText: prefixText,
            hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: Color(0xFF262626).withOpacity(.5)),
            border: InputBorder.none,
            isDense: true,
            hintText: hint),
      ),
    );

class Apptextfield {
  static Widget primary({
    required String labelText,
    required String hintText,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h),
        Text(
          labelText,
          style:
              GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 48.h,
          width: 370.w,
          decoration: BoxDecoration(
            color: Color(0xFFDEDEDE).withOpacity(.5),
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(color: const Color.fromRGBO(242, 244, 245, 1)),
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
        SizedBox(height: 10.h),
      ],
    );
  }
}
