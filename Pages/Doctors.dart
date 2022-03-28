import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'Neurologist.dart';
import 'cardiologist.dart';

class doctors extends StatefulWidget {
  const doctors({Key? key}) : super(key: key);

  @override
  _doctorsState createState() => _doctorsState();
}

class _doctorsState extends State<doctors> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      /*appBar: AppBar(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            'DOCTORS',
            style: TextStyle(
                fontSize: 45,
                fontFamily: 'TheNautigal',
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
          centerTitle: true,
          toolbarHeight: 100,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            iconSize: 40,
            color: Colors.blue[900],
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),*/
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        //margin: EdgeInsets.only(bottom: 15),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            InkWell(
              child: DocsWidget('lib/images/Nervs.jpg', 'Neurologist'),
              onTap: () {
                Navigator.of(context).pushNamed('neurologist');
              },
            ),
            InkWell(
              child: DocsWidget('lib/images/Heart.jpg', 'Cardiologist'),
              onTap: () {
                Navigator.of(context).pushNamed('cardiologist');
              },
            ),
            InkWell(
              child: DocsWidget('lib/images/Eye.jpg', 'Ophthalmologist'),
              onTap: () {},
            ),
            InkWell(
              child: DocsWidget('lib/images/Bone.jpg', 'Orthopedist'),
              onTap: () {},
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed("adddoctor");
          },
          label: Text(
            "Add Doctor",
            style: TextStyle(fontSize: 25),
          ),
          icon: Icon(
            Icons.add,
            size: 25,
          ),
          backgroundColor: Colors.blue[900],
        ),
      ),
    );
  }
}

Widget DocsWidget(String image, String text) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade900, width: 5),
        borderRadius: BorderRadius.circular(20)),
    margin: EdgeInsets.only(top: 25, left: 5, right: 5),
    width: double.maxFinite,
    child: Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Image.asset(
            image,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20, fontFamily: 'Oswald', color: Colors.blue[900]),
          ),
        ),
      ],
    ),
  );
}
