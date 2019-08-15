import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nut_qr_code/screens/home.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  String nameLogin = "";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameLogin = firebaseUser.displayName;
    });
  }

  Widget showLogin() {
    return Text(
      "Login by $nameLogin",
      style: TextStyle(color: Colors.white),
    );
  }

  Widget shoAppName() {
    return Text(
      "QR Code",
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: "Raleway",
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 80.0,
      width: 80.0,
      child: Image.asset("images/logo.png"),
    );
  }

  Widget myDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        // gradient: RadialGradient(
        //   colors: [
        //     Colors.white,
        //     Colors.yellow,
        //   ],
        //   radius: 1.0,
        // ),
        image: DecorationImage(
            image: AssetImage("images/land.jpg"), fit: BoxFit.fill),
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          shoAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget pageFirstMenu() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text("First Page"),
      subtitle: Text("This is show list view"),
      onTap: () {
        Navigator.of(context).pop(); // call back, back
      },
    );
  }

  Widget pageSecondMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text("Second Page"),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget pageSignOutMenu() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text("Sign Out"),
      onTap: () {
        Navigator.of(context).pop();
        mySignOut(); // call back, back
      },
    );
  }

  Future<void> mySignOut() async {
    await firebaseAuth.signOut().then(
      (response) {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Home());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      },
    );
  }

  Widget myDivider() {
    return Divider();
  }

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        // scoll
        children: <Widget>[
          myDrawerHeader(),
          pageFirstMenu(),
          myDivider(),
          pageSecondMenu(),
          myDivider(),
          pageSignOutMenu(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Service"),
      ),
      body: Text("body"),
      drawer: myDrawer(),
    );
  }
}
