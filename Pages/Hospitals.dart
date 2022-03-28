import 'package:flutter/material.dart';

class hospitals extends StatefulWidget {
  const hospitals({Key? key}) : super(key: key);

  @override
  _hospitalsState createState() => _hospitalsState();
}

class _hospitalsState extends State<hospitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'HOSPITALS',
          style: TextStyle(
              fontSize: 40,
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
            Navigator.of(context).pop('Home');
          },
        ),
      ),*/
        );
  }
}

Widget HosWidget(/*String image, */ String text) {
  return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 5),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(top: 25, left: 5, right: 5),
        width: double.maxFinite,
        child: Expanded(
            child: (

                /*Container(
          margin: EdgeInsets.only(left: 15),
          child: Image.asset(
            image,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),*/
                Container(
          child: Center(
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: text,
              //textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25, fontFamily: 'Oswald', color: Colors.blue[900]),
            ),
          ]))),
        ))),
      ));
}
