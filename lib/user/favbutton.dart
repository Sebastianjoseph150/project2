import 'package:flutter/material.dart';

class ColorChangingButton extends StatefulWidget {
  @override
  _ColorChangingButtonState createState() => _ColorChangingButtonState();
}

class _ColorChangingButtonState extends State<ColorChangingButton> {
  bool isPressed = false;

  void toggleButtonState() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: isPressed ? Colors.red : Colors.grey,
        // Change color based on button state
      ),
      onPressed: toggleButtonState,
      // iconSize: 10, // Toggle button state when pressed
    );
  }
}
