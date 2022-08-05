import 'package:flutter/material.dart';
import 'package:timer_app/timer_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TIMERS LIST'), backgroundColor: Colors.red), 
        body: TimersList()), 
      debugShowCheckedModeBanner: false);
  }
}
