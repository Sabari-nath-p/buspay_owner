import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DBOverviewCard extends StatelessWidget {
  String title, value, description;
  DBOverviewCard(
      {super.key,
      required this.title,
      required this.value,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 111.w,
      height: 110.h,
      padding: EdgeInsets.all(10..w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: .3,
                color: Colors.black.withOpacity(.03))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/dollarbucket.png",
                width: 25.w,
                height: 25.w,
              ),
              SpacerW(4.w),
              appText.primaryText(
                  text: "$title", fontSize: 11.sp, fontWeight: FontWeight.w500),
            ],
          ),
          SpacerH(7.h),
          appText.primaryText(
              text: "$value", fontSize: 14.sp, fontWeight: FontWeight.w500),
          SpacerH(2.h),
          appText.primaryText(
              text: "$description",
              fontSize: 8.sp,
              fontWeight: FontWeight.w300),
        ],
      ),
    );
  }
}
