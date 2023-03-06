// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final Color color;

  const CircleButton({
    Key? key,
    required this.title,
    required this.onpress,
    this.color = Colors.blueGrey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onpress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
