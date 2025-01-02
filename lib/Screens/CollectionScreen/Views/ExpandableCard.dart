import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandableCard extends StatelessWidget {
  final ExpandableCardController controller;

  const ExpandableCard({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isExpanded = controller.isExpanded.value;
      return GestureDetector(
        onTap: controller.toggleExpand,
        child: Container(
          width: 366,
          height: isExpanded ? 210 : 120,
          margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                child: Row(
                  children: [
                    Text(
                      'Sinthumol',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '(Haripad - Alappuzha)',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                width: 333,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Divider(color: Color.fromRGBO(226, 226, 226, 1)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('2100.88',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    Text('54%',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: const Color.fromRGBO(74, 160, 222, 1))),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 7,
                width: 333,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: LinearProgressIndicator(
                  value: 0.54,
                  backgroundColor: Colors.grey[400],
                  color: const Color.fromRGBO(74, 160, 222, 1),
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Reema Shareen',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          const Spacer(),
                          Text('20',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Conductor Incharge',
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          const Spacer(),
                          Text('Total Ticket Sold',
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text('12-10-2024',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          const Spacer(),
                          Text('12:30 Pm',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Date and Time',
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          const Spacer(),
                          Text('Completed Time',
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}



class ExpandableCardController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpand() {
    isExpanded.value = !isExpanded.value;
  }
}
