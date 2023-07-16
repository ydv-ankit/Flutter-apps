import 'package:flutter/material.dart';

import 'logic.dart';

// main app
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const CalculatorApp(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  void getCalculation(value) {
    calculate(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                valueToCalulate,
                maxLines: 1,
                style: TextStyle(color: Colors.deepPurple[200], fontSize: 40),
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                screenValue,
                style: TextStyle(
                    color: Colors.amber.withOpacity(0.5), fontSize: 30),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),

            // alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    button(text: "AC", textSize: 14.0),
                    button(text: "DEL", textSize: 14.0),
                    button(text: "C"),
                    button(text: "+")
                  ],
                ),
                Row(
                  children: [
                    button(text: "7"),
                    button(text: "8"),
                    button(text: "9"),
                    button(text: "-")
                  ],
                ),
                Row(
                  children: [
                    button(text: "4"),
                    button(text: "5"),
                    button(text: "6"),
                    button(text: "X")
                  ],
                ),
                Row(
                  children: [
                    button(text: "1"),
                    button(text: "2"),
                    button(text: "3"),
                    button(text: "/")
                  ],
                ),
                Row(
                  children: [
                    button(text: "%"),
                    button(text: "0"),
                    button(text: "."),
                    button(text: "=")
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget button(
      {text,
      textColor = const Color.fromARGB(255, 255, 255, 255),
      buttonColor = const Color.fromARGB(255, 64, 68, 73),
      textSize = 20.0}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(10),
              minimumSize: const Size(50, 50)),
          onPressed: () {
            getCalculation(text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: textSize, color: textColor),
          ),
        ),
      ),
    );
  }
}
