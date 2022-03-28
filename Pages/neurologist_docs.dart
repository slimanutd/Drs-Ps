import 'package:flutter/material.dart';
import 'package:flutter_application2/Pages/Doctors.dart';

class neurologist_docs extends StatelessWidget {
  const neurologist_docs({Key? key}) : super(key: key);

  static const routeName = '/neurologist_docs';

  @override
  Widget build(BuildContext context) {
    final neurologistdocs =
        ModalRoute.of(context)?.settings.arguments as neur_docs;
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
          (neurologistdocs.name),
          style: TextStyle(
              fontSize: 50,
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
      ),
      body: Container(
          color: Colors.white,
          child: neur(
            title: neurologistdocs.name,
            hospital: neurologistdocs.hospital,
            phonenumber: neurologistdocs.phonenumber,
          )),
    );
  }
}

class neur_docs {
  final String name;
  final String hospital;
  final String phonenumber;
  neur_docs(this.name, this.hospital, this.phonenumber);
}

class neur extends StatelessWidget {
  final String title;
  final String hospital;
  final String phonenumber;

  neur(
      {Key? key,
      required this.title,
      required this.hospital,
      required this.phonenumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade900, width: 1),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(top: 15, left: 5, right: 5),
        height: 75,
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 25, fontFamily: 'Oswald', color: Colors.blue[900]),
        )),
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade900, width: 1),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(top: 15, left: 5, right: 5),
        height: 75,
        child: Center(
            child: Text(
          hospital,
          style: TextStyle(
              fontSize: 25, fontFamily: 'Oswald', color: Colors.blue[900]),
        )),
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade900, width: 1),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(top: 15, left: 5, right: 5),
        height: 75,
        child: Center(
            child: Text(
          phonenumber,
          style: TextStyle(
              fontSize: 25, fontFamily: 'Oswald', color: Colors.blue[900]),
        )),
      ),
    ]);
  }
}
