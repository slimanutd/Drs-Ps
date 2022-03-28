import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cardiologist_docs.dart';

class cardiologist extends StatefulWidget {
  const cardiologist({Key? key}) : super(key: key);

  @override
  _cardiologistState createState() => _cardiologistState();
}

class _cardiologistState extends State<cardiologist> {
  List doctors = [];
  Future getdata() async {
    String url = "http://10.0.2.2:80/Ds&Ps/cardiologist.php";
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    setState(() {
      doctors.addAll(responsebody);
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    routes:
    {
      cardiologist_docs.routName;
      (context) => const cardiologist_docs();
    }
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
            'CARDIOLOGIST',
            style: TextStyle(
                fontSize: 30,
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
            child: doctors == null || doctors.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.blue.shade900,
                  ))
                : ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                          child: SPWidget(
                              /*"${doctors[i]['hos_name']} Hospital",*/
                              "Dr.${doctors[i]['doc_name']}"),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              cardiologist_docs.routName,
                              arguments: cardio_docs(
                                  doctors[i]['doc_name'],
                                  doctors[i]['doc_phonenumber'],
                                  doctors[i]['hos_name']),
                            );
                          });
                    })));
  }
}

Widget SPWidget(String docname /*, String hosname*/) {
  return Container(
    height: 75,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade900, width: 1),
        borderRadius: BorderRadius.circular(20)),
    margin: EdgeInsets.only(top: 15, left: 5, right: 5),
    width: double.maxFinite,
    child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Center(
          child: Text(docname,
              style: TextStyle(
                  fontSize: 25, fontFamily: 'Oswald', color: Colors.blue[900])),
        )),
    /*Container(
          margin: EdgeInsets.only(left: 50),
          child: Text(
            hosname,
            style: TextStyle(
                fontSize: 25, fontFamily: 'Oswald', color: Colors.blue[900]),
          ),
        ),*/
  );
}
