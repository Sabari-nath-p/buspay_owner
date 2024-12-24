import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Viewrequest extends StatelessWidget {
  const Viewrequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
        title: Text(
          'Collection Request',
          style: GoogleFonts.poppins(
            color: Colors.white,
            // fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 21,
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
        border: Border.all(color: Color.fromRGBO(15, 103, 177, 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '₹ $amount',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    // fontFamily: "Poppins",
                    color: Colors.black),
              ),
              SizedBox(width: 222),
              Text(
                status,
                style: GoogleFonts.poppins(
                  color: statusColor,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  // fontFamily: "Poppins",
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Text(
                date1,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  // fontFamily: "Lato",
                  color: Color.fromRGBO(96, 96, 96, 1),
                ),
              ),
              SizedBox(width: 88),
              Text(
                date2,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  // fontFamily: " Lato",
                  color: Color.fromRGBO(96, 96, 96, 1),
                ),
              ),
              SizedBox(height: 8),
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
        border: Border.all(color: Color.fromRGBO(15, 103, 177, 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '₹ $amount',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    //   fontFamily: "Poppins",
                    color: Colors.black),
              ),
              SizedBox(width: 232),
              Text(
                status,
                style: GoogleFonts.poppins(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  //  fontFamily: "Poppins",
                  color: Color.fromRGBO(214, 49, 49, 1),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Text(
                date1,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  // fontFamily: "Lato",
                  color: Color.fromRGBO(96, 96, 96, 1),
                ),
              ),
              SizedBox(width: 85),
              Text(
                date2,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  // fontFamily: " Lato",
                  color: Color.fromRGBO(96, 96, 96, 1),
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Text(
            rejectionReason,
            style: GoogleFonts.poppins(
                color: Color.fromRGBO(214, 49, 49, 1),
                fontSize: 10,
                //  fontFamily: "Lato",
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
