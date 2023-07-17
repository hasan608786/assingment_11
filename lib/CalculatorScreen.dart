import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String equation = "0";
  String result = "0";
  String expression = "";

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
      } else if (buttonText == "AC") {
          equation = "0";
          result = '0';
        }else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('X', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
    // int firstNum = 0;
    // int SecondNum = 0;
    // String equation = "0";
    // String result = "0";
    // String expression = "";
    // String? operation;

    // buttonPressed(String buttonText) {
    //   setState(() {
    //     if (buttonText == "C") {
    //       equation = "0";
    //     } else if (buttonText == "AC") {
    //       equation = "0";
    //       result = '0';
    //     } else if (buttonText == "⌫") {
    //       equation = equation.substring(0, equation.length - 1);
    //       if (equation == "") {
    //         equation = "0";
    //       }
    //     } else if (buttonText == '+' ||
    //         buttonText == '-' ||
    //         buttonText == 'X' ||
    //         buttonText == '/') {
    //       firstNum = int.parse(equation);
    //       result = '';
    //       operation = buttonText;
    //     } else if (buttonText == "=") {
    //       SecondNum = int.parse(equation);
    //       if (buttonText == '+') {
    //         result = (firstNum + SecondNum).toString();
    //         equation =
    //             (SecondNum + firstNum) as String;
    //       }
    //       if (buttonText == '-') {
    //         result = (firstNum - SecondNum).toString();
    //         equation =
    //             firstNum.toString() + equation.toString() + SecondNum.toString();
    //       }
    //       if (buttonText == 'X') {
    //         result = (firstNum * SecondNum).toString();
    //         equation =
    //             firstNum.toString() + equation.toString() + SecondNum.toString();
    //       }
    //       if (buttonText == '/') {
    //         result = (firstNum / SecondNum).toString();
    //         equation =
    //             firstNum.toString() + equation.toString() + SecondNum.toString();
    //       }
    //     } else {
    //       if (equation == "0") {
    //         equation = buttonText;
    //       } else {
    //         equation = equation + buttonText;
    //       }
    //     }
    //   });
  }

  CalculatorButton(
      {required String text, required int fillcolor, required int textcolor}) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.21,
        child: ElevatedButton(
          onPressed: () => buttonPressed(text),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Color(fillcolor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle: const TextStyle(fontSize: 24),
                color: Color(textcolor)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffb942f5),
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 219, 172, 243),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      equation,
                      style: const TextStyle(fontSize: 38),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 58),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: 'AC',
                  fillcolor: 0xffb942f5,
                  textcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: 'C',
                  fillcolor: 0xffb942f5,
                  textcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '⌫',
                  fillcolor: 0xffb942f5,
                  textcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '/',
                  fillcolor: 0xffb942f5,
                  textcolor: 0xffffffff,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '7',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '8',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '9',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: 'X',
                  fillcolor: 0xffb942f5,
                  textcolor: 0xffffffff,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '4',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '5',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '6',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '-',
                  fillcolor: 0xffb942f5,
                  textcolor: 0xffffffff,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '1',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '2',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '3',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '+',
                  fillcolor: 0xffb942f5,
                  textcolor: 0xffffffff,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: ('.'),
                  fillcolor: 0xffb942f5,
                  textcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '0',
                  textcolor: 0xff000000,
                  fillcolor: 0xffffffff,
                ),
                CalculatorButton(
                  text: '00',
                  fillcolor: 0xffffffff,
                  textcolor: 0xff000000,
                ),
                CalculatorButton(
                  text: '=',
                  fillcolor: 0xffb942f5,
                  textcolor: 0xffffffff,
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
//     