import 'dart:convert';
import 'package:buspay_owner/Screens/BusManagerScreen/BusViewScreen.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/CreateBusScreen.dart';
//import 'package:buspay_owner/Screens/BusManagerScreen/BusViewScreen.dart';
import 'package:buspay_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BusManagerScreen extends StatefulWidget {
  const BusManagerScreen({Key? key}) : super(key: key);

  @override
  State<BusManagerScreen> createState() => _BusManagerScreenState();
}

class _BusManagerScreenState extends State<BusManagerScreen> {
  List<dynamic> busData = [];
  bool isLoading = true;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchBusData();
    searchController.addListener(() {
      setState(() {}); // Rebuilds the widget when the text changes
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchBusData() async {
    final String apiUrl = '$baseUrl/v1/bus'; // Replace with actual API URL
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        setState(() {
          busData = jsonDecode(response.body)['data'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching bus data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String query = searchController.text.toLowerCase(); // Current search query
    List<dynamic> filteredBusData = busData.where((bus) {
      return bus['name'].toLowerCase().contains(query); // Filter logic
    }).toList();

    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1),
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 9, right: 9),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatCard('05', 'Running'),
                          _buildStatCard('05', 'Suspended'),
                          _buildStatCard('20%', 'Market'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search Bus',
                            suffixIcon: Icon(Icons.search, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          itemCount: query.isEmpty ? busData.length : filteredBusData.length,
                          itemBuilder: (context, index) {
                            final bus = query.isEmpty ? busData[index] : filteredBusData[index];
                            final busStatus = bus['status'] ?? 'Active'; // Default to 'Inactive' if status is missing
                            return Column(
                              children: [
                                BusCard(
                                  status: busStatus, 
                                  name: bus['name'],
                                  source: 'Haripad',
                                  destination: 'Alappuzha',
                                  conductors: '108',
                                ),
                                SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateBusScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Create Bus',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
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
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Container(
      height: 64,
      width: 100,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class BusCard extends StatelessWidget {
  final String status;
  final String name;
  final String source;
  final String destination;
  final String conductors;

  BusCard({
    required this.status,
    required this.name,
    required this.source,
    required this.destination,
    required this.conductors,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> statusColors = {
      'Active': Colors.green,
      'Pending': Colors.orange,
      'Inactive': Colors.red,
    };

    final Color statusColor = statusColors[status] ?? Colors.black; 

    return Container(
      height: 68,
      width: 348,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromRGBO(15, 103, 177, 0.15),
          width: 2,
        ),
      ),
      margin: EdgeInsets.only(left: 11, right: 11),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 10, bottom: 22),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                _navigateToScreen(context, status, name, source, destination, conductors);
              },
              child: Text(
                status,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(
              source,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                fontFamily: "Lato",
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward, size: 15),
            SizedBox(width: 5),
            Text(
              destination,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                fontFamily: "Lato",
              ),
            ),
          ],
        ),
        trailing: Container(
          width: 51,
          height: 46,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                conductors,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              Text(
                'Conductor',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(
    BuildContext context,
    String status,
    String name,
    String source,
    String destination,
    String conductors,
  ) {
    if (status == 'Active') {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BusViewScreen(status: status),
    ),
  );
} else {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('This bus is not active.')),
  );
}

  }
}


