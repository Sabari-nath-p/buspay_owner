import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/appTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class Collectioncard extends StatelessWidget {
  const Collectioncard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      width: 358.w,
      margin: EdgeInsets.only( left:17.w, right: 17.w, top: 14.h),
      decoration: BoxDecoration(
        color: Color(0xE40F67B1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // Background Circle
          Positioned(
            top: -18,
            left: -28,
            child: Image.asset(
              'assets/bgcircle.png',
              height: 140,
              width: 177,
            ),
          ),
          // Text Content
          Positioned(
            top: 30,
            left: 20.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText.primaryText(
                 text: 'Wallet Balance',
                  
                    fontSize: 13,
                  
                    fontWeight: FontWeight.w500,
                  
                ),
                appText.primaryText(
                text:  '2,48,259.00',
                 
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  
                  
                ),
                const SizedBox(height: 23),
                appText.primaryText(
                 text: 'Total Collection',
                 
                    fontSize: 13,
                    color: Colors.white,
                
                ),
                appText.primaryText(
                  text:'1,57,342.00',
                 
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                
                ),
              ],
            ),
          ),
          // Pie Chart
          Positioned(
            right: 10,
            top: 10,
            bottom:10,
            child: SizedBox(
              height: 154,
              width: 154,
              child: Stack(
                children: [
                  // Background White Circle
                  Center(
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Pie Chart
                  PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: 70,
                          color: Color(0xFF4ADEC3),
                          radius: 20,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 30,
                          color: Color.fromRGBO(246, 198, 26, 1),
                          radius: 20,
                          showTitle: false,
                        ),
                      ],
                      startDegreeOffset: -90,
                      sectionsSpace: 2,
                      centerSpaceRadius: 45,
                    ),
                  ),
                  // Center Text in Pie Chart
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Collection',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Today-Total',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
