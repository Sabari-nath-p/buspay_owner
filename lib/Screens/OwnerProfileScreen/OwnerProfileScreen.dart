import 'package:flutter/material.dart';

class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({super.key});
 Widget buildSectionTitle(String title, {String? actionText, VoidCallback? onActionTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // bank detial,change text
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText,
                style: const TextStyle(color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
// profilecard
  Widget buildInfoCard(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color:Color.fromRGBO(151,151,151,1), size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Color.fromRGBO(0,0,0,0.69),fontSize: 10,fontWeight:FontWeight.w600,fontFamily: "Lato"),),
              Text(
                value,
                style: const TextStyle(color:Color.fromRGBO(0,0,0,0.69),fontSize: 14,fontWeight:FontWeight.w600,fontFamily: "Lato"),),
              
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color.fromRGBO(252,252,252,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15,103,177,1), 
        title: Text(
          'Owner Profile',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white), 
          onPressed: () { Navigator.pop(context);},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 26.5,vertical:18),
        child: Column(
          children: [
          // profile card
            Container(
          
              height:86,
              width:335,
              decoration: BoxDecoration(
                color: Color.fromRGBO(217,217,217,0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor:Color.fromRGBO(217,217,217,0.44),
                      child: const Text(
                        'SP',
                        style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600,fontFamily:"Poppins",color:Color.fromRGBO(151,151,151,1)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Sabarinath P',
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500,fontFamily: "Poppins",color:Colors.black),
                        ),
                        //SizedBox(height:1),
                        Text('sabarinath5604@gmail.com', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,fontFamily: "Poppins",color:Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bank Details 
            buildSectionTitle('Bank Details', actionText: 'Change', onActionTap: () {}),
            Container(
              height: 182,
              width:335,
              decoration: BoxDecoration(
               color: Color.fromRGBO(245,245,245,1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoCard(Icons.account_balance, 'Bank Name', 'Federal Bank'),
                     SizedBox(height:7),
                    buildInfoCard(Icons.card_membership, 'Account Number', '18690100048445'),
                     SizedBox(height: 7),
                    buildInfoCard(Icons.comment_bank_outlined, 'IFSC Code', 'FDRL186901'),
                    SizedBox(height: 7),
                    buildInfoCard(Icons.location_on_outlined, 'Branch Name', 'Karuvatta'),
                  ],
                ),
              ),
            ),
             SizedBox(height: 10),

            // Contact Details 
            buildSectionTitle('Contact Details'),
            Container(
              height: 182,
              width:335,
              decoration: BoxDecoration(
               color: Color.fromRGBO(245,245,245,1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoCard(Icons.account_balance, 'Phone', '+91 7594092293'),
                    const SizedBox(height: 7),
                    buildInfoCard(Icons.home, 'Address', 'Home 01, Karuvatta, Alappuzha'),
                    const SizedBox(height: 7),
                    buildInfoCard(Icons.pin_drop, 'Pincode', '690517'),
                    const SizedBox(height: 7),
                    buildInfoCard(Icons.location_on_outlined, 'District', 'Alappuzha'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}