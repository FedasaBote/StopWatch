import 'package:flutter/material.dart';

class ElapsedTimeTextBasic extends StatelessWidget {
  const ElapsedTimeTextBasic({Key? key, required this.elapsed})
      : super(key: key);

  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    final hundreds = (elapsed.inMilliseconds / 10) % 100;
    final seconds = elapsed.inSeconds % 60;
    final minutes = elapsed.inMinutes % 60;
    final hundredStr = hundreds.toStringAsFixed(0).padLeft(2, "0");
    final secondStr = seconds.toString().padLeft(2, "0");
    final minuteStr = minutes.toString().padLeft(2, "0");
    return Text(
      "$minuteStr:$secondStr:$hundredStr",
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 40),
    );
  }
}
