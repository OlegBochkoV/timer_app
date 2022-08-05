import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timer_app/timer.dart';

class ItemTimer extends StatefulWidget {
  MyTimer timer;
  VoidCallback func;
  int index;
  ItemTimer({Key? key, required this.timer, required this.func, required this.index}) : super(key: key);
  @override
  ItemTimerState createState() => ItemTimerState();
}

class ItemTimerState extends State<ItemTimer> {
  late Timer currentTimer;
  late bool state;

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  void dispose() {
    super.dispose();
    currentTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            Text(widget.timer.name),
            const Spacer(),
            state ? Text('${widget.timer.seconds} sec') : const Text('pause')
          ],
        ),
        const SizedBox(height: 15),
        Container(color: Colors.black, height: 1)
      ],
    );
  }

  void timer() {
    state = widget.index > 3 ? false : true;
    if(state) {
      currentTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        widget.timer.seconds = widget.timer.seconds - 1;
        widget.func();
      });
    } else {
      currentTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {});
    }
  }
}
