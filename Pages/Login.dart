import 'dart:ui';

import 'package:flutter/material.dart';
import 'Home.dart';

class Loging extends StatefulWidget {
  const Loging({Key? key}) : super(key: key);

  @override
  _LogingState createState() => _LogingState();
}

class _LogingState extends State<Loging> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //appBar
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Login',
          style: TextStyle(
              fontSize: 70,
              fontFamily: 'TheNautigal',
              fontWeight: FontWeight.bold,
              color: Colors.blue[900]),
        ),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      //body
      body: Container(
        padding: EdgeInsets.only(top: 40),
        color: Colors.white,
        height: size.height,
        child: ListView(
          children: <Widget>[
            Container(
              width: size.width,
              child: Column(
                children: <Widget>[
                  //textfields1
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 30),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Enter Name',
                          labelStyle: TextStyle(color: Colors.blue[900]),
                          hintText: 'Enter Your Name',
                          hintStyle: TextStyle(color: Colors.blue[900]),
                          helperText: 'enter your UserName or E-mail',
                          helperStyle:
                              TextStyle(color: Colors.white, fontSize: 10),
                          suffixStyle: const TextStyle(color: Colors.blue)),
                    ),
                  ),
                  //textFields2
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 30),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Enter Password',
                          labelStyle: TextStyle(color: Colors.blue[900]),
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(color: Colors.blue[900]),
                          suffixStyle: const TextStyle(color: Colors.blue)),
                    ),
                  ),
                  //ElevatedButton
                  Center(
                    child: Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 40, right: 30, left: 30),
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.login, size: 30),
                            label: Text(
                              "Log In",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue[900]),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)))))),
                  ),
                  //Forgot your Password?
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot your Password?",
                            style: TextStyle(
                                fontSize: 15, color: Colors.blue[900]))),
                  ),
                  //Sign up
                  Container(
                    child: Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('signup');
                            },
                            child: Text("Sign up",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blue[900])))),
                  ),
                  Container(
                    child: Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('Home');
                            },
                            child: Text("Skip as a guest",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.blue[900])))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
