import 'package:buspay_owner/Screens/AuthenticationScreen/BusManagerScreen/CreateBusScreen.dart';
import 'package:flutter/material.dart';

class NoBusScreen extends StatelessWidget {
  const NoBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 103, 177, 1),
        title: Text(
          'Bus Manager',
          style: TextStyle(color: Colors.white),
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
          children: [SizedBox(height:240 ,),
            Center(
              child: Image.asset(
                'assets/nobus.png', 
                width: 144, 
                height: 144, 
                fit: BoxFit.contain, 
              ),
              
            ),
            //SizedBox(height:2)
            Text("NO Bus Yet !",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0,0,0,0.43),

            ),),
            Text("Add  bus to continue",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(0,0,0,0.43),

            ),
            ),
            SizedBox(height:200),
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
                      builder: (context) => CreateBusScreen(),
                    ),
                  );
                    },
                    child: const Text(
                      'Create Bus',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
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
