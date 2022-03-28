import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class apitest extends StatefulWidget {
  const apitest({Key? key}) : super(key: key);

  @override
  _apitestState createState() => _apitestState();
}

class _apitestState extends State<apitest> {
  String hinttext = "Choose";

  String numbervalue = "";
  var dropdownbutton = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red),
        body: Container(
          padding: EdgeInsets.only(top: 50, left: 10, right: 10),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                    child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  hint: Text(hinttext),
                  style: const TextStyle(color: Colors.blue, fontSize: 25),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  items: <String>[
                    'Neurologist',
                    'Cardiologist',
                    'Ophthalmologist',
                    'Orthopedist',
                  ].map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newvalue) {
                    if (newvalue == "Neurologist") {
                      numbervalue = "1";
                    }
                    if (newvalue == "Cardiologist") {
                      numbervalue = "2";
                    }
                    if (newvalue == "Ophthalmologist") {
                      numbervalue = "3";
                    }
                    if (newvalue == "Orthopedist") {
                      numbervalue = "4";
                    }
                    setState(() {
                      dropdownbutton.text = numbervalue;
                      hinttext = newvalue!;
                    });
                  },
                )),
              ),
              /*Center(
                child: Container(
                  padding: EdgeInsets.only(top: 30, right: 30, left: 30),
                  child: TextField(
                      controller: dropdownbutton,
                      decoration: InputDecoration()),
                ),
              )*/
            ],
          ),
        ));
  }
}
