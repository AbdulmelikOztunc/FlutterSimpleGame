import 'dart:async';
import 'package:simple_pong/pongLevel10.dart';
import 'package:simple_pong/main.dart';
import 'helper.dart';
import 'package:flutter/material.dart';
import './ball.dart';
import './bat.dart';

int setScore1 = 0;
int setScore2 = 0;

class PongLevel9 extends StatefulWidget {
  int setScore1;
  int setScore2;
  PongLevel9(this.setScore1, this.setScore2);

  @override
  _PongLevel9State createState() => _PongLevel9State();
}

class _PongLevel9State extends State<PongLevel9>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Direction vDir = Direction.down;
  Direction hDir = Direction.right;
  late double width = 0;
  late double height = 0;
  double posX = 30;
  double posY = 10;
  Ball ball1 = Ball(50);
  Ball2 ball2 = Ball2(50);
  double batWidth = 0;
  double batHeight = 0;
  double AIWidth = 0;
  double AIHeight = 0;
  double AIbatPosition = 0;
  double batPosition = 0;
  double increment = 4;
  double randX = 1;
  double randY = 1;
  int score = 0;
  int score2 = 0;
  double downcontainer = 0;
  Color lossColor = const Color.fromARGB(0, 255, 0, 0);
  Color lossColorb = const Color.fromARGB(0, 255, 0, 0);

  Randoms rnd = Randoms(); //benim helper classtakiler

  void moveBat(DragUpdateDetails update) {
    safeSetState(() {
      batPosition += update.delta.dx;
      if (batPosition < 0) {
        batPosition = 0;
      } else if (batPosition > width - batWidth) {
        batPosition = width - batWidth;
      }
    });
  }

  void showMessage(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            alignment: Alignment.center,
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.lightBlue),
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
              child: const Text("SET  10",
                  style: TextStyle(fontSize: 36, color: Colors.white),
                  textAlign: TextAlign.center),
            )));

    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Level3Screen()));
    });
  }

  void checkBorders() {
    double diameter = 50;
    lossColor = const Color.fromARGB(0, 255, 0, 0);
    lossColorb = const Color.fromARGB(0, 255, 0, 0);
    if (ball1.posX <= 0 && ball1.hDir == Direction.left) {
      ball1.hDir = Direction.right;
      randX = rnd.randomNumber();
    }
    if (ball1.posX >= width - diameter && ball1.hDir == Direction.right) {
      ball1.hDir = Direction.left;
      randX = rnd.randomNumber();
    }
//check the bat position as well
    if (ball1.posY >= height - diameter - batHeight - downcontainer &&
        ball1.vDir == Direction.down) {
//check if the bat is here, otherwise loose
      if (ball1.posX >= (batPosition - diameter) &&
          ball1.posX <= (batPosition + batWidth)) {
        ball1.vDir = Direction.up;
        randY = rnd.randomNumber();
      } else {
        score2++;
        lossColorb = const Color.fromARGB(134, 0, 242, 255);
        controller.stop();
        if (score2 == 7) {
          setScore2 = (widget.setScore2 + 1);
          setScore1 = widget.setScore1;
          showMessage(context);
        } else {
          //yandığında beklemek için
          Timer(const Duration(milliseconds: 100), () {           
            ball1.posX = 0;
            ball1.posY = 0;
            controller.repeat();
          });
        }
      }
    }
    // ai BAT İN HAREKETLERİ
    if (ball1.posY <= 0 + AIHeight && ball1.vDir == Direction.up) {
      if (ball1.posX >= (AIbatPosition - diameter) &&
          ball1.posX <= (AIbatPosition + AIWidth)) {
        ball1.vDir = Direction.down;
        randY = rnd.randomNumber();
      } else {
        score++;
        ball1.vDir = Direction.down;
        lossColor = const Color.fromARGB(134, 0, 242, 255);
        controller.stop();
        if (score == 7) {
          setScore1 = (widget.setScore1 + 1);
          setScore2 = widget.setScore2;
          showMessage(context);
        } else {
          //yandığında beklemek için
          Timer(const Duration(milliseconds: 100), () {            
            ball1.posX = 0;
            ball1.posY = 0;
            controller.repeat();
          });
        }
      }
    }
  }

  void checkBorders2() {
    double diameter = 50;
    
    if (ball2.posX <= 0 && ball2.hDir == Direction.left) {
      ball2.hDir = Direction.right;
      randX = rnd.randomNumber();
    }
    if (ball2.posX >= (width - diameter) && ball2.hDir == Direction.right) {
      ball2.hDir = Direction.left;
      randX = rnd.randomNumber();
    }
//check the bat position as well
    if (ball2.posY >= height - diameter - batHeight - downcontainer &&
        ball2.vDir == Direction.down) {
//check if the bat is here, otherwise loose
      if (ball2.posX >= (batPosition - diameter) &&
          ball2.posX <= (batPosition + batWidth)) {
        ball2.vDir = Direction.up;
        randY = rnd.randomNumber();
      } else {
        score2++;
        lossColorb = const Color.fromARGB(134, 0, 242, 255);
        if (score2 == 7) {
          controller.stop();
          setScore2 = (widget.setScore2 + 1);
          setScore1 = widget.setScore1;
          showMessage(context);
        } else {
          controller.stop();
          Timer(const Duration(milliseconds: 100), () {
            //yandığında beklemek için
            controller.repeat();
            ball2.posX = 50;
            ball2.posY = 5;
          });
        }
      }
    }
    // ai BAT İN HAREKETLERİ
    if (ball2.posY <= 0 + AIHeight && ball2.vDir == Direction.up) {
      if (ball2.posX >= (AIbatPosition - diameter) &&
          ball2.posX <= (AIbatPosition + batWidth)) {
        ball2.vDir = Direction.down;
        randY = rnd.randomNumber();
      } else {
        score++;

        ball2.vDir = Direction.down;
        lossColor = const Color.fromARGB(134, 0, 242, 255);
        if (score == 7) {
          controller.stop();

          setScore1 = (widget.setScore1 + 1);
          setScore2 = widget.setScore2;
          showMessage(context);
        } else {
          controller.stop();
          Timer(const Duration(milliseconds: 100), () {
            //yandığında beklemek için
            controller.repeat();
            ball2.posX = 50;
            ball2.posY = 5;
          });
        }
      }
    }
  }

  void checkBorders3() {
    double diameter = 100;
   
    if (posX <= 0 && hDir == Direction.left) {
      hDir = Direction.right;
      randX = rnd.randomNumber();
    }
    if (posX >= width - diameter && hDir == Direction.right) {
      hDir = Direction.left;
      randX = rnd.randomNumber();
    }
//check the bat position as well
    if (posY >= height - diameter - batHeight - downcontainer &&
        vDir == Direction.down) {
//check if the bat is here, otherwise loose
      if (posX >= (batPosition - diameter) &&
          posX <= (batPosition + batWidth)) {
        vDir = Direction.up;
        randY = rnd.randomNumber();
      } else {
        score2++;

        lossColorb = Color.fromARGB(134, 0, 242, 255);
        if (score2 == 7) {
          controller.stop();
          setScore2 = (widget.setScore2 + 1);
          setScore1 = widget.setScore1;
          showMessage(context);
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const Level2Screen()));
        } else {
          controller.stop();
          Timer(const Duration(milliseconds: 100), () {
            //yandığında beklemek için
            controller.repeat();
            posX = 30;
            posY = 10;
          });
        }
      }
    }
    // ai BAT İN HAREKETLERİ
    if (posY <= 0 + AIHeight && vDir == Direction.up) {
      if (posX >= (AIbatPosition - diameter) &&
          posX <= (AIbatPosition + AIWidth)) {
        vDir = Direction.down;
        randY = rnd.randomNumber();
      } else {
        score++;

        vDir = Direction.down;
        lossColor = const Color.fromARGB(134, 0, 242, 255);
        if (score == 7) {
          controller.stop();
          setScore1 = (widget.setScore1 + 1);
          setScore2 = widget.setScore2;
          showMessage(context);
        } else {
          controller.stop();
          Timer(const Duration(milliseconds: 100), () {
            //yandığında beklemek için
            controller.repeat();
            posX = 30;
            posY = 10;
          });
        }
      }
    }
  }

  @override
  void initState() {
    ball1.posX = 0;
    ball1.posY = 0;
    ball2.posX = 100 * rnd.AIbatNumber();
    ball2.posY = 150 * rnd.AIbatNumber();
    controller = AnimationController(
      duration: const Duration(minutes: 10000),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 100).animate(controller);
    animation.addListener(() {
      safeSetState(() {
        // increment = increment * rnd.IncrementNumber(); //yavaş yavaş hızlandırma
        (ball1.hDir == Direction.right)
            ? ball1.posX += ((increment * randX).round())
            : ball1.posX -= ((increment * randX).round());
        (ball1.vDir == Direction.down)
            ? ball1.posY += ((increment * randY).round())
            : ball1.posY -= ((increment * randY).round());
        (ball2.hDir == Direction.right)
            ? ball2.posX += ((increment * randX * 4 / 3).round())
            : ball2.posX -= ((increment * randX * 4 / 3).round());
        (ball2.vDir == Direction.down)
            ? ball2.posY += ((increment * randY * 4 / 3).round())
            : ball2.posY -= ((increment * randY * 4 / 3).round());
        (hDir == Direction.right)
            ? posX += ((increment * randX*7/8).round())
            : posX -= ((increment * randX*7/8).round());
        (vDir == Direction.down)
            ? posY += ((increment * randY).round())
            : posY -= ((increment * randY).round());
      });

      checkBorders();      
      checkBorders3();
      checkBorders2();
      moveAIbat();
    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      batWidth = width / 4;
      batHeight = height / 15;
      AIWidth = width / 4;
      AIHeight = height / 15;
      downcontainer = height / 25;

      return Stack(
        children: <Widget>[
          Positioned(
            //top kaçınca efekt amaçlı
            top: 0,
            left: 0,
            child: Container(
              color: lossColor,
              width: width,
              height: batHeight,
            ),
          ),
          Positioned(
            //top kaçınca efekt amaçlı
            bottom: downcontainer,
            left: 0,
            child: Container(
              color: lossColorb,
              width: width,
              height: batHeight,
            ),
          ),
          Positioned(
            //orta çizgi
            top: height / 2 - height / 25,
            left: 0,
            child: ortaCizgi(width, height),
          ),
          Positioned(
              top: 0, left: AIbatPosition, child: AiBat(AIWidth, AIHeight)),
          ScoreTable(
            scrTop: (height / 2 - height / 6),
            rdsbl: 15,
            rdstl: 50,
            rdsbr: 15,
            score: score2,
          ),
          ScoreTable(
            scrTop: (height / 2),
            rdsbl: 50,
            rdstl: 15,
            rdstr: 15,
            score: score,
          ),
          SetTable(
            scrTop: (height / 2 - height / 6),
            rdsbl: 15,
            rdstr: 50,
            rdsbr: 15,
            score: widget.setScore2,
          ),
          SetTable(
            scrTop: (height / 2),
            rdstl: 15,
            rdstr: 15,
            rdsbr: 50,
            score: widget.setScore1,
          ),
          Positioned(
            top: ball1.posY,
            left: ball1.posX,
            child: ball1,
          ),
          Positioned(
            top: ball2.posY,
            left: ball2.posX,
            child: ball2,
          ),
          Positioned(
            top: posY,
            left: posX,
            child: Ball(100),
          ),
          Positioned(
            bottom: downcontainer,
            left: batPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: (DragUpdateDetails update) =>
                  moveBat(update),
              child: Bat(batWidth, batHeight),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: Colors.blue[800],
              width: width,
              height: downcontainer,
            ),
          ),
        ],
      );
    });
  }

  @override
  Future<void> dispose() async {
    controller.dispose();
    super.dispose();
  }

  void safeSetState(Function function) {
    if (mounted && controller.isAnimating) {
      setState(() {
        function();
      });
    }
  }

  void moveAIbat() {
    (ball1.posY < width / 4 &&
            ball1.posY > (width / 4 - 5) &&
            ball1.vDir == Direction.up)
        ? AIbatPosition =
            AIbatPosition - ((AIbatPosition - ball1.posX) * rnd.AIbatNumber())
        : (AIbatPosition < 0)
            ? AIbatPosition = 0
            : (AIbatPosition > width)
                ? AIbatPosition = width
                : AIbatPosition;
    (ball1.posY < width / 5 &&
            ball1.posY > (width / 5 - 5) &&
            ball1.vDir == Direction.up)
        ? AIbatPosition =
            AIbatPosition - ((AIbatPosition - ball1.posX) * rnd.AIbatNumber())
        : (AIbatPosition < 0)
            ? AIbatPosition = 0
            : (AIbatPosition > (width - width / 4))
                ? AIbatPosition = (width - width / 4)
                : AIbatPosition;
    (ball2.posY < width / 4 &&
            ball2.posY > (width / 4 - 5) &&
            ball2.vDir == Direction.up)
        ? AIbatPosition =
            AIbatPosition - ((AIbatPosition - ball2.posX) * rnd.AIbatNumber())
        : (AIbatPosition < 0)
            ? AIbatPosition = 0
            : (AIbatPosition > width)
                ? AIbatPosition = width
                : AIbatPosition;
    (ball2.posY < width / 5 &&
            ball2.posY > (width / 5 - 5) &&
            ball2.vDir == Direction.up)
        ? AIbatPosition =
            AIbatPosition - ((AIbatPosition - ball2.posX) * rnd.AIbatNumber())
        : (AIbatPosition < 0)
            ? AIbatPosition = 0
            : (AIbatPosition > (width - width / 4))
                ? AIbatPosition = (width - width / 4)
                : AIbatPosition;
  }
}

class Level3Screen extends StatelessWidget {
  const Level3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ping Pong'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: PongLevel10(
        setScore1,
        setScore2,
      ),
    );
  }
}
