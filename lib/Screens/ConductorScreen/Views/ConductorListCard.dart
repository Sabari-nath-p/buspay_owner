import 'package:buspay_owner/Screens/ConductorScreen/EditConductorScreen.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ConductorListCard extends StatelessWidget {
  const ConductorListCard({super.key});

  @override
  Widget build(BuildContext context) {
   return ListTile(
       leading: GestureDetector(
      onTap: () {
        Get.to(
            () => EditConductorScreen(
               
                ),
            transition: Transition.rightToLeft);
      },
      child: CircleAvatar(
            backgroundImage: AssetImage('assets/profileimage.png'),
            radius: 28.w,
          ),
        ),
        title: appText.primaryText(
         text:"KIMS",
          fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF03182C),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText.primaryText(
             text: "james@ansamail.com",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF6C757D)),
             SizedBox(height: 4),
            Text("9497677914"),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      
     
   
   );


  }
}