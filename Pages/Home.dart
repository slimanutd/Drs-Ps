import 'package:flutter/material.dart';
import 'package:flutter_application2/Pages/Hospitals.dart';
import 'Doctors.dart';
import 'Login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get _tabController => null;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            backgroundColor: Colors.white,
            title: Text(
              'Ds&Ps',
              style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'TheNautigal',
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900]),
            ),
            centerTitle: true,
            toolbarHeight: 150,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              iconSize: 40,
              color: Colors.blue.shade900,
              onPressed: () {
                Navigator.of(context).pushNamed("Login");
              },
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Container(
                  width: (size.width) / 3,
                  child: Tab(
                      child: Text("Doctors",
                          style: TextStyle(
                              color: Colors.blue, fontSize: size.width / 26))),
                ),
                Container(
                  width: (size.width) / 3,
                  child: Tab(
                      child: Text("Hospital",
                          style: TextStyle(
                              color: Colors.blue, fontSize: size.width / 26))),
                ),
                Container(
                  width: (size.width) / 3,
                  child: Tab(
                      child: Text("Pharmacies",
                          style: TextStyle(
                              color: Colors.blue, fontSize: size.width / 26))),
                )
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Center(
              child: doctors(),
            ),
            Center(
              child: hospitals(),
            ),
            Center(
              child: Text("It's Pharmaciest here"),
            ),
          ]),
          /*PageView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                InkWell(
                  child: Hwidget(
                      'DOCTORS',
                      'for all Doctors Data & Informations press any where',
                      'lib/images/Doctor.jpg'),
                  onTap: () {
                    Navigator.of(context).pushNamed('Doctors');
                  },
                ),
                InkWell(
                  child: Hwidget(
                      'HOSPITALS',
                      'for all Hospitals Data & Informations press any where',
                      'lib/images/Hospital.jpg'),
                  onTap: () {
                    Navigator.of(context).pushNamed('Hospitals');
                  },
                ),
                InkWell(
                  child: Hwidget(
                      'PHARMACIES',
                      'for all Pharmacies Data & Information press any where',
                      'lib/images/Pharmacy1.jpg'),
                  onTap: () {},
                ),
              ],
            )*/
        ));
  }
}

/*Widget Hwidget(
  String text,
  text2,
  String image,
) {
  return Container(
    width: double.maxFinite,
    height: double.maxFinite,
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 20),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: 50),
          child: (Image.asset(
            image,
            fit: BoxFit.contain,
          )),
        ),
        Container(
          //margin: EdgeInsets.only(top: 50),
          child: Center(
            child: Text(text2,
                style: TextStyle(color: Colors.blue[900], fontSize: 12)),
          ),
        ),
      ],
    ),
  );
}*/
