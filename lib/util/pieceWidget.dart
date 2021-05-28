import 'package:flutter/material.dart';

class Piece extends StatelessWidget {
  final double radius;
  final double level;
  final Color color;
  Piece(this.level, this.color, this.radius);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      child: Center(
        child: Text(
          level.round().toString(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle),
    );
  }
}
