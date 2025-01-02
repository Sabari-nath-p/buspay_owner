import 'package:buspay_owner/Screens/OwnerProfileScreen/OwnerProfileScreen.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/appTextField.dart';
import 'package:buspay_owner/Src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBusRouteSheet extends StatelessWidget {
  AddBusRouteSheet({
    super.key,
  });

  TextEditingController startTimeController = TextEditingController();
  TextEditingController finishTimeController = TextEditingController();
  TextEditingController routeSearchController = TextEditingController();
  List DayList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thrusday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 562.h,
      width: 390.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            appText.primaryText(
              text: 'Add Bus Route',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SpacerH(5.h),
            Container(
              height: 1,
              width: 115,
              color: Color(0xFFA6A5A5),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Apptextfield.primary(
                      labelText: "Starting Time",
                      hintText: "Starting Time",
                      controller: startTimeController),
                  Apptextfield.primary(
                      labelText: "Finish Time",
                      hintText: "Finish Time",
                      controller: finishTimeController),
                  Wrap(
                    runSpacing: 10.h,
                    spacing: 10.w,
                    children: [
                      for (String day in DayList)
                        InkWell(
                          onTap: () {
                            if (selectedDays.contains(day)) {
                              selectedDays.remove(day);
                            } else {
                              selectedDays.add(day);
                            }
                          },
                          child: Container(
                            height: 33.h,
                            width: 50.w,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              color: selectedDays.contains(day)
                                  ? const Color.fromRGBO(15, 103, 177, 1)
                                  : const Color.fromRGBO(221, 220, 220, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: appText.primaryText(
                                text: day[0] + day[1] + day[2],
                                color: selectedDays.contains(day)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            )),

            
          ],
        ),
      ),
    );
  }
}
