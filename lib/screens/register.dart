import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nut_qr_code/screens/my_service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  Color nameColor = Color.fromARGB(0xFF, 0x03, 0xa9, 0xf4);
  Color emailColor = Colors.blue;
  Color passwordColor = Colors.blueGrey[700];
  final formKey = GlobalKey<FormState>();
  String nameString, emailSring, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Methods
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Display Name: ",
        labelStyle: TextStyle(color: nameColor),
        helperText: "Type Your Name.",
        helperStyle: TextStyle(color: nameColor),
        hintText: "English Only",
        hintStyle: TextStyle(color: nameColor),
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: nameColor,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Please Fill Name in Blank.";
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Display Email: ",
        labelStyle: TextStyle(color: emailColor),
        helperText: "Type Your Email.",
        helperStyle: TextStyle(color: emailColor),
        hintText: "you@email.com",
        hintStyle: TextStyle(color: emailColor),
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: emailColor,
        ),
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return "Please keep Email Format.";
        }
      },
      onSaved: (String value) {
        emailSring = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Display Password: ",
        labelStyle: TextStyle(color: passwordColor),
        helperText: "Type Your Password.",
        helperStyle: TextStyle(color: passwordColor),
        hintText: "More 6 Charactor",
        hintStyle: TextStyle(color: passwordColor),
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: passwordColor,
        ),
      ),
      validator: (String value) {
        if (value.length < 6) {
          return "Please Type Password More 6 Charactor.";
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name = $nameString, email = $emailSring, pass = $passwordString');
          registerThread();
        }
      },
    );
  }

  Future<void> registerThread() async {
    // void = not return

    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailSring,
      password: passwordString,
    )
        .then((response) {
      print("Register Success.");
      setupDisplayName();
    }).catchError((response) {
      print("Respones: $response");
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  Future<void> setupDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    UserUpdateInfo userUpdateInfo = UserUpdateInfo();

    userUpdateInfo.displayName = nameString;
    firebaseUser.updateProfile(userUpdateInfo);

    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route) => false);
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: Text(title),
            title: ListTile(
              leading: Icon(Icons.add_alert),
              title: Text(
                title,
                style: TextStyle(color: Colors.red),
              ),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: <Widget>[registerButton(), registerButton()],
        actions: <Widget>[registerButton()],
        backgroundColor: Colors.pink[100],
        title: Text("Register"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          // padding: EdgeInsets.all(30.0),
          padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
          children: <Widget>[
            nameText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
