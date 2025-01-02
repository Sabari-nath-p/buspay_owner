//import 'package:buspay_owner/Screens/AuthenticationScreen/CollectionScreen.dart%2000-12-04-899.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/BusManagerScreen.dart';
import 'package:buspay_owner/Screens/CollectionScreen/CollectionScreen.dart';
import 'package:buspay_owner/Screens/ConductorScreen/ConductorViewScreen.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Controllers/DBController.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Views/DBManageCard.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Views/DBOverViewCard.dart';
import 'package:buspay_owner/Screens/DashboardScreen/Views/DBTripCard.dart';
import 'package:buspay_owner/Screens/OwnerProfileScreen/OwnerProfileScreen.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  DBController dbctrl = Get.put(DBController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  floatingActionButton: ,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<DBController>(builder: (_) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    appText.primaryText(
                        text: "Hello\nSabarinath P",
                        lineHeight: 1,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => OwnerProfileScreen(),
                            transition: Transition.rightToLeft);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
                          height: 50.w,
                          width: 50.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                appText.primaryText(
                  text: "Manage you Bus and staff Easily",
                  fontSize: 11.sp,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpacerH(24.h),
                      appText.primaryText(
                          text: "Overview",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                      SpacerH(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DBOverviewCard(
                            title: "Wallet \nBalance",
                            value: "₹ 12,034",
                            description: "Amount in account",
                          ),
                          DBOverviewCard(
                            title: "Total \nEarnings",
                            value: "₹ 12,034",
                            description: "in last month",
                          ),
                          DBOverviewCard(
                            title: "Ticket \nSold",
                            value: "453",
                            description: "in past last month",
                          ),
                        ],
                      ),
                      SpacerH(30.h),
                      appText.primaryText(
                          text: "Manage",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                      SpacerH(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DbManageCard(
                            buttonName: "My Buses",
                            assetImage: "assets/bus_manager.png",
                            onTap: () {
                              Get.to(() => BusManagerScreen(),
                                  transition: Transition.rightToLeft);
                            },
                          ),
                          DbManageCard(
                              buttonName: "My Conductors",
                              assetImage: "assets/conductors.png",
                                onTap: () {
                              Get.to(() => ConductorViewScreen(),
                                  transition: Transition.rightToLeft);
                            },
                          ),
                          DbManageCard(
                              buttonName: "My Collection",
                              assetImage: "assets/collections.png",  onTap: () {
                              Get.to(() => CollectionScreen(),
                                  transition: Transition.rightToLeft);
                            },
                          ),
                        ],
                      ),
                      SpacerH(30.h),
                      Row(
                        children: [
                          appText.primaryText(
                              text: "My Trips",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                          // Spacer(),
                          // appText.primaryText(
                          //     text: "see all",
                          //     fontSize: 12.sp,
                          //     fontWeight: FontWeight.w400),
                        ],
                      ),
                      SpacerH(8.h),
                      DbTripCard(
                        busName: "A One Travels",
                        routeName: "Haripad - Alappuzha",
                        isReady: false,
                      ),
                      DbTripCard(
                        busName: "A One Travels",
                        routeName: "Haripad - Alappuzha",
                        isReady: true,
                      ),
                      DbTripCard(
                        busName: "A One Travels",
                        routeName: "Haripad - Alappuzha",
                        isReady: false,
                      ),
                      DbTripCard(
                        busName: "A One Travels",
                        routeName: "Haripad - Alappuzha",
                        isReady: true,
                      ),
                      DbTripCard(
                        busName: "A One Travels",
                        routeName: "Haripad - Alappuzha",
                        isReady: true,
                      )
                    ],
                  ),
                ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
