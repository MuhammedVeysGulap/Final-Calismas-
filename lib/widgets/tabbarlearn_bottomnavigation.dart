
import 'package:flutter/material.dart';
import 'package:flutter_application_finalodevi/api/get/appointment_page_view.dart';
import 'package:flutter_application_finalodevi/views/doctors_page_view.dart';
import 'package:flutter_application_finalodevi/views/home_page_view.dart';
import 'package:flutter_application_finalodevi/views/mail_page_view.dart';
import 'package:flutter_application_finalodevi/views/person_page_view.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _selectedIndex = 0;
  List<Widget> _bottomList = [
    HomePage(),
    AppointmentPage(),
   MailPage(),
   DoctorsPage(),
   PersonPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline_sharp), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervisor_account), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: '')
          ]),
      body: _bottomList.elementAt(_selectedIndex),
    );
  }
}
