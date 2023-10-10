import 'package:flutter/material.dart';

class Bat extends StatelessWidget {
  final double width;
  final double height;
  const Bat(this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 21, 153, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
    );
  }

  
}
class AiBat extends StatelessWidget {
  final double AIWidth;
  final double AIHeight;
  const AiBat(this.AIWidth, this.AIHeight, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              width: AIWidth,
              height: AIHeight,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 21, 153, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
            );
  }

  
}
class Level3extraWoll extends StatelessWidget {
  final double width;
  final double height;
  const Level3extraWoll(this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 111, 21),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
    );
  }

  
}