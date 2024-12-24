import 'package:buspay_owner/Screens/BusManagerScreen/BusManagerScreen.dart';
import 'package:buspay_owner/Screens/CollectionScreen/CollectionScreen.dart';
import 'package:buspay_owner/Screens/ConductorScreen/ConductorViewScreen.dart';
//import 'package:buspay_owner/Screens/ConductorScreen/NoConductorScreen.dart';
import 'package:buspay_owner/Screens/OwnerProfileScreen/OwnerProfileScreen.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  int currentIndexPage = 0;
  final int pageLength = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hi,',
                            style: GoogleFonts.poppins(
                              // fontFamily: "Poppins",
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Naveed 👋🏼',
                            style: GoogleFonts.poppins(
                              //  fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Welcome Back !',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 34),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: Container(
                      height: 144,
                      width: 344,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(15, 103, 177, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Track My Bus',
                            style: GoogleFonts.poppins(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 344,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "A-One Travellers",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 120),
                                Container(
                                  height: 30,
                                  width: 73,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 192, 2, 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'On the Way',
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        // fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Haripad",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Color.fromRGBO(96, 96, 96, 1),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward,
                                    size: 12, color: Colors.black54),
                                SizedBox(width: 6),
                                Text(
                                  "Alappuzha",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            LinearProgressIndicator(
                              value: 0.5,
                              backgroundColor: Colors.grey[300],
                              color: Colors.blue,
                              minHeight: 4,
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Karuvatta TB Junction",
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        //  fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "12:25 PM, 8 KM",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.w500,
                                        //   fontFamily: "Poppins",
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Thottappally North",
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        // fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "12:45 PM, 12 KM",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        //  fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              DotsIndicator(
                dotsCount: pageLength,

                //  position: currentIndexPage.toDouble(),
                decorator: DotsDecorator(
                  size: Size.square(8.0),
                  activeSize: Size(12.0, 6.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),

              SizedBox(height: 15),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Manage",
                  style: GoogleFonts.poppins(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Grid Menu
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 162.95 / 116,
                children: [
                  _buildGridItem("Bus Manager", "assets/bus_manager.png",
                      BusManagerScreen(), context),
                  _buildGridItem("Conductors", "assets/conductors.png",
                      ConductorViewScreen(), context),
                  _buildGridItem("Collections", "assets/collections.png",
                      CollectionScreen(), context),
                  _buildGridItem("Owner Profile", "assets/owner_profile.png",
                      OwnerProfileScreen(), context),
                ],
              ),
              SizedBox(height: 40),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color.fromRGBO(15, 103, 177, 1),
                    padding: EdgeInsets.all(16),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.qr_code_scanner,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Verify Ticket",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  //  fontFamily: "Popins",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(
      String title, String asset, Widget screen, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        height: 116,
        width: 162,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              height: 60,
              width: 75,
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
