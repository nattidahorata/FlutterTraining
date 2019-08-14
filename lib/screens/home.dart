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
  Color myColor = Colors.blue[200];

  //Methods
  Widget mySizeBox() {
    return SizedBox(
      width: 6.0,
      height: 12.0,
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        borderSide: BorderSide(color: myColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          "Sign Up",
          style: TextStyle(color: myColor),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signInBotton() {
    return Expanded(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: myColor),
          borderRadius: BorderRadius.circular(30.0),
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
          mySizeBox(),
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
      body: Container(
        // color: Colors.blue,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.white, Colors.blue],
                radius: 1.0,
                center: Alignment.center)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            showButtom(),
          ],
        ),
      ),
    );
  }
}
