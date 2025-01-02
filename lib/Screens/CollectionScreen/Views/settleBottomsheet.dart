import 'package:buspay_owner/Screens/CollectionScreen/CollectionScreen.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:buspay_owner/Src/appTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettleBottomSheet extends StatelessWidget {
   SettleBottomSheet({Key? key}) : super(key: key);
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.7,
            offset: Offset(0, -1),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          appText.primaryText(
           text: "Settle Payment",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF090A0A),
              ),
          Container(
            width: 97.w,
            height: 1.h,
            margin: EdgeInsets.only(bottom: 23.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
          ),
        Apptextfield.primary(
           labelText: "Enter Amount",
            hintText: "Enter amount to be transferred",
             controller: amountController),
          SizedBox(height: 9.h),

          SizedBox(
            width: double.infinity,
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CollectionScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0F67B1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: appText.primaryText(
               text: 'Settle Now',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: appText.primaryText(
              text: "Get Back",
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}