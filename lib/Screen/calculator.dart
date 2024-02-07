import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Function/ReuseableBox.dart';
import '../Function/cardChildBuilder.dart';
import '../constants.dart';
import 'result_page.dart';
import '../Function/calculation.dart';

class inputPage extends StatefulWidget {
  State<inputPage> createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  sexType selectedGender = sexType.netural;

  get newSlidervalue => null;

  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'BMI CALCULATOR',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableBox(
                      onPress: () {
                        setState(() {
                          selectedGender = sexType.male;
                        });
                      },
                      color: selectedGender == sexType.male
                          ? KactiveCardColor
                          : KinActiveCardColor,
                      cardChild: cardChildBulder(
                        icon: FontAwesomeIcons.mars,
                        text: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableBox(
                      onPress: () {
                        setState(() {
                          selectedGender = sexType.female;
                        });
                      },
                      color: selectedGender == sexType.female
                          ? KactiveCardColor
                          : KinActiveCardColor,
                      cardChild: cardChildBulder(
                        icon: FontAwesomeIcons.venus,
                        text: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ReuseableBox(
                      color: KfirstColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style: KlabelStyle,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '$Kslidervalue',
                                  style: KnumberStyle,
                                ),
                                Text('cm'),
                              ],
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: KsecondColor,
                                thumbColor: KthirdColor,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 25),
                                overlayColor: KsecondColor),
                            child: Slider(
                              value: Kslidervalue.toDouble(),
                              min: 120.0,
                              max: 240.0,
                              onChanged: (double newSlidervalue) {
                                setState(
                                  () {
                                    Kslidervalue = newSlidervalue.round();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableBox(
                      color: KsecondColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: KlabelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weight.toString(),
                                style: KlabelStyle,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Lbs',
                                style: KlabelStyle,
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              mybutton(
                                neededIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              mybutton(
                                neededIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                  ;
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableBox(
                      color: KsecondColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: KlabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: KlabelStyle,
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              mybutton(
                                neededIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              mybutton(
                                neededIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                  ();
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Bottombutton(
              buttontext: 'CALCULATE',
              onTap: () {
                calculatorbrain Calculatorbrain =
                    calculatorbrain(height: Kslidervalue, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Resultpage(
                              score: Calculatorbrain.getBmi(),
                              status: Calculatorbrain.getstatus(),
                              feedback: Calculatorbrain.getfeedback(),
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = sexType.male;
        });
      },
    );
  }
}

class Bottombutton extends StatelessWidget {
  Bottombutton({required this.buttontext, required this.onTap});

  final String buttontext;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttontext,
            style: Kbottombuttonfontstyle,
          ),
        ),
        color: Colors.red[400],
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KexpendingBoxHeight,
      ),
    );
  }
}

class mybutton extends StatelessWidget {
  mybutton({required this.neededIcon, required this.onPressed});

  final IconData neededIcon;
  final VoidCallback onPressed;

  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(neededIcon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      fillColor: KthirdColor,
    );
  }
}
