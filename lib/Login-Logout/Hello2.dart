import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Login-Logout/signup.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final RegExp regExp = RegExp(r'^\d{0,4}-?\d{0,2}-?\d{0,2}$');
    if (!regExp.hasMatch(newValue.text)) {
      return oldValue;
    }

    String formattedText = newValue.text;
    if (newValue.text.length > 4 && newValue.text[4] != '-') {
      formattedText =
          '${newValue.text.substring(0, 4)}-${newValue.text.substring(4)}';
    }
    if (newValue.text.length > 7 && newValue.text[7] != '-') {
      formattedText =
          '${newValue.text.substring(0, 7)}-${newValue.text.substring(7)}';
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

void synchronousDelay(int milliseconds) {
  var endTime = DateTime.now().millisecondsSinceEpoch + milliseconds;
  while (DateTime.now().millisecondsSinceEpoch < endTime) {
    // Keep the CPU busy while waiting
  }
}

void main() {
  runApp(hello());
}

class hello extends StatelessWidget {
  bool _isValidDate(String dateString) {
    try {
      final parts = dateString.split('-');
      if (parts.length != 3) return false;

      int year = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int day = int.parse(parts[2]);

      if (month < 1 || month > 12) return false;
      if (day < 1 || day > _daysInMonth(month, year)) return false;

      DateTime birthday = DateTime(year, month, day);
      return birthday.isBefore(DateTime.now()); // Ensure it's not in the future
    } catch (e) {
      return false;
    }
  }

  int _daysInMonth(int month, int year) {
    return DateTime(year, month + 1, 0).day;
  }

  hello({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final ValueNotifier<String?> _selectedColorNotifier =
      ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar:
            true, // Enables the background image behind the AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Makes AppBar transparent
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Im_Not_New.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 60),
                    Container(
                      height: 475,
                      width: 450,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/hello2frame.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/signupwawa.png',
                            height: 200,
                          ),
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'HELLO\n',
                                  style: TextStyle(
                                    fontFamily: 'SourceSans',
                                    fontSize: 55,
                                    color: Color.fromARGB(
                                        255, 89, 21, 226), //rgb(89, 21, 226)
                                  ),
                                ),
                                TextSpan(
                                  text: '     MY NAME IS',
                                  style: TextStyle(
                                    fontFamily: 'SourceSans',
                                    fontSize: 20,
                                    color: Color.fromARGB(
                                        255, 89, 21, 226), //rgb(89, 21, 226)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            height: 75,
                            width: 400,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 241, 219),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 94, 24, 235),
                                  width: 3,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: _nameController,
                                style: const TextStyle(
                                  fontFamily: 'Source',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                  hintText: 'Your Full Name',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Source',
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 120, 112, 222),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        Container(
                          height: 85,
                          width: 400,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 241, 219),
                            border: Border.all(
                              color: const Color.fromARGB(255, 94, 24, 235),
                              width: 4.0,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: TextFormField(
                            controller: _birthdayController,
                            inputFormatters: [DateInputFormatter()],
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontFamily: 'Source',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                              hintText: 'Your Birthday? (YYYY-MM-DD)',
                              hintStyle: TextStyle(
                                fontFamily: 'Source',
                                fontSize: 19,
                                color: Color.fromARGB(255, 120, 112, 222),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -30,
                          top: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset('assets/partyhatcircle.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        Container(
                          height: 85,
                          width: 400,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 241, 219),
                            border: Border.all(
                              color: const Color.fromARGB(255, 94, 24, 235),
                              width: 4.0,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: ValueListenableBuilder<String?>(
                              valueListenable: _selectedColorNotifier,
                              builder: (context, selectedColor, child) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 241, 219),
                                    borderRadius: BorderRadius.circular(
                                        40), // Rounded edges
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedColor,
                                    hint: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                        'Favorite Colour?',
                                        style: TextStyle(
                                          fontFamily: 'Source',
                                          fontSize: 19,
                                          color: Color.fromARGB(
                                              255, 120, 112, 222),
                                        ),
                                      ),
                                    ),
                                    onChanged: (String? newValue) {
                                      _selectedColorNotifier.value = newValue;
                                    },
                                    items: <String>[
                                      'Red',
                                      'Blue',
                                      'Green',
                                      'Yellow',
                                      'Purple',
                                      'Orange',
                                      'Pink'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              fontFamily: 'Source',
                                              fontSize: 19,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    underline:
                                        Container(), // Remove the default underline
                                    isExpanded: true,
                                    dropdownColor: const Color.fromARGB(
                                        255,
                                        255,
                                        241,
                                        219), // Background color of dropdown
                                    borderRadius: BorderRadius.circular(
                                        20), // Rounded edges for dropdown
                                    icon: const Padding(
                                      padding: EdgeInsets.only(right: 16.0),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Color.fromARGB(255, 94, 24, 235),
                                      ),
                                    ),
                                    iconSize: 30,
                                    elevation: 2,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          right: -33,
                          top: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset('assets/paintcircle.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets
                          .zero, // Remove padding to avoid misalignment
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(45, 72, 51, 166),
                          width: 1,
                        ),
                        color: const Color.fromARGB(255, 94, 24, 235),
                        borderRadius:
                            BorderRadius.circular(30), // Rounded edges
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(
                                255, 88, 53, 158), // Shadow color
                            offset: Offset(0, 8), // Shadow position
                            blurRadius: 0, // No blur
                          ),
                        ],
                      ),
                      child: Center(
                        // Ensures button content is centered
                        child: ElevatedButton(
                          onPressed: () {
                            String name = _nameController.text.trim();
                            String birthday = _birthdayController.text.trim();

                            // Check if the date is valid
                            if (!_isValidDate(birthday)) {
                              // Show the error dialog if the date is invalid
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Invalid Date'),
                                  content:
                                      const Text('Please enter a valid date.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                              return; // Don't proceed if the date is invalid
                            }

                            // Proceed with navigation if the date is valid
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(
                                  name: name,
                                  birthday: birthday,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100,
                                50), // Adjusted height for better centering
                            backgroundColor: Colors
                                .transparent, // Transparent to show background
                            shadowColor:
                                Colors.transparent, // Remove default shadow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Center(
                            // Ensures text is centered
                            child: Text(
                              "What's Next?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Source',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
