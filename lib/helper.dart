import 'dart:math';
import 'package:flutter/material.dart';

class Randoms {
  double randomNumber() {
//this is a number between 0.5 and 1.5;
    var ran = Random();
    int myNum = ran.nextInt(101);
    return (50 + myNum) / 100;
  }

  double AIbatNumber() {
    var ran = Random();
    int myNum = ran.nextInt(101);
    return (myNum) / 100;
  }

  double IncrementNumber() {
    var ran = Random();
    int myNum = ran.nextInt(2);
    return (myNum + 5000) / 5000;
  }
}

Widget ortaCizgi(double width, double height) {
  return Column(
    children: [
      // Row(
      //   children: [
      //     const Text("Set",
      //         style: TextStyle(
      //           color: Color.fromARGB(100, 83, 195, 247),
      //           fontSize: 28,
      //         )),
      //     SizedBox(width: 550),
      //     Text("Score",
      //         style: TextStyle(
      //           color: Color.fromARGB(100, 83, 195, 247),
      //           fontSize: 28,
      //         ))
      //   ],
      // ),
      Row(
        children: [
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
            height: height / 100,
          ),
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
            height: height / 100,
          ),
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
          ),
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
          ),
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
            height: height / 100,
          ),
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
            height: height / 100,
          ),
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
          ),
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
          ),
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
          ),
          Container(
            color: const Color.fromARGB(100, 83, 195, 247),
            width: width / 20,
            height: height / 100,
          ),
          SizedBox(
            width: width / 20,
          )
        ],
      ),
    ],
  );
}

class ScoreTable extends StatefulWidget {
  double scrTop;
  int score;
  double rdstr, rdstl, rdsbr, rdsbl;
  ScoreTable(
      {this.scrTop = 0,
      this.rdstr = 0,
      this.rdstl = 0,
      this.rdsbr = 0,
      this.rdsbl = 0,
      this.score = 0,
      super.key});

  @override
  State<ScoreTable> createState() => _ScoreTableState();
}

class _ScoreTableState extends State<ScoreTable> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.scrTop,
      right: 2,
      child: Container(
        // red circle
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 83, 195, 247),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.rdstl),
            topRight: Radius.circular(widget.rdstr),
            bottomRight: Radius.circular(widget.rdsbr),
            bottomLeft: Radius.circular(widget.rdsbl),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 175, 217, 236).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 9,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          ' ${widget.score.toString()}',
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}

class SetTable extends StatefulWidget {
  double scrTop;
  int score;
  double rdstr, rdstl, rdsbr, rdsbl;
  SetTable(
      {this.scrTop = 0,
      this.rdstr = 0,
      this.rdstl = 0,
      this.rdsbr = 0,
      this.rdsbl = 0,
      this.score = 0,
      super.key});

  @override
  State<SetTable> createState() => _SetTableState();
}

class _SetTableState extends State<SetTable> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.scrTop,
      left: 2,
      child: Container(
        // red circle
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 90, 174, 195),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.rdstl),
            topRight: Radius.circular(widget.rdstr),
            bottomRight: Radius.circular(widget.rdsbr),
            bottomLeft: Radius.circular(widget.rdsbl),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 117, 200, 202).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 9,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          ' ${widget.score.toString()}',
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
