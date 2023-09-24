import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch/ui/reset_button.dart';
import 'package:stopwatch/ui/start_stop_button.dart';
import 'package:stopwatch/ui/stopwatchRenderer.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch>
    with SingleTickerProviderStateMixin {
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentElapsed = Duration.zero;
  bool _isRunning = false;
  Duration get _elapsed => _previouslyElapsed + _currentElapsed;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentElapsed = elapsed;
      });
    });
    // _ticker.start();
  }

  @override
  void dispose() {
    super.dispose();
    _ticker.dispose();
  }

  void _toggle() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsed += _currentElapsed;
        _currentElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _previouslyElapsed = Duration.zero;
      _currentElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final radius = constraint.maxWidth / 2;
      return Stack(
        children: [
          StopWatchRenderer(
            elapsed: _elapsed,
            radius: radius,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ResetButton(
                onPressed: _reset,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              height: 80,
              child: StartStopButton(
                isRunning: _isRunning,
                onPressed: _toggle,
              ),
            ),
          )
        ],
      );
    });
  }
}
