import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Appdropdown {
  static Widget primary(
      {required String labelText,
      required String hintText,
      var value,
      required List items,
      required Function(dynamic) onChanged,
      String fieldName = "",
      String keyId = ""}) {
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
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFDEDEDE).withOpacity(.5),
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(color: const Color.fromRGBO(242, 244, 245, 1)
          ),
          child: DropdownButtonFormField<dynamic>(
            value: value,
            decoration: InputDecoration(
              isCollapsed: true,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem(
                value: (keyId == "") ? item : item[keyId],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    (fieldName == "") ? item : item[fieldName],
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
