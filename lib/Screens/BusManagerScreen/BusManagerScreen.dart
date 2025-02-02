import 'package:buspay_owner/Screens/BusManagerScreen/Controller/BManagerController.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/CreateBusScreen.dart';
//import 'package:buspay_owner/Screens/BusManagerScreen/CreateBusScreen.dart';
import 'package:buspay_owner/Screens/BusManagerScreen/Views/BusListCard.dart';
import 'package:buspay_owner/Src/appButtons.dart';
import 'package:buspay_owner/Src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
 

class BusManagerScreen extends StatefulWidget {
  const BusManagerScreen({Key? key}) : super(key: key);

  @override
  State<BusManagerScreen> createState() => _BusManagerScreenState();
}

class _BusManagerScreenState extends State<BusManagerScreen> {
  //List<dynamic> busData = [];
  bool isLoading = true;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  BMController bmCtrl = Get.put(BMController());

  ValueNotifier<int> fetchNotifer = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    // String query = searchController.text.toLowerCase();
    // List<dynamic> filteredBusData = busData.where((bus) {
    //   return bus['name'].toLowerCase().contains(query);
    // }).toList();
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 103, 177, 1),
        title: Text(
          'Bus Manager',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GetBuilder<BMController>(builder: (_) {
        return _.isLoading
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 9, right: 9),
                    child: Column(
                      children: [
                        SpacerH(5.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: 'Search Bus',
                              suffixIcon:
                                  Icon(Icons.search, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                            ),
                            style: GoogleFonts.poppins(color: Colors.black),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 12),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (var data in bmCtrl.busList)
                                if (searchController.text.isEmpty ||
                                    data.name!.toLowerCase().contains(
                                        searchController.text.toLowerCase()))
                                  BuslistCard(model: data)
                            ],
                          ),
                        )),
                        SizedBox(
                          height: 60.h,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 20.h,
                      left: 20.w,
                      right: 20.w,
                      child: appButton.PrimaryButton(
                          name: "Create Bus",
                          onClick: () {
                            Get.to(() =>
                                CreateBusScreen(fetchNotifier: fetchNotifer));
                          }))
                ],
              );
      }),
    );
  }
}