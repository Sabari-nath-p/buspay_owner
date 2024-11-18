import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:buspay_owner/Screens/ConductorScreen/ConductorViewScreen.dart';
import 'package:buspay_owner/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';


class CreateConductorScreen extends StatefulWidget {
   CreateConductorScreen({super.key,});

  @override
  State<CreateConductorScreen> createState() => _CreateConductorScreenState();
}

class _CreateConductorScreenState extends State<CreateConductorScreen> {
int? BusAssign;

List Assign=[];

TextEditingController namecontroller=TextEditingController();
TextEditingController phcontroller=TextEditingController();
TextEditingController mailcontroller=TextEditingController();
TextEditingController Passwordcontroller = TextEditingController();
TextEditingController confirmpasscontroller=TextEditingController();
 


  @override
   void initState(){
    super.initState();
    fetchData();
    
    
   }
   Future<void> fetchData() async {
   final Response = await http.get(Uri.parse(baseUrl+"/v1/bus"));
   if(Response.statusCode==200){
    setState(() {
      
     Assign =json.decode(Response.body)["data"] ;
   
    });
   }
   else{
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Unable to load data")));
     
   }
    
   }
   
 
  

   void createconductor()async{
    if(namecontroller.text.isEmpty||
    phcontroller.text.isEmpty||
    mailcontroller.text.isEmpty||
    Passwordcontroller.text.isEmpty||
    confirmpasscontroller.text.isEmpty||BusAssign==null
    ){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Fill all data")));
      return;
    }
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String token = preferences.getString("accessToken").toString();
  final conductor = {
    "name": namecontroller.text,
    "phone":phcontroller.text ,
    "email": mailcontroller.text,
     "bus_id":BusAssign ,
    "password": Passwordcontroller.text,
  };
  final Response = await http.post(Uri.parse(baseUrl +"/v1/user/add-new-conductor"),headers: {
    'Content-Type': 'application/json',
    "Authorization" : "Bearer $token",
  },body: json.encode(conductor),);
  print('Request Data: ${json.encode(conductor)}');

   print(token);

    print('Response Code: ${Response.statusCode}');
    print('Response Body: ${Response.body}');

  
   if (Response.statusCode == 201) {
   
      Navigator.pop(
        context,
      );
    } else {
    
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
            content: Text('Failed to create bus. Please try again.')),
      );
    }
   print(Response.body);

   }

    
   Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
           backgroundColor: Color.fromRGBO(252,252,252,1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
          title: Text(
            'Conductors',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 21,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 13,),
           buildTextField(labelText: "Conductor Name", hintText: "Enter Conductor Name",controller: namecontroller),
            buildTextField(labelText: "Conductor Phone", hintText: "Enter Conductor Phone",controller: phcontroller),
             buildTextField(labelText: "Conductor Mail", hintText: "Enter Conductor mail",controller: mailcontroller),
              buildDropdown(labelText: "Assigned Bus", 
              hintText: "Assigned bus",
               items: Assign,
                value: BusAssign,
                fieldName: "name",
                keyId: "id",
              onChanged: (newValue){
                setState(() {
                  BusAssign = newValue;
                });
              }
              ),
                 buildTextField(labelText: "Password", hintText: "Enter Password",controller: Passwordcontroller),
                  buildTextField(labelText: "Confirm Password", hintText: "Enter Password",controller: confirmpasscontroller),
                  SizedBox(height: 105.h),
                  Container(
                      width: 323.74,
                      height: 40,
                      margin: EdgeInsets.only(bottom:23,left:33,right:33),
                      child:
                      
                      
                      ElevatedButton(
                        onPressed: () {
                          
                          if(Passwordcontroller.text==confirmpasscontroller.text)
                         createconductor(); else{
                       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Incorrect password.')),
      );

                     }
                        },
                        child: Text(
                          'Create Conductor',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          textAlign: TextAlign.end,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(15, 103, 177, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
            ],
                
          ),
        ),
      ),
    );
  }
}

// _textfield(String  labelText, String hintText,) {
 
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//    // mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       SizedBox(height:8),
//       Text(
//         labelText,
//         selectionColor: Color.fromRGBO(9,10,10,1),
//         style:
//             GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500)
            
//       ),
//       SizedBox(height: 8.h),
//       Container(
//         alignment: Alignment.centerRight,
//         height: 48.h,
//         width: 327.w,
//         decoration: BoxDecoration(
//           color:  Color.fromARGB(255, 222, 222, 222),
//           border: Border.all(color: Color.fromRGBO(242,244,245, 1)),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal:18.w),
//                hintText: hintText, 
//                hintStyle: GoogleFonts.inter(
//               color: Colors.grey[600],
//               fontSize: 14.sp,
//             ),
               
//                  ),
//           style: GoogleFonts.inter(
//               color:  Color.fromRGBO(27,27,27,1),
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w400),
//         ),
//       ),
//       SizedBox(height: 1.68.h),
//     ],
//   );
// }
Widget buildTextField({
    required String labelText,
    required String hintText,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(
          labelText,
          style:
              GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 48.h,
          width: 327.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromRGBO(242, 244, 245, 1)),
          ),
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
            style: GoogleFonts.inter(
              color: const Color.fromRGBO(27, 27, 27, 1),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget buildDropdown(
      {required String labelText,
      required String hintText,
      var value,
      required List items,
      required Function(dynamic) onChanged,
      String fieldName = "",
      String keyId = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(
          labelText,
          style:
              GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 48.h,
          width: 327.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromRGBO(242, 244, 245, 1)),
          ),
          child: DropdownButtonFormField<dynamic>(
            value: value,
            decoration: InputDecoration(
              isCollapsed: true,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem(
                value: (keyId == " ") ? item : item[keyId],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Text(
                    (fieldName == "") ? item : item[fieldName],
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
  

//   _textbox(String labelText, String hintText) {
    

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       SizedBox(height: 8.h),
//        Text(
//         labelText,
//         selectionColor: Color.fromRGBO(9,10,10,1),
//         style:
//             GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500)
            
//       ),
//       SizedBox(height: 8.h),
//       Container(
//           alignment: Alignment.centerLeft,
//           height: 48.h,
//           width: 327.w,
//           decoration: BoxDecoration(
//           color:  Color.fromARGB(255, 222, 222, 222),
//           border: Border.all(color: Color.fromRGBO(242,244,245, 1)),
//           borderRadius: BorderRadius.circular(8),
//         ),
//           child:DropdownButton<String>(
//               isExpanded: true,
//               underline: Container(),

//                hint: Padding(
//             padding: EdgeInsets.symmetric(horizontal:18.w),
//             child: Text(
//               hintText, 
//               style: GoogleFonts.inter(
//                 color: Colors.grey[600],
//                 fontSize: 14.sp,
//               ),
//             ),
//           ),
//               items: []
//                   .map((e) => DropdownMenuItem<String>(
                        
//                         value: e,
//                        child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal:18.w),
//                       child: Text(
//                         e,
//                         style: GoogleFonts.inter(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ))
//                   .toList(),
//               onChanged: (value) {})),
//       SizedBox(height: 1.68.h),
//     ],
//   );
// }

      