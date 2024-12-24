import 'package:buspay_owner/Screens/OwnerProfileScreen/OwnerProfileScreen.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DbManageCard extends StatelessWidget {
  String buttonName, assetImage;
  Function()? onTap;
  DbManageCard(
      {super.key,
      required this.buttonName,
      required this.assetImage,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 103.w,
        height: 91.h,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetImage,
              width: 80.w,
              height: 60.w,
            ),
            appText.primaryText(
                text: buttonName, fontSize: 11.sp, fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
