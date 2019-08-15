import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  // Method
  Widget backButton() {
    return IconButton(
      icon: Icon(Icons.navigate_before),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Text("Authen"),
      body: SafeArea(
        // child: Text("Athen"),
        child: Stack(
          children: <Widget>[backButton()],
        ),
      ),
    );
  }
}
