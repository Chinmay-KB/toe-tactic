import 'package:flutter/material.dart';

class Piece extends StatelessWidget {
  final double radius;
  final double level;
  final Color color;
  Piece(this.level, this.color, this.radius);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius + 10,
      height: radius + 10,
      child: Center(
        child: Text(
          level.round().toString(),
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
