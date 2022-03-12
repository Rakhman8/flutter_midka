import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double firstNumber = 0;
  double secondNumber = 0;
  String text = '';
  String result = '';
  String operation = '';

  void onClicked(String value) {
    if (value == "C") {
      text = '';
      result = '';
      firstNumber = 0;
      secondNumber = 0;
    } else if (value == "-" || value == "+" || value == "x" || value == "÷" || value == "%") {
      firstNumber = double.parse(text);
      result = "";
      operation = value;
    } else if (value == "=") {
      secondNumber = double.parse(text);
      if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
      }
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      if (operation == "x") {
        result = (firstNumber * secondNumber).toString();
      }
      if (operation == "÷") {
        result = (firstNumber / secondNumber).toString();
      }
      if (operation == "%") {
        result = (firstNumber * (secondNumber / 100)).toString();
      }
    } else if (value == "±") {
      if (text[0] == "-") {
        result = text.substring(1);
      } else {
        result = "-" + text;
      }
    } else {
      result = text + value;
    }
    setState(() {
      text = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4E504F),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 55, color: Colors.white),
                )),
            Row(
              children: [
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("C");
                  },
                  backgroundColor: const Color(0xff7A7A7A),
                  title: "C",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("±");
                  },
                  backgroundColor: const Color(0xff7A7A7A),
                  title: "±",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("%");
                  },
                  backgroundColor: const Color(0xff7A7A7A),
                  title: "%",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("÷");
                  },
                  backgroundColor: const Color(0xffFF9F0A),
                  title: "÷",
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("7");
                  },
                  backgroundColor: const Color(0xff6C6E6D),
                  title: "7",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("8");
                  },
                      backgroundColor: const Color(0xff6C6E6D),
                  title: "8",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("9");
                  },
                      backgroundColor: const Color(0xff6C6E6D),
                  title: "9",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("x");
                  },
                  backgroundColor: const Color(0xffFF9F0A),
                  title: "x",
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("4");
                  },
                      backgroundColor: const Color(0xff6C6E6D),
                  title: "4",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("5");
                  },
                      backgroundColor: const Color(0xff6C6E6D),
                  title: "5",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("6");
                  },
                      backgroundColor: const Color(0xff6C6E6D),
                  title: "6",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("-");
                  },
                  backgroundColor: const Color(0xffFF9F0A),
                  title: "-",
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("1");
                  },
                      backgroundColor: const Color(0xff6C6E6D),
                  title: "1",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("2");
                  },
                      backgroundColor: const Color(0xff6C6E6D),
                  title: "2",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("3");
                  },
                      backgroundColor: const Color(0xff6C6E6D),
                  title: "3",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("+");
                  },
                  backgroundColor: const Color(0xffFF9F0A),
                  title: "+",
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: CalculatorButton(
                      callBack: () {
                        onClicked("0");
                      },
                      backgroundColor: const Color(0xff6C6E6D),
                      title: "0",
                    )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked(".");
                  },
                      backgroundColor: const Color(0xff6C6E6D),
                  title: ".",
                )),
                Expanded(
                    child: CalculatorButton(
                  callBack: () {
                    onClicked("=");
                  },
                  backgroundColor: const Color(0xffFF9F0A),
                  title: "=",
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final VoidCallback callBack;
  final String title;
  final Color? backgroundColor;

  const CalculatorButton({
    Key? key,
    required this.callBack,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(2),
      onPressed: callBack,
      child: Container(
        height: 70,
        color: backgroundColor,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
