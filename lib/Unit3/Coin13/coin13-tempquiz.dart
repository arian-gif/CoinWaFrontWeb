import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part2.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

void onWrongAnswer(BuildContext context, int level) {
  Provider.of<LivesProvider>(context, listen: false).loseLife(context);
  if (Provider.of<ProgressProvider>(context, listen: false).level == level) {
    Provider.of<ProgressProvider>(context, listen: false)
        .addIncorrectQuestion(context);
  }
  showLifeLossAnimation(context);
}

Widget purpleTextBubbleYellow(String description) {
  List<TextSpan> textSpans = [];
  List<String> words = description.split(' ');

  for (int i = 0; i < words.length; i++) {
    textSpans.add(
      TextSpan(
        text: '${words[i]} ',
        style: TextStyle(
          color: i < 5 ? Color.fromARGB(255, 255, 255, 255) : Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xff7870de),
    ),
    width: 200,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: textSpans,
          ),
        ),
      ),
    ),
  );
}

class Coin13QuizTemplate extends StatefulWidget {
  final List<String> option1;
  final List<String> option2;
  final List<String> option3;
  final String image1Path;
  final String image2Path;
  final String image3Path;
  final String question;
  final int correctOption;
  final bool isRepeat;
  final Widget route;
  final int currentPage;

  const Coin13QuizTemplate({
    super.key,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.image1Path,
    required this.image2Path,
    required this.image3Path,
    required this.question,
    required this.correctOption,
    required this.isRepeat,
    required this.route,
    required this.currentPage,
  });

  @override
  _Coin13QuizTemplateState createState() => _Coin13QuizTemplateState();
}

class _Coin13QuizTemplateState extends State<Coin13QuizTemplate> {
  bool isCorrect = false;
  bool isVisible = false;

  void _checkAnswer(int selectedOption) {
    setState(() {
      isVisible = true;
      isCorrect = selectedOption == widget.correctOption;
      if (!isCorrect && !widget.isRepeat) {
        onWrongAnswer(context, 7);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/wawaConfused.png', width: 100),
                        const SizedBox(width: 20),
                        purpleTextBubbleYellow(widget.question),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 200,
                      ),
                      child: Container(
                        color: const Color(0xffeae9ff),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'Tap on an item',
                              style: TextStyle(
                                color: Color(0xff5e17eb),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Option 1
                            GestureDetector(
                              onTap: () {
                                _checkAnswer(1);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                      color: Color(0xff5e17eb),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            (MediaQuery.of(context).size.width <= 400)
                                                ? Container(
                                              width: 180,
                                              child: Text(
                                                widget.option1[0],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            )
                                                : Text(
                                              widget.option1[0],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                              softWrap: true,
                                            ),
                                            const SizedBox(width: 10),
                                            Image.asset(widget.image1Path, width: 70),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'OR',
                              style: TextStyle(
                                color: Color(0xff5e17eb),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Option 2
                            GestureDetector(
                              onTap: () {
                                _checkAnswer(2);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      color: Color(0xff5e17eb),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 25),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(widget.image2Path, width: 70),
                                          const SizedBox(width: 20),
                                          (MediaQuery.of(context).size.width <= 400)
                                              ? Container(
                                            width: 180,
                                            child: Text(
                                              widget.option2[0],
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                              : Text(
                                            widget.option2[0],
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'OR',
                              style: TextStyle(
                                color: Color(0xff5e17eb),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Option 3
                            GestureDetector(
                              onTap: () {
                                _checkAnswer(3);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                      color: Color(0xff5e17eb),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            (MediaQuery.of(context).size.width <= 400)
                                                ? Container(
                                              width: 180,
                                              child: Text(
                                                widget.option3[0],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            )
                                                : Text(
                                              widget.option3[0],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                              softWrap: true,
                                            ),
                                            const SizedBox(width: 10),
                                            Image.asset(widget.image3Path, width: 70),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Visibility(
                              visible: isVisible,
                              child: isCorrect
                                  ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Correct!",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      final progressProvider = Provider.of<ProgressProvider>(context, listen: false);
                                      if (progressProvider.level == 7 && progressProvider.sublevel >= 6 && progressProvider.sublevel <= 8){
                                        progressProvider.setSublevel(context, progressProvider.sublevel+1);
                                      }

                                      if (widget.isRepeat) {
                                        navigateToNextQuestion(context, 7, "Appreciating/Depreciating Assets");
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => widget.route,
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.green[800],
                                      backgroundColor: const Color.fromARGB(255, 177, 255, 180),
                                    ),
                                    child: const Text("Continue"),
                                  ),
                                ],
                              )
                                  : const Text(
                                "Incorrect!",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ExitButton(),
          ],
        ),
      ),
    );
  }
}