import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class Clock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClockState();
  }
}

class _ClockState extends State<Clock> {
  Timer _timer;
  final _date = DateFormat('yyyy年MM月dd日');
  final _currentTime = DateFormat('HH時mm分ss秒');

  @override
  void initState() {
    print('初期化');
    _timer = Timer.periodic(
      Duration(seconds: 1),
      clock,
    );
    super.initState();
  }

  clock(Timer t) {
    print(_currentTime.format(DateTime.now()));
    setState(() {});
  }

  @override
  void dispose() {
    print('破棄');
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${_date.format(DateTime.now())}',
          style: GoogleFonts.robotoMono(fontSize: 100),
        ),
        Text(
          '${_currentTime.format(DateTime.now())}',
          style: GoogleFonts.robotoMono(fontSize: 200),
        ),
      ],
    );
  }
}