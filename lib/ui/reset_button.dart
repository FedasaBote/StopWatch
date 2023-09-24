import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.grey[200],
        child: InkWell(
          onTap: onPressed,
          child: const SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
