import 'package:buspay_owner/Screens/BusManagerScreen/BusViewScreen.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Model/BusListModel.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Controllers/DBController.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Views/DBManageCard.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BuslistCard extends StatelessWidget {
  BusListModel model;

  BuslistCard({
    required this.model,
  });

  DBController dbctrl = Get.put(DBController());

  @override
  Widget build(BuildContext context) {
    // final Map<String, Color> statusColors = {
    //   'Active': Colors.green,
    //   'Pending': Colors.orange,
    //   'Inactive': Colors.red,
    // };

    // final Color statusColor = statusColors[status] ?? Colors.black;

    return GestureDetector(
      onTap: () {
        // if (status == 'Active') {
        // Navigator.push(
        //  context,
        // MaterialPageRoute(
        //   builder: (context) => BusViewScreen(
        //     status: status,
        //     busData: busData,
        //   ),
        // ),
        // );
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('This bus is not active.')),
        //   );
        // }
      },
      child: Container(
        height: 68,
        width: 348,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromRGBO(15, 103, 177, 0.15),
            width: 2,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        margin: EdgeInsets.only(left: 11, right: 11, bottom: 10.h),
        child: Row(
          children: [
            Image.asset(
              "assets/busIcon.png",
              width: 30.w,
            ),
            SpacerW(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText.primaryText(
                  text: model.name,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  // fontFamily: "Poppins",
                ),
                Row(
                  children: [
                    appText.primaryText(
                      text: (model.busNo.toString() + ","),
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                    SpacerW(5.w),
                    appText.primaryText(
                      text: dbctrl.districtToName(model.districtId),
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
