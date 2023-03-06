import 'package:clickcounter/components/CircleButton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('Calculator'),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        textAlign: TextAlign.right,
                        userInput.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        answer.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleButton(
                          title: 'AC ',
                          onpress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: 'DEL',
                          onpress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: '% ',
                          onpress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          color: Colors.orange,
                          title: '/',
                          onpress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
//
                      ],
                    ),
                    Row(
                      children: [
                        CircleButton(
                          title: '7 ',
                          onpress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: '8',
                          onpress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: '9',
                          onpress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          color: Colors.orange,
                          title: '*',
                          onpress: () {
                            userInput += '*';
                            setState(() {});
                          },
                        ),
//
                      ],
                    ),
                    Row(
                      children: [
                        CircleButton(
                          title: '4 ',
                          onpress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: '5',
                          onpress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: '6',
                          onpress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          color: Colors.orange,
                          title: '- ',
                          onpress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
//
                      ],
                    ),
                    Row(
                      children: [
                        CircleButton(
                          title: '1 ',
                          onpress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: '2 ',
                          onpress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: '3 ',
                          onpress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          color: Colors.orange,
                          title: '+',
                          onpress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
//
                      ],
                    ),
                    Row(
                      children: [
                        CircleButton(
                          title: '0 ',
                          onpress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: '. ',
                          onpress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        CircleButton(
                          title: '00',
                          onpress: () {
                            userInput += '00';

                            setState(() {});
                          },
                        ),
                        CircleButton(
                          color: Colors.orange,
                          title: '=',
                          onpress: () {
                            equalPress();
                            setState(() {});
                          },
                        ),
//
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
