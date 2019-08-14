import 'package:flutter/material.dart';
import 'package:nut_qr_code/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    ); //change stateless
  }
}
