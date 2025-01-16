import 'package:buspay_owner/Screens/ConductorScreen/CreateConductorScreen.dart';
import 'package:buspay_owner/Screens/ConductorScreen/EditConductorScreen.dart';
import 'package:buspay_owner/Screens/ConductorScreen/Views/ConductorListCard.dart';
import 'package:buspay_owner/Src/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ConductorViewScreen extends StatefulWidget {
  const ConductorViewScreen({super.key});

  @override
  State<ConductorViewScreen> createState() => _ConductorViewScreenState();
}

class _ConductorViewScreenState extends State<ConductorViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F67B1),
        title: Text(
          'Conductors',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h),
              width: 352.w,
              height: 48.h,
              child: TextField(
                controller: TextEditingController(text: '  Search Bus'),
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'Search Bus',
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                style: GoogleFonts.poppins(color: Colors.grey),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 20.h),
            ConductorListCard(),
            ConductorListCard(),
             SizedBox(height: 20.h),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 323.74.w,
                height: 40.h,
                margin: EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateConductorScreen(),
                      ),
                    );
                  },
                  child: appText.primaryText(
                    text:'Create Conductor',
                   fontSize: 16,
                      fontWeight: FontWeight.w500,
                      // fontFamily: "Poppins",
                     
                    
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0F67B1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

