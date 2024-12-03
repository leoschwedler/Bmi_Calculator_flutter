import 'package:bmi_calculator/helpers/constants.dart';
import 'package:bmi_calculator/helpers/gender_style.dart';
import 'package:bmi_calculator/pages/calculator_brain.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/widgets/custom_card.dart';
import 'package:bmi_calculator/widgets/custom_container.dart';
import 'package:bmi_calculator/widgets/custom_float.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GenderStyle? selectgender;
  int height = 180;
  int weight = 60;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.ScaffoldCollor,
      appBar: AppBar(
        backgroundColor: Constants.ScaffoldCollor,
        foregroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: CustomContainer(
                onTap: () {
                  setState(() {
                    selectgender = GenderStyle.male;
                  });
                },
                custom_card:
                    const CustomCard(icon: FontAwesomeIcons.mars, text: "MALE"),
                color: selectgender == GenderStyle.male
                    ? Constants.activeCardColor
                    : Constants.inactiveCardColor,
              )),
              Expanded(
                  child: CustomContainer(
                onTap: () {
                  setState(() {
                    selectgender = GenderStyle.female;
                  });
                },
                custom_card: const CustomCard(
                    icon: FontAwesomeIcons.venus, text: "FEMALE"),
                color: selectgender == GenderStyle.female
                    ? Constants.activeCardColor
                    : Constants.inactiveCardColor,
              ))
            ],
          )),
          Expanded(
              child: CustomContainer(
            color: Constants.activeCardColor,
            custom_card: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: Constants.ktext,
                    ),
                    Text(
                      "cm",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Constants.pinkContainer,
                  inactiveColor: Colors.grey,
                  onChanged: (value) {
                    setState(() {
                      height = value.round();
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CustomContainer(
                  color: Constants.activeCardColor,
                  custom_card: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        weight.toString(),
                        style: Constants.ktext,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomFloat(
                            widget: Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomFloat(
                            widget: Icon(FontAwesomeIcons.plus),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomContainer(
                  color: Constants.activeCardColor,
                  custom_card: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        age.toString(),
                        style: Constants.ktext,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomFloat(
                            widget: Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomFloat(
                            widget: Icon(FontAwesomeIcons.plus),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          InkWell(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation()),
                  ));
            },
            child: Container(
              alignment: Alignment.center,
              height: 100,
              color: Constants.pinkContainer,
              padding: EdgeInsets.only(bottom: 25),
              child: Text(
                "CALCULATE",
                style: Constants.kLargeButtonText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
