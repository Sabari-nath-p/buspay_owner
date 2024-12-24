import 'package:buspay_owner/Screens/ConductorScreen/ConductorViewScreen.dart';
import 'package:buspay_owner/Screens/ConductorScreen/CreateConductorScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoConductorScreen extends StatelessWidget {
  NoConductorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 103, 177, 1),
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
            SizedBox(
              height: 240,
            ),
            Center(
              child: Image.asset(
                'assets/nobus.png',
                width: 144,
                height: 144,
                fit: BoxFit.contain,
              ),
            ),
            //SizedBox(height:2)
            Text(
              "NO Conductor Yet !",
              style: GoogleFonts.poppins(
               // fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(0, 0, 0, 0.43),
              ),
            ),
            Text(
              "Add conductor to continue",
              style: GoogleFonts.poppins(
                //fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(0, 0, 0, 0.43),
              ),
            ),
            SizedBox(height: 200),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 323.74,
                height: 40,
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
                  child: Text(
                    'Create Conductor',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      // fontFamily: "Poppins",
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
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
