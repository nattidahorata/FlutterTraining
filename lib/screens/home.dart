import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // send data
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create staleless

  //Explicit
  double mySize = 180.0;

  //Methods
  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        child: Text("Sign Up"),
        onPressed: () {},
      ),
    );
  }

  Widget signInBotton() {
    return Expanded(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.blue[200],
        child: Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget showButtom() {
    return Container(
      width: 250.0,
      // color: Colors.yellow,
      child: Row(
        children: <Widget>[
          signInBotton(),
          signUpButton(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: mySize, //double
        height: mySize,
        child: Image.asset("images/logo.png"), //1 body
      ), //resize
    );
  }

  Widget showAppName() {
    return Text(
      'OR Code',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.red[900],
        fontFamily: "Raleway",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //theme
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showLogo(),
          showAppName(),
          showButtom(),
        ],
      ),
    );
  }
}
