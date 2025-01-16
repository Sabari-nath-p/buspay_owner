import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buspay_owner/Src/appText.dart';

class Collectionviewcard extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggleExpand;

  const Collectionviewcard({
    Key? key,
    required this.isExpanded,
    required this.onToggleExpand,
  }) : super(key: key);

  Widget _buildText(String text, double fontSize, FontWeight fontWeight) {
    return appText.primaryText(
      text: text,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggleExpand,
      child: Container(
        width: 366.w,
        height: isExpanded ? 210 : 120,
        margin: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  appText.primaryText(text:'Sinthumol',fontSize:  13,fontWeight:  FontWeight.w500),
                  Spacer(),
                appText.primaryText(text:'(Haripad - Alappuzha)',fontSize:10,fontWeight: FontWeight.w500),
                  Spacer(flex: 3),
                  Container(
                    height: 22.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_right_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(color: Color(0xFFE2E2E2), thickness: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText.primaryText(text:'2100.88',fontSize:18,fontWeight:  FontWeight.w700),
                  appText.primaryText(text: '54%', fontSize: 18,fontWeight: FontWeight.w800),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            LinearProgressIndicator(
              value: 0.54,
              backgroundColor: Colors.grey[400],
              color: Color(0xFF4AA0DE),
              minHeight: 7.h,
              semanticsLabel: 'Progress Indicator',
            ),
            if (isExpanded) ...[
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        appText.primaryText(text: 'Reema Shareen', fontSize:14,fontWeight:  FontWeight.w600),
                        Spacer(),
                        appText.primaryText(text:'20', fontSize: 10,fontWeight:  FontWeight.w600),
                      ],
                    ),
                    Row(
                      children: [
                        appText.primaryText(text: 'Conductor Incharge',fontSize:  10, fontWeight:FontWeight.w400),
                        Spacer(),
                        appText.primaryText(text:'Total Ticket Sold', fontSize:10, fontWeight:FontWeight.w400),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        appText.primaryText(text: '12-10-2024',fontSize:  14,fontWeight:  FontWeight.w600),
                        Spacer(),
                        appText.primaryText(text:'12:30 Pm',fontSize:14, fontWeight:FontWeight.w600),
                      ],
                    ),
                    Row(
                      children: [
                        appText.primaryText(text:'Date and Time', fontSize:10 ,fontWeight:  FontWeight.w400),
                        Spacer(),
                        appText.primaryText(text: 'Completed Time', fontSize: 10, fontWeight:  FontWeight.w400),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
