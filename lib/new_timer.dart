import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timer_app/timer.dart';

class NewTimer extends StatefulWidget {
  @override
  NewTimerState createState() => NewTimerState();
}

class NewTimerState extends State<NewTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NEW TIMER'), backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Align(
          alignment: Alignment.topCenter,
          child: InkWell(
            onTap: () {
              var random = Random();
              int randomNumber = 1 + random.nextInt(60);
              var timer = MyTimer('Timer $randomNumber', randomNumber);
              Navigator.of(context).pop(timer);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 12,
              color: Colors.red,
              child: const Center(child: Text('Start Random Timer', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}
