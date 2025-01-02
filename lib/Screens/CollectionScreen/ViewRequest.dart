import 'package:buspay_owner/Src/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Viewrequest extends StatelessWidget {
  const Viewrequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F67B1),
        title: Text(
          'Collection Request',
          style: GoogleFonts.poppins(
            color: Colors.white,
               
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: ListView(
          children: [
            collectionItem(2102.00, '11/12/2024 12:10:00 AM',
                '12/12/2024 10:10:00 AM', 'Approved', Colors.green),
            collectionItem(2102.00, '11/12/2024 12:10:00 AM',
                '12/12/2024 10:10:00 AM', 'Pending', Colors.orange),
            collectionItemWithRejection(
                2102.00,
                '11/12/2024 12:10:00 AM',
                '12/12/2024 10:10:00 AM',
                'Reject',
                Colors.red,
                'add bank details to approve payment'),
            collectionItem(2102.00, '11/12/2024 12:10:00 AM',
                '12/12/2024 10:10:00 AM', 'Approved', Colors.green),
          ],
        ),
      ),
    );
  }

  Widget collectionItem(double amount, String date1, String date2,
      String status, Color statusColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Color(0x250F67B1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              appText.primaryText(
               text: '₹ $amount',
              
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    // fontFamily: "Poppins",
                    color: Colors.black),
              SizedBox(width: 218.w),
              Text(
                status,
                style: GoogleFonts.poppins(
                  color: statusColor,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              Text(
                date1,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                 
                  color: Color(0xFF606060),
                ),
              ),
              SizedBox(width: 88.w),
              Text(
                date2,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF606060),
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ],
      ),
    );
  }

  Widget collectionItemWithRejection(double amount, String date1, String date2,
      String status, Color statusColor, String rejectionReason) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Color(0x250F67B1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              appText.primaryText(
  
               text: '₹ $amount',
                
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    //   fontFamily: "Poppins",
                    color: Colors.black
              ),
              SizedBox(width: 232.w),
              Text(
                status,
                style: GoogleFonts.poppins(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  //  fontFamily: "Poppins",
                  color: Color(0xFFD63131),
                ),
              ),
            ],
          ),
          SizedBox(height:1 .h),
          Row(
            children: [
              Text(
                date1,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  // fontFamily: "Lato",
                  color: Color(0xFF606060),
                ),
              ),
              SizedBox(width: 85),
              Text(
                date2,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  // fontFamily: " Lato",
                  color: Color(0xFF606060),
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Text(
            rejectionReason,
            style: GoogleFonts.poppins(
                color: Color(0xFFD63131),
                fontSize: 10,
            
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
