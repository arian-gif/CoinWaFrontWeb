import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';
import "./letter.dart";

Widget SpeechBubble(String description) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -15,
          left: 40,
          child: Image.asset(
            'assets/triangle.png',
            width: 30,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300,
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
              // overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    ),
  );
}

class Coin19Intro extends StatelessWidget {
  const Coin19Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Letter()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none, // Allow overflow
            children: [
              Positioned(
                top: 150, // Adjust vertical position of speech bubble
                left: MediaQuery.of(context).size.width / 2 -
                    210, // Center the bubble
                child: SpeechBubble(
                    'OOO I’ve got mail. Let me see what it is. It says it’s from the Revenue Agency? What the heck?!'),
              ),
              Positioned(
                top: 320, // Adjust vertical position of the image
                left: 40, // Position the image from the left side
                child: Image.asset(
                  'assets/wawa-mail.png',
                  width: 350,
                  height: 400,
                  fit: BoxFit.contain, // Ensures the image fills the container
                ),
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 1,
                        totalPages: 11,
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
