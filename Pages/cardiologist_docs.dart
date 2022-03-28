import 'package:flutter/material.dart';
import 'package:flutter_application2/Pages/cardiologist.dart';

class cardiologist_docs extends StatelessWidget {
  const cardiologist_docs({Key? key}) : super(key: key);
  static const routName = '/cardiologist_docs';
  @override
  Widget build(BuildContext context) {
    final cardiologistdocs =
        ModalRoute.of(context)?.settings.arguments as cardio_docs;
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
          (cardiologistdocs.name),
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
          child: cardio(
            title: cardiologistdocs.name,
            hospital: cardiologistdocs.hospital,
            phonenumber: cardiologistdocs.phonenumber,
          )),
    );
  }
}

class cardio_docs {
  final String name;
  final String hospital;
  final String phonenumber;
  cardio_docs(this.name, this.hospital, this.phonenumber);
}

class cardio extends StatelessWidget {
  final String title;
  final String hospital;
  final String phonenumber;
  const cardio(
      {Key? key,
      required this.hospital,
      required this.phonenumber,
      required this.title})
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
