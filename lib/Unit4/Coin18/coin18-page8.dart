import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';
import 'package:flutter_application_1/Unit4/Coin18/coin18-page9.dart';

Widget SpeechBubble(String description) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -15,
          right: 40,
          child: Image.asset(
            'assets/triangle.png',
            width: 30,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff7870DE),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 32,
            ),
            child: TypingText(
              text: description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.4,
                color: Color.fromARGB(255, 248, 248, 248),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ),
        ),
      ],
    ),
  );
}

class Coin18Page8 extends StatelessWidget {
  const Coin18Page8({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = screenWidth * 0.6; // Image scales to 40% of screen width
    String text =
        "Tax deductions are certain expenses that you can take away from the taxes you owe. ";
    text += "This helps reduce the total amount of taxes you pay!";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin18Page9()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpeechBubble(text),
                  const SizedBox(height: 20),
                  Image.asset('assets/wondering_detective_wawa.png',
                      width: imageSize),
                ],
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 8,
                        totalPages: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
