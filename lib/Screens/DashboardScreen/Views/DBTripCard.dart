import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DbTripCard extends StatelessWidget {
  String busName, routeName;
  bool isReady;
  DbTripCard(
      {super.key,
      required this.busName,
      required this.routeName,
      required this.isReady});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347.w,
      height: 65.h,
      padding: EdgeInsets.all(10..w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: .3,
                color: Colors.black.withOpacity(.03))
          ]),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText.primaryText(
                  text: "$busName",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
              SpacerH(2.h),
              appText.primaryText(
                  text: "$routeName",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ],
          ),
          Spacer(),
          Container(
            height: 25.h,
            width: (isReady) ? 80.w : 100.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (isReady) ? Color(0xffFFFBEB) : Color(0xffE4FFF2)),
            child: appText.primaryText(
                text: (isReady) ? "Ready" : "On Journey",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: (isReady) ? Color(0xffF6A723) : Color(0xff30AC6E)),
          )
        ],
      ),
    );
  }
}
