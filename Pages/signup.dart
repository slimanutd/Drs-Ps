import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  var user_name = new TextEditingController();
  var user_email = new TextEditingController();
  var user_phonenumber = new TextEditingController();
  var user_password = new TextEditingController();
  var doc_or_pat = new TextEditingController();
  String hinttext = 'You are a ';
  senddata() async {
    var url = "http://10.0.2.2:80/Ds&Ps/Signup.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "user_name": "${user_name.text}",
        "user_email": "${user_email.text}",
        "user_password": "${user_password.text}",
        "user_phonenumber": "${user_phonenumber.text}",
        "doc_or_user": "${doc_or_pat.text}",
      },
      encoding: Encoding.getByName('utf8mb4_general_ci'),
    );

    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Signup',
            style: TextStyle(
                fontSize: 70,
                fontFamily: 'TheNautigal',
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
          centerTitle: true,
          toolbarHeight: 120,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            iconSize: 40,
            color: Colors.blue.shade900,
            onPressed: () {
              Navigator.of(context).pushNamed("Login");
            },
          )),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        color: Colors.white,
        height: size.height,
        child: ListView(
          children: <Widget>[
            signupwidget('name', 'Enter your name', user_name),
            signupwidget('email', 'Enter your email', user_email),
            signupwidget('password', 'Enter password', user_password),
            signupwidget(
                'phonenumber', 'Enter your phonenumber', user_phonenumber),
            Container(
                width: size.width,
                padding: EdgeInsets.only(top: 30, right: 30, left: 30),
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  elevation: 50,
                  hint: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      hinttext,
                      style: TextStyle(fontSize: 20, color: Colors.blue[900]),
                    ),
                  ),
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  underline: Container(
                    height: 1,
                    color: Colors.blue[900],
                  ),
                  items: <String>[
                    'Doctor',
                    'Patient',
                  ].map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newvalue) {
                    setState(() {
                      hinttext = newvalue!;
                      doc_or_pat.text = newvalue;
                    });
                  },
                )),
            Container(
                width: size.width,
                padding: EdgeInsets.only(top: 20, right: 30, left: 30),
                child: ElevatedButton.icon(
                    onPressed: () {
                      senddata();
                      ;
                    },
                    icon: Icon(Icons.add, size: 30),
                    label: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)))))),
          ],
        ),
      ),
    );
  }
}

Widget signupwidget(
    String hinttext, String labeltext, TextEditingController control) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(right: 20, left: 20, top: 30),
    child: TextField(
      controller: control,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: labeltext,
          labelStyle: TextStyle(color: Colors.blue[900]),
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.blue[900]),
          helperStyle: TextStyle(color: Colors.white, fontSize: 10),
          suffixStyle: const TextStyle(color: Colors.blue)),
    ),
  );
}
