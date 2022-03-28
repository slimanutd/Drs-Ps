import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application2/Pages/Doctors.dart';
import 'package:flutter_application2/Pages/Home.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class adddoctor extends StatefulWidget {
  const adddoctor({Key? key}) : super(key: key);

  @override
  _adddoctorState createState() => _adddoctorState();
}

class _adddoctorState extends State<adddoctor> {
  String hos_hinttext = "Choose Hospital";
  String sp_hinttext = "Choose Specialization";
  String numbervalue = "";
  var data;
  var name = new TextEditingController();
  var phonenumber = new TextEditingController();
  var specialization = new TextEditingController();
  var hospitals = new TextEditingController();
  senddata() async {
    var url = "http://10.0.2.2:80/Ds&Ps/adddoctor.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "name": "${name.text}",
        "phonenumber": "${phonenumber.text}",
        "specialization": "${specialization.text}",
        "hospitals": "${hospitals.text}",
      },
      encoding: Encoding.getByName('utf8mb4_general_ci'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      data = response.statusCode;
    } else {
      data = 0;
    }
  }

  @override
  void initState() {
    senddata();
    data;
    super.initState();
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
            'Add Doctors',
            style: TextStyle(
                fontSize: 45,
                fontFamily: 'TheNautigal',
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
          centerTitle: true,
          toolbarHeight: 120,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            iconSize: 40,
            color: Colors.blue[900],
            onPressed: () {
              Navigator.of(context).pushNamed("Home");
            },
          ),
        ),
        body: Container(
          //width: size.width,
          color: Colors.white,
          child: ListView(children: <Widget>[
            //doctor name
            Container(
              width: size.width,
              padding: EdgeInsets.only(top: 30, right: 20, left: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Enter Doctor name',
                  labelStyle: TextStyle(color: Colors.blue[900]),
                  hintText: 'Doctor Name',
                  hintStyle: TextStyle(color: Colors.blue[900]),
                  helperStyle: TextStyle(color: Colors.white, fontSize: 10),
                  suffixStyle: const TextStyle(color: Colors.blue),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                controller: name,
              ),
            ),
            //doctor phonenumber
            Container(
              width: size.width,
              padding: EdgeInsets.only(top: 30, right: 20, left: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Enter Doctor Phonenumber',
                  labelStyle: TextStyle(color: Colors.blue[900]),
                  hintText: 'Doctor Phonenumber',
                  hintStyle: TextStyle(color: Colors.blue[900]),
                  helperStyle: TextStyle(color: Colors.white, fontSize: 10),
                  suffixStyle: const TextStyle(color: Colors.blue),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                controller: phonenumber,
              ),
            ),
            //doctor specialization
            Container(
                width: size.width,
                padding: EdgeInsets.only(top: 30, right: 30, left: 30),
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  elevation: 50,
                  hint: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      sp_hinttext,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  underline: Container(
                    height: 1,
                    color: Colors.blue[900],
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
                      specialization.text = numbervalue;
                      sp_hinttext = newvalue!;
                    });
                  },
                )),
            //doctor hospital

            Container(
                width: size.width,
                padding: EdgeInsets.only(top: 30, right: 30, left: 30),
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  elevation: 16,
                  hint: Text(
                    hos_hinttext,
                    style: TextStyle(fontSize: 20),
                  ),
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  underline: Container(
                    height: 1,
                    color: Colors.blue.shade900,
                  ),
                  items: <String>[
                    'Al-Basel',
                    'Al-mona',
                    'Al-Mashrek',
                    'Al-Hekmeh',
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
                      hospitals.text = numbervalue;
                      hos_hinttext = newvalue!;
                    });
                  },
                )),
            //elevated button
            Container(
                width: size.width,
                padding: EdgeInsets.only(top: 40, right: 30, left: 30),
                child: ElevatedButton.icon(
                    onPressed: () {
                      senddata();
                      if (name.text == "" ||
                          phonenumber.text == "" ||
                          specialization.text == "" ||
                          hospitals.text == "") {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Fill the textfield"),
                              );
                            });
                      } else {
                        if (data == 200) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("The data has been added !!"),
                                );
                              });
                          Timer(Duration(seconds: 2), () {
                            Navigator.of(context).pushNamed("Home");
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    content: Text(
                                        "Something went wrong !!\nCheck your internet connection"));
                              });
                          Timer(Duration(seconds: 3), () {
                            Navigator.of(context).pushNamed("Home");
                          });
                        }
                      }
                    },
                    icon: Icon(Icons.add, size: 30),
                    label: Text("Add Doctor"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        )))),
          ]),
        ));
  }
}
