
import 'package:flutter/material.dart';

class SeeMoreText extends StatelessWidget {

  final String title;
  final Color? color;

  const SeeMoreText({
    Key? key, required this.title, this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    );
  }
}