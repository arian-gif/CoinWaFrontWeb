import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import '../../Templates/typing_text.dart';
import './method.dart';

class Desk extends StatefulWidget {
  const Desk({super.key});

  @override
  _DeskState createState() => _DeskState();
}

class _DeskState extends State<Desk> {
  final List<String> _lessons = [
    "These show proof of things you bought, like school supplies or medical expenses. Some receipts can help lower your taxes!",
    "These come from your job and show how much money you earned. The government needs this to know how much tax you should pay.",
    "If you earned money from a savings account or investments, this helps track how much extra income you made.",
    "If you go to college or university, you might get a special form showing how much you paid for tuition. This can sometimes reduce the amount of tax you owe."
  ];
  final List<String> _title = [
    "Receipts",
    "Income Statements",
    "Savings Statements",
    "Tuition Forms"
  ];
  int _count = 0;
  bool _continue = false;

  void _showPopup(String title, String description) {
    increment();
    showDialog(
      context: context,
      barrierColor:
          Colors.black.withOpacity(0.7), // Transparent black background
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xffeae9ff), // Purple background
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/wawaConfused.png',
                      width: (MediaQuery.of(context).size.width * 0.25)
                          .clamp(0, 150),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  title, // Use the title parameter
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TypingText(
                  text: description, // Use the description parameter
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Close the popup on "Continue"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2f008d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // White text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void increment() {
    setState(() {
      _count++;
    });
    if (_count > 3) {
      setState(() {
        _continue = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(children: [
          Column(children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 15,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180, // Increased height for more space
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 91, 24, 233),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180, // Increased height for better alignment
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 140, 82, 255),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image beside the text
                      Image.asset(
                        'assets/letter-old.png', //get document image
                        width: 90, // Increased size for better balance
                      ),
                      const SizedBox(width: 10), // Space between image and text
                      Flexible(
                        child: Text(
                          "Get Your Documents!",
                          softWrap:
                              true, // Allows text to wrap to the next line
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32, // Increased font size
                            fontWeight: FontWeight.bold,
                            fontFamily: "Source",
                            height:
                                1.3, // Adjust line height for better readability
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            GestureDetector(
                onTap: () {
                  if (!_continue) {
                    String content = _lessons[_count];
                    String title = _title[_count];

                    _showPopup(title, content);
                  }
                },
                child: Image.asset(
                  "tax-desk.png",
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                )),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            _continue
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Method()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 140, 82, 255),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            0.1, // Wider padding
                        vertical: MediaQuery.of(context).size.width *
                            0.04, // Taller padding
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width *
                            0.7, // 70% of screen width
                        MediaQuery.of(context).size.width *
                            0.15, // 15% of screen width
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                : Text(
                    "Help Wawa find all his documents",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
          ]),
          ExitButton(),
          const Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: TopBar(
                    currentPage: 7,
                    totalPages: 11,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
