import 'package:flutter/material.dart';
import 'package:my_calculator_app/components/my_button.dart';
import 'package:my_calculator_app/constants.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontSize: 30),
        )),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    userInput.toString(),
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    answer.toString(),
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    MyButton(
                      buttonLabel: 'AC',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput = '';
                        answer = '';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '+/-',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '+/-';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '%',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '%';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '/',
                      buttonColor: Colors.orange,
                      onPress: () {
                        userInput += '/';
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      buttonLabel: '7',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '7';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '8',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '8';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '0',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: 'x',
                      buttonColor: Colors.orange,
                      onPress: () {
                        userInput += 'x';
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      buttonLabel: '4',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '4';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '5',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '5';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '6',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '6';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '-',
                      buttonColor: Colors.orange,
                      onPress: () {
                        userInput += '-';
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      buttonLabel: '1',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '1';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '2',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '2';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '3',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '3';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '+',
                      buttonColor: Colors.orange,
                      onPress: () {
                        userInput += '+';
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      buttonLabel: '0',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: '.',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput += '.';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      buttonLabel: 'DEL',
                      buttonColor: Colors.grey,
                      onPress: () {
                        userInput = userInput.substring(0, userInput.length-1);
                        setState(() {

                        });
                      },
                    ),
                    MyButton(
                      buttonLabel: '=',
                      buttonColor: Colors.orange,
                      onPress: () {
                        equalPress();
                        setState(() {

                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();

  }
}
