import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_pong/ball.dart';
import 'package:simple_pong/helper.dart';
import 'package:simple_pong/main.dart';
import 'package:simple_pong/pongLevel5.dart';
import 'bat.dart';
import 'pongLevel7.dart';

int setScore1 = 0;
int setScore2 = 0;

class PongLevel6 extends StatefulWidget {
  int setScore1;
  int setScore2;
  PongLevel6(this.setScore1, this.setScore2);

  @override
  _PongLevel6State createState() => _PongLevel6State();
}

class _PongLevel6State extends State<PongLevel6>
    with SingleTickerProviderStateMixin {
  Direction vDir = Direction.down;
  Direction hDir = Direction.right;
  late Animation<double> animation;
  late AnimationController controller;
  late double width = 0;
  late double height = 0;
  double posX = 0;
  double posY = 0;
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
  double BatBottomLevel4 = 0;
  double BatBottomLevel4MaxTop = 0;
  Direction BatBottomLevel4dr = Direction.up;

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
              child: const Text("SET  7",
                  style: TextStyle(fontSize: 36, color: Colors.white),
                  textAlign: TextAlign.center),
            )));

    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Level5Screen()));
    });
  }

  void checkBorders() {
    double diameter = 50;
    lossColor = const Color.fromARGB(0, 255, 0, 0);
    lossColorb = const Color.fromARGB(0, 255, 0, 0);
    if (posX <= 0 && hDir == Direction.left) {
      hDir = Direction.right;
      randX = rnd.randomNumber();
    }
    if (posX >= width - diameter && hDir == Direction.right) {
      hDir = Direction.left;
      randX = rnd.randomNumber();
    }
//check the bat position as well
    if (posY >=
            height - diameter - batHeight - downcontainer - BatBottomLevel4 &&
        vDir == Direction.down) {
//check if the bat is here, otherwise loose
      if (posX >= (batPosition - diameter) &&
          posX <= (batPosition + batWidth)) {
        vDir = Direction.up;
        randY = rnd.randomNumber();
      } else {
        score2++;

        lossColorb = Color.fromARGB(134, 0, 242, 255);
        if (score2 == 3) {
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
            posX = 0;
            posY = 0;
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
        if (score == 3) {
          controller.stop();
          setScore1 = (widget.setScore1 + 1);
          setScore2 = widget.setScore2;
          showMessage(context);
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const Level2Screen()));
        } else {
          controller.stop();
          Timer(const Duration(milliseconds: 100), () {
            //yandığında beklemek için
            controller.repeat();
            posX = 0;
            posY = 0;
          });
        }
      }
    }
  }

  @override
  void initState() {
    posX = 0;
    posY = 0;
    controller = AnimationController(
      duration: const Duration(minutes: 10000),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 100).animate(controller);
    animation.addListener(() {
      safeSetState(() {
        increment = increment * rnd.IncrementNumber();
        (hDir == Direction.right)
            ? posX += ((increment * randX).round())
            : posX -= ((increment * randX).round());
        (vDir == Direction.down)
            ? posY += ((increment * randY).round())
            : posY -= ((increment * randY).round());
      });
      moveAIbat();
      Level4BatMove();
      checkBorders();
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
      BatBottomLevel4MaxTop = height / 3;
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
            bottom: downcontainer + BatBottomLevel4,
            left: 0,
            child: Container(
              color: lossColorb,
              width: width,
              height: batHeight,
            ),
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
          Positioned(
            //orta çizgi
            top: height / 2 - height / 25,
            left: 0,
            child: ortaCizgi(width, height),
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
            top: posY,
            left: posX,
            child: Ball(50),
          ),
          Positioned(
            bottom: downcontainer + BatBottomLevel4,
            left: batPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: (DragUpdateDetails update) =>
                  moveBat(update),
              child: Bat(batWidth, batHeight),
            ),
          ),
          Positioned(
            bottom: BatBottomLevel4,
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
    (posY < width / 4 && posY > (width / 4 - 5) && vDir == Direction.up)
        ? AIbatPosition =
            AIbatPosition - ((AIbatPosition - posX) * rnd.AIbatNumber())
        : (AIbatPosition < 0)
            ? AIbatPosition = 0
            : (AIbatPosition > width)
                ? AIbatPosition = width
                : AIbatPosition;
    (posY < width / 5 && posY > (width / 5 - 5) && vDir == Direction.up)
        ? AIbatPosition =
            AIbatPosition - ((AIbatPosition - posX) * rnd.AIbatNumber())
        : (AIbatPosition < 0)
            ? AIbatPosition = 0
            : (AIbatPosition > (width - width / 4))
                ? AIbatPosition = (width - width / 4)
                : AIbatPosition;
  }

  void Level4BatMove() {
    if (BatBottomLevel4 < BatBottomLevel4MaxTop &&
        BatBottomLevel4dr == Direction.up) {
      BatBottomLevel4++;
    } else {
      BatBottomLevel4dr = Direction.down;
    }
    if (BatBottomLevel4 > 0 && BatBottomLevel4dr == Direction.down) {
      BatBottomLevel4--;
    } else {
      BatBottomLevel4dr = Direction.up;
    }
  }
}

class Level5Screen extends StatelessWidget {
  const Level5Screen({super.key});

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
      body: PongLevel7(
        setScore1,
        setScore2,
      ),
    );
  }
}
