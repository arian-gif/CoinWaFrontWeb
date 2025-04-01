import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content2.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';

void main() {
  runApp(const Coin1Cont1());
}

class Coin1Cont1 extends StatefulWidget {
  const Coin1Cont1({super.key});

  @override
  _Coin1Cont1State createState() => _Coin1Cont1State();
}

class _Coin1Cont1State extends State<Coin1Cont1> {
  int slideIndex = 0;
  final List<String> slides = [
    "Saving means setting aside money to use later, instead of spending it right away. (1/6)",
    "Let's think of another example... (2/6)",
  ];

  void _nextSlide() {
    setState(() {
      if (slideIndex < slides.length - 1) {
        slideIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin1Cont2()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque, // Ensures entire screen is tappable
          onTap: _nextSlide,
          child: SafeArea(
            child: Stack(
              children: [
                ExitButton(),
                const Align(
                  alignment: Alignment.topRight,
                  child: TopBar(currentPage: 2, totalPages: 3),
                ),
                Column(
                  children: [
                    const SizedBox(height: 85),
                    Padding(
                      padding: const EdgeInsets.only(left: 56),
                      child: SpeechBubble(text: slides[slideIndex]),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Image.asset('assets/wawaTalk.png', width: 150),
                    ),
                    Image.asset(
                      'assets/expaper.png',
                      width: min(MediaQuery.of(context).size.width, 450),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpeechBubble extends StatelessWidget {
  final String text;
  const SpeechBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 120, 112, 222),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TypingText(text: text),
    );
  }
}
