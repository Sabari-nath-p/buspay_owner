 
//import 'package:buspay_owner/Screens/AuthenticationScreen/BusManagerScreen/Routeupdate.dart';
import 'package:flutter/material.dart';

class BusViewScreen extends StatefulWidget {
  const BusViewScreen({Key? key}) : super(key: key);

  @override
  _BusViewScreenState createState() => _BusViewScreenState();
}

class _BusViewScreenState extends State<BusViewScreen> {
  String? selectedState;
  String? selectedDistrict;
 Set<String> selectedDays = {};
  bool airBusSelected = false;
  bool acBusSelected = false;
  bool pushBackSeatSelected = false;

  final List<String> states = ['Kerala', 'Karnataka', 'Tamilnadu'];
  final List<String> districts = ['Alappuzha', 'Ernakulam', 'Malappuram'];

  // Bus preference logic 
  void selectBusPreference(String busType) {
    setState(() {
      if (busType == 'Air Bus') {
        airBusSelected = true;
        acBusSelected = false;
        pushBackSeatSelected = false;
      } else if (busType == 'AC Bus') {
        airBusSelected = false;
        acBusSelected = true;
        pushBackSeatSelected = false;
      } else if (busType == 'Push Back Seat') {
        airBusSelected = false;
        acBusSelected = false;
        pushBackSeatSelected = true;
      }
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
          bottom: Radius.circular(20),
        ),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(left: 36, top: 28, right: 36),
        child: Container(
          height: 562,
          width: 391,
          child: Column(
            children: [
              Text(
                'Add Bus Route',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Starting Time',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter",
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 8),
              Container(
                  
                  width: 327, 
                  height: 48,
                  child: TextField(
                    controller: TextEditingController(text: '12:00:00 PM'),
                    enabled: false, 
                    decoration: InputDecoration(
                      hintText: '12:00:00 PM',
                     
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
                    style: TextStyle(color: Colors.grey),
                    keyboardType: TextInputType.text,
                  ),
                ),
               SizedBox(height: 16),
              // Trip Days
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Trip Day',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
               SizedBox(height: 8),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu'].map((day) {
                return ChoiceChip(
                  label: Text(day),
                  selected: selectedDays.contains(day),
                  onSelected: (selected) {
                    setState(() {
                      selected
                          ? selectedDays.add(day)
                          : selectedDays.remove(day);
                    });
                  },
                  selectedColor: Colors.blue,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: selectedDays.contains(day) ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 5), 
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5), 
                ChoiceChip(
                  label: Text('Fri'),
                  selected: selectedDays.contains('Fri'),
                  onSelected: (selected) {
                    setState(() {
                      selected
                          ? selectedDays.add('Fri')
                          : selectedDays.remove('Fri');
                    });
                  },
                  selectedColor: Colors.blue,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: selectedDays.contains('Fri') ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(width: 5), // Space betn "Fri" ... "Sat"
               
                ChoiceChip(
                  label: Text('Sat'),
                  selected: selectedDays.contains('Sat'),
                  onSelected: (selected) {
                    setState(() {
                      selected
                          ? selectedDays.add('Sat')
                          : selectedDays.remove('Sat');
                    });
                  },
                  selectedColor: Colors.blue,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: selectedDays.contains('Sat') ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
              
               SizedBox(height: 16),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Route',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  
                  width: 327, 
                  height: 48,
                  child: TextField(
                    controller: TextEditingController(text: 'Search Route'),
                    enabled: false, 
                    decoration: InputDecoration(
                      hintText: 'Search Route',
                     
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
                    style: TextStyle(color: Colors.grey),
                    keyboardType: TextInputType.text,
                  ),
                ),
              SizedBox(height: 10),
              ListView(
  shrinkWrap: true,
  children: [
    ListTile(
      title: Text('Haripad → Alappuzha'),
      leading: Radio(value: 1, groupValue: 1, onChanged: (value) {}),
    ),
    SizedBox(height: 0), // Spacing
    ListTile(
      title: Text('Haripad → Alappuzha'),
      leading: Radio(value: 2, groupValue: 1, onChanged: (value) {}),
    ),
    SizedBox(height: 0), // Spacing
    ListTile(
      title: Text('Haripad → Alappuzha'),
      leading: Radio(value: 3, groupValue: 1, onChanged: (value) {}),
    ),
  ],
),

             SizedBox(height: 3),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: Text('Add Route'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
   // bottom sheet
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 103, 177, 1),
        title: const Text(
          'Create Bus',
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
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 16, right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 


               Text(
                'Add atleast 1 route to make bus active !',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(221,65,65,1),
                ),
              ),
              SizedBox(height:5),
               Text(
                'Bus Name*',
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                width: 340,
                decoration: BoxDecoration(color: Color.fromRGBO(221,220,220, 1),borderRadius: BorderRadius.circular(8),
                   border: Border.all(color: Colors.grey.shade200), ),
             
                child: TextField(
                  decoration: InputDecoration(
                       border: InputBorder.none,
                    hintText: 'Enter bus name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(205, 207, 208, 1), fontSize: 16),
                    
                    
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'RC Number*',
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                width: 340,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),
                   border: Border.all(color: Colors.grey.shade200), color: Color.fromRGBO(221,220,220, 1), ),
               
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter bus RC number',
                     contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
                    
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(205, 207, 208, 1), fontSize: 16),
                  
                  ),
                ),
              ),
               SizedBox(height: 16),
              Text(
                'State*',
                style: TextStyle(
                  fontFamily: "Inter",
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
                  color: Color.fromRGBO(221,220,220, 1), 
                  borderRadius: BorderRadius.circular(8),
                   border: Border.all(color: Colors.grey.shade200),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedState,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
                    hintText: 'Select route state',
                    hintStyle: TextStyle(
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
              const Text(
                'District*',
                style: TextStyle(
                  fontFamily: "Inter",
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
                color: Color.fromRGBO(221,220,220, 1), 
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedDistrict,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
                    hintText: 'Select route district',
                    
                    hintStyle: TextStyle(
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
              SizedBox(height: 16),
              Text(
                'Seating Capacity*',
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                width: 340,
                decoration:BoxDecoration( color:Color.fromRGBO(221,220,220, 1), 
                 borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter seating capacity',
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(205, 207, 208, 1), fontSize: 16),
                         contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
            
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Bus Preference',
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(9, 10, 10, 1),
                ),
              ),
              const SizedBox(height: 8),  


              // Preference Button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => selectBusPreference('Air Bus'),
                    child: Container(
                      height: 33,
                      width: 87,
                      decoration: BoxDecoration(
                        color: airBusSelected
                            ? Color.fromRGBO(15, 103, 177, 1)
                            : Color.fromRGBO(221,220,220, 1), 
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Air Bus',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => selectBusPreference('AC Bus'),
                    child: Container(
                      height: 33,
                      width: 87,
                      decoration: BoxDecoration(
                        color: acBusSelected
                            ? Color.fromRGBO(15, 103, 177, 1)
                            :   Color.fromRGBO(221, 220, 220, 1), 
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'AC Bus',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => selectBusPreference('Push Back Seat'),
                    child: Container(
                      height: 33,
                      width: 120,
                      decoration: BoxDecoration(
                        color: pushBackSeatSelected
                            ? Color.fromRGBO(15, 103, 177, 1)
                            : Color.fromRGBO(221, 220, 220, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Push Back Seat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
               Container(
          width: 350,
          height:142,
          padding: EdgeInsets.only(left:16,top:10,right:16),
          decoration: BoxDecoration(
            color: Color.fromRGBO(221, 220, 220, 1),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,
              
              ),
            ],
          ),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bus Route',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color.fromRGBO(0,0,0,1),
                    ),
                  ),
               Container(
  width: 56,  
  height: 21,  
  decoration: BoxDecoration(
    color: Color.fromRGBO(15, 103, 177, 1),
    borderRadius: BorderRadius.circular(5),
  ),
  child: Center(
    child: TextButton(
      onPressed: () {
     _showBottomSheet(context);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, 
      ),
      child: Text(
        'Add',
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        textAlign: TextAlign.center, 
      ),
    ),
  ),
)


                ],
              ),
              Padding(
        padding:  EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 5),
      Center(
        child: Column(
          children: [
            Icon(
              Icons.info,
              color: Colors.grey,
              size: 43,
            ),
                    SizedBox(height:2),
                    Text(
                      'Add Bus Route',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(141,141,141,1),
                        fontFamily: "Inter",
                      ),
                    ),

                   
                   
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height:22),
      
             Container(
                  width: 323.74,
                  height: 40,
                  margin: EdgeInsets.only(bottom: 16,left:16,right:16),
                  child: ElevatedButton(
                    onPressed: () {
                     //  bus button
                    },
                    child: Text(
                      'Update',
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
             

                Center(
                  child: Text("Delete Bus",
                  
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(221,65,65,1),
                  
                  ),
                  textAlign:TextAlign.center),
                ),
          
           
            ],
          ),
        ),
      ),
    );
  }
}
