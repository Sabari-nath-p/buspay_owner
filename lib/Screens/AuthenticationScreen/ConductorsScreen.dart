import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ConductorsScreen extends StatefulWidget {
  const ConductorsScreen({super.key});

  @override
  State<ConductorsScreen> createState() => _ConductorsScreenState();
}

class _ConductorsScreenState extends State<ConductorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 24),
              width: 352,
              height: 48,
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
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CustomCardWidget();
                },
              ),
            ),
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
                    'Create Conductors',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      //   fontFamily: "Poppins",
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
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/profileimage.png'),
          radius: 28,
        ),
        title: Text(
          "KIMS",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              //  fontFamily: "Poppins",
              color: Color.fromRGBO(3, 24, 44, 1)),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "james@ansamail.com",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  //  fontFamily: "Poppins",
                  color: Color.fromRGBO(108, 117, 125, 1)),
            ),
            SizedBox(height: 4),
            Text("9497677914"),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
