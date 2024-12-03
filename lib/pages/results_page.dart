import 'package:bmi_calculator/helpers/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.ScaffoldCollor,
      appBar: AppBar(
        title: Text("BMI CALCULATE"),
        backgroundColor: Constants.ScaffoldCollor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              "Your result",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Constants.activeCardColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                          color: Constants.greenCollor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiResult,
                      style: Constants.kBmiText,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      interpretation,
                      style: Constants.kBodyText,
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Constants.pinkContainer,
                  child: Text(
                    "RECALCULATE",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
