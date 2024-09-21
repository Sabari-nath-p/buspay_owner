import 'package:buspay_owner/Screens/AuthenticationScreen/AuthenticationScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(buspay_owner());
}

class buspay_owner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: AuthenticationScreen(),
    );
  }
}

