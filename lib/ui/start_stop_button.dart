import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton(
      {Key? key, required this.onPressed, required this.isRunning})
      : super(key: key);

  final VoidCallback onPressed;
  final bool isRunning;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: isRunning ? Colors.red : Colors.green,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
              width: 56,
              height: 56,
              child: isRunning
                  ? const Icon(
                      Icons.stop,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    )),
        ),
      ),
    );
  }
}
