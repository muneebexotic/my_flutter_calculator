import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonLabel;
  final Color buttonColor;
  final VoidCallback onPress;
  const MyButton(
      {super.key, required this.buttonLabel, required this.buttonColor, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(shape: BoxShape.circle, color: buttonColor),
            child: Center(
              child: Text(
                buttonLabel,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
