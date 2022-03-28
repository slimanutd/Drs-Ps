import 'package:flutter/material.dart';
import 'package:flutter_application2/Pages/apitest.dart';
import 'package:flutter_application2/Pages/signup.dart';
import 'Pages/Hospitals.dart';
import 'Pages/Login.dart';
import 'Pages/Home.dart';
import 'Pages/Doctors.dart';
import 'Pages/Neurologist.dart';
import 'Pages/neurologist_docs.dart';
import 'Pages/cardiologist.dart';
import 'Pages/cardiologist_docs.dart';
import 'Pages/adddoctor.dart';
import 'Pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DRs&Ps',
      home: Loging(),
      routes: {
        'Home': (context) {
          return Home();
        },
        'Doctors': (context) {
          return doctors();
        },
        'Hospitals': (context) {
          return hospitals();
        },
        'Login': (context) {
          return Loging();
        },
        'neurologist': (context) {
          return neurologist();
        },
        neurologist_docs.routeName: (context) {
          return neurologist_docs();
        },
        'cardiologist': (context) {
          return cardiologist();
        },
        cardiologist_docs.routName: (context) {
          return cardiologist_docs();
        },
        'adddoctor': (context) {
          return adddoctor();
        },
        'signup': (context) {
          return signup();
        }
      },
    );
  }
}
