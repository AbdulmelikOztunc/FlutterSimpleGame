import 'package:flutter/material.dart';
enum Direction { up, down, left, right }
class Ball extends StatelessWidget {
  final double diam;
  Ball(this.diam,{super.key});
  double posX = 0;
  double posY = 0;
  Direction vDir = Direction.down;
  Direction hDir = Direction.right;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: diam,
      height: diam,
      decoration: BoxDecoration(
        color: Colors.amber[400],
        shape: BoxShape.circle,
      ),
    );
  }
}
class Ball2 extends StatelessWidget {
  final double diam;
  Ball2(this.diam,{super.key});
  double posX =0;
  double posY =0;
  Direction vDir = Direction.down;
  Direction hDir = Direction.right;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: diam,
      height: diam,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 239, 70, 3),
        shape: BoxShape.circle,
      ),
    );
  }
}