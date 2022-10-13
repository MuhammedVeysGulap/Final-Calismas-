import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_finalodevi/constants/work_const.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                radius: 100,
                lineWidth: 30,
                percent: 0.8,
                progressColor: FinalWorkConst.colorGreen,
                backgroundColor: FinalWorkConst.colorGrey,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  '% 80',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearPercentIndicator(
                  animation: true,
                animationDuration: 1000,
                lineHeight: 30,
                  percent: 0.8,
                progressColor: FinalWorkConst.colorGreen,
                backgroundColor: FinalWorkConst.colorGrey,
               
              ),
            )
          ],
        ),
      ),
    );
  }
}
