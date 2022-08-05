import 'package:flutter/material.dart';
import 'package:timer_app/item_timer.dart';
import 'package:timer_app/new_timer.dart';
import 'package:timer_app/timer.dart';

class TimersList extends StatefulWidget{
  @override
  TimersListState createState() => TimersListState();
}

class TimersListState extends State<TimersList> {
  List<MyTimer> timers = [];

  @override
  Widget build(BuildContext context) {
    checkTimerTimeOut();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: listTimers())
              )
            ),
            const Spacer(flex: 1),
            Expanded(
                flex: 2, 
                child: Row(
                  children: [
                    Text('TOTAL: ${timers.length}'),
                  ],
                )
              )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final timer = await Navigator.push(context, MaterialPageRoute<MyTimer>(builder: (BuildContext context) => NewTimer()));
          if(timer != null) {
            timers.add(timer);
            func();
          }
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }

  void func() => setState(() {});

  List<Widget> listTimers() {
    List<Widget> result = [];
    for(int i = 0; i < timers.length; i++) result.add(ItemTimer(timer: timers[i], func: func, index: i));
    return result;
  }

  void checkTimerTimeOut() {
    List<MyTimer> timersResult = [];
    for (var element in timers) {
      if(element.seconds > 0) timersResult.add(element);
    }
    timers = timersResult;
  }
}
