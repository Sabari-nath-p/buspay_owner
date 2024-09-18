import 'package:flutter/material.dart';

class Busroutecard extends StatelessWidget {
  const Busroutecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Container(
          padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Haripad',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color.fromRGBO(96,96,96,1)),
                ),
                SizedBox(width: 7),
                Icon(Icons.arrow_forward, color: Colors.grey.shade600),
                 SizedBox(width: 7),
                Text(
                  'Alappuzha',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color.fromRGBO(96,96,96,1),fontFamily: "lato"),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '09:00 AM - 12:00 PM',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color.fromRGBO(96,96,96,1),fontFamily: "lato"),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}


   

   