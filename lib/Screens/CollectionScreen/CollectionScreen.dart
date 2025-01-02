import 'package:buspay_owner/Screens/CollectionScreen/ViewRequest.dart';
import 'package:buspay_owner/Screens/CollectionScreen/Views/ExpandableCard.dart';
import 'package:buspay_owner/Screens/CollectionScreen/Views/collectionCard.dart';
import 'package:buspay_owner/Screens/CollectionScreen/Views/collectionViewcard.dart';
import 'package:buspay_owner/Screens/CollectionScreen/Views/settleBottomsheet.dart';
import 'package:buspay_owner/Screens/CollectionScreen/Views/todayDate.dart';
import 'package:buspay_owner/Screens/CollectionScreen/Views/totalViewcard.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionScreen extends StatelessWidget {
  CollectionScreen({super.key});
  
  final ExpandableCardController expandableCardController = Get.put(ExpandableCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F67B1),
        title: Text(
          'Bus Collection',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),


      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:5),
              Collectioncard(),

              SizedBox(height: 14.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showSettlePaymentsBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F67B1),
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 12.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: appText.primaryText(
                      text: 'Settle Payments',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Viewrequest(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F67B1),
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 20.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: appText.primaryText(
                      text: 'View Request',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              TodayDate(),

              SizedBox(height: 25.h),

              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    TotalViewCard(
                      imagePath: "assets/amount.png",
                      value: "2040.00",
                      label: 'Total Amount',
                    ),
                    
                    SizedBox(width: 4),

                    TotalViewCard(
                      imagePath: "assets/totalticket.png",
                      value: "200.00",
                      label: 'Total Ticket',
                    ),

                    SizedBox(width: 4.w),

                    TotalViewCard(
                      imagePath: "assets/totaltrip.png",
                      value: "200.00",
                      label: 'Total Trip',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              ExpandableCard(controller: expandableCardController),
            ],
          ),
        ),
      ),
    );
  }
}

void _showSettlePaymentsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ),
    builder: (context) =>  SettleBottomSheet(),
  );
}




      
      
      
     