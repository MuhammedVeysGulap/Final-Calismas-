import 'package:flutter/material.dart';
import 'package:flutter_application_finalodevi/api/get/appointment_page_view.dart';
import 'package:flutter_application_finalodevi/api/insert/sign_up.dart';
import 'package:flutter_application_finalodevi/views/home_page_view.dart';
import 'package:flutter_application_finalodevi/views/info_page_view.dart';
import 'package:flutter_application_finalodevi/views/login_page_view.dart';
import 'package:flutter_application_finalodevi/widgets/tabbarlearn_bottomnavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Odevi',
      theme: ThemeData(primarySwatch: Colors.indigo,),
      debugShowCheckedModeBanner: false,
      home: const InfoPage(),
    );
  }
}

