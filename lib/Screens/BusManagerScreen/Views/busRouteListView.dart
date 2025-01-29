import 'package:buspay_owner/Screens/BusManagerScreen/BottomSheetScreen.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/BusManagerScreen.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Controller/BManagerController.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusModel.dart';

import 'package:buspay_owner/Screens/DashboardScreen/Controllers/DBController.dart';
import 'package:buspay_owner/Screens/OwnerProfileScreen/OwnerProfileScreen.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BusRouteListView extends StatelessWidget {
  BusModel model;
  BusRouteListView({super.key, required this.model});
  BMController bmctrl = Get.put(BMController());
  DBController dbctrl = Get.put(DBController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      // height:142,
      constraints: BoxConstraints(maxHeight: 300.h),
      padding: EdgeInsets.only(left: 16, top: 10, right: 16),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText.primaryText(
                text: 'Bus Route',

                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                //   foColor.fromRGBO(0, 0, 0, 1)                     color: Color.fromRGBO(0, 0, 0, 1),
              ),
              Container(
                width: 56,
                height: 21,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(15, 103, 177, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      //_showBottomSheet(context);
                      Get.bottomSheet(AddBusRouteBottomSheet(),
                    // Get.to(() => AddBusRouteBottomSheet());
                         backgroundColor: Colors.white);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Add',
                      style: GoogleFonts.poppins(
                        //         fontFamily: "Inter",
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          if (model.routeBus == null || model.routeBus!.isEmpty)
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.grey,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Add Bus Route',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color.fromRGBO(141, 141, 141, 1),
                      // fontFamily: "Inter",
                    ),
                  ),
                  SizedBox(height: 18),
                ],
              ),
            )
          else
            for (var data in model.routeBus!)
              Container(
                width: 300.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        appText.primaryText(
                            text: dbctrl.RouteToName(
                              data.routeId,
                            ),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),
                        Spacer(),
                        Icon(
                          Icons.delete,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    appText.primaryText(
                        text: data.startTiming ?? "", fontSize: 13.sp)
                  ],
                ),
              )
        ],
      ),
    );
  }
}
