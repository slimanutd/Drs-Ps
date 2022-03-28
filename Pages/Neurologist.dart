import 'package:flutter/material.dart';
import 'package:flutter_application2/Pages/Doctors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'neurologist_docs.dart';

class neurologist extends StatefulWidget {
  const neurologist({Key? key}) : super(key: key);

  @override
  _neurologistState createState() => _neurologistState();
}

class _neurologistState extends State<neurologist> {
  List doctors = [];
  Future getpost() async {
    String url = "http://10.0.2.2:80/Ds&Ps/neurologist.php";

    var response = await http.get(Uri.parse(url));

    var responsebody = jsonDecode(response.body);

    setState(() {
      doctors.addAll(responsebody);
    });
  }

  @override
  void initState() {
    getpost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    routes:
    {
      neurologist_docs.routeName;
      (context) => const neurologist_docs();
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
            'NEUROLOGIST',
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
                    color: Colors.blue[900],
                  ))
                : ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                          child:
                              SPWidget(/*"${doctors[i]['hos_name']} Hospital",*/
                                  "Dr.${doctors[i]['doc_name']}"),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              neurologist_docs.routeName,
                              arguments: neur_docs(
                                  doctors[i]['doc_name'],
                                  doctors[i]['doc_phonenumber'],
                                  doctors[i]['hos_name']),
                            );
                          });
                    },
                  )));
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
            hosename,
            style: TextStyle(
                fontSize: 25, fontFamily: 'Oswald', color: Colors.blue[900]),
          ),
        ),*/
  );
}
