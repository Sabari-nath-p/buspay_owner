import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBusScreen extends StatefulWidget {
  const CreateBusScreen({Key? key}) : super(key: key);

  @override
  _CreateBusScreenState createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<CreateBusScreen> {
  String? selectedState;
  String? selectedDistrict;
  bool airBusSelected = false;
  bool acBusSelected = false;
  bool pushBackSeatSelected = false;

  final List<String> states = ['Kerala', 'Karnataka', 'Tamilnadu'];
  final List<String> districts = ['Alappuzha', 'Ernakulam', 'Malappuram'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
        title: Text(
          'Create Bus',
          style: GoogleFonts.poppins(
            color: Colors.white,
            //  fontFamily: "Poppins",
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
        padding: const EdgeInsets.only(left: 25, top: 16, right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bus Name Label and TextField (disabled)
              Text(
                'Bus Name*',
                style: GoogleFonts.poppins(
                  //  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                width: 340,
                child: TextField(
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: 'Enter bus name',
                    hintStyle: GoogleFonts.poppins(
                        color: Color.fromRGBO(205, 207, 208, 1), fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // RC Number Label and TextField (disabled)
              Text(
                'RC Number*',
                style: GoogleFonts.poppins(
                  // fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                width: 340,
                child: TextField(
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: 'Enter bus RC number',
                    hintStyle: GoogleFonts.poppins(
                        color: Color.fromRGBO(205, 207, 208, 1), fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'State*',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedState,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
                    hintText: 'Select route state',
                    hintStyle: GoogleFonts.poppins(
                        color: Color.fromRGBO(205, 207, 208, 1), fontSize: 16),
                  ),
                  items: states.map((String state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedState = newValue;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'District*',
                style: GoogleFonts.poppins(
                  //   fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedDistrict,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
                    hintText: 'Select route district',
                    hintStyle: GoogleFonts.poppins(
                        color: Color.fromRGBO(205, 207, 208, 1), fontSize: 16),
                  ),
                  items: districts.map((String district) {
                    return DropdownMenuItem<String>(
                      value: district,
                      child: Text(district),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDistrict = newValue;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'Seating Capacity*',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                width: 340,
                child: TextField(
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: 'Enter bus name',
                    hintStyle: GoogleFonts.poppins(
                        color: Color.fromRGBO(205, 207, 208, 1), fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'Bus Preference',
                style: GoogleFonts.poppins(
                  //  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Air Bus Container
                  Container(
                    height: 33,
                    width: 87,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(15, 103, 177, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Air Bus',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // AC Bus Container
                  Container(
                    height: 33,
                    width: 87,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(15, 103, 177, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'AC Bus',
                        style: GoogleFonts.poppins(
                          color: Colors.white, // White text color
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Push Back Seat Container
                  Container(
                    height: 33,
                    width: 142,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(15, 103, 177, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Push Back Seat',
                        style: GoogleFonts.poppins(
                          color: Colors.white, // White text color
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By continuing, you agree to our ',
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Terms of Service ',
                      style:
                          GoogleFonts.poppins(fontSize: 13, color: Colors.blue),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: Colors.black),
                    ),
                    TextSpan(
                      text: '\nPrivacy Policy ',
                      style:
                          GoogleFonts.poppins(fontSize: 13, color: Colors.blue),
                    ),
                    TextSpan(
                      text: '.',
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 323.74,
                  height: 40,
                  margin: EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      // context,
                      //MaterialPageRoute(
                      //builder: (context) => CreateBusScreen(),
                      //),
                      //);
                    },
                    child: Text(
                      'Create Bus',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        //  fontFamily: "Poppins",
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(15, 103, 177, 1),
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
      ),
    );
  }
}
