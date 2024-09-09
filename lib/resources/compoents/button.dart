import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mybuttton extends StatelessWidget {
  const Mybuttton({super.key, required this.onpress, required this.name});

  final VoidCallback onpress;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 115, 155, 6), // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 24, vertical: 12), // Button padding
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16, // Font size
          fontWeight: FontWeight.bold, // Font weight
        ),
      ),
    );
  }
}
