import 'dart:ui';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool maleIsPressed = false;
  bool femaleIsPressed = false;
  int height = 166;
  int menAvgHeight = 176;
  int womenAvgHeight = 162;
  int weight = 80;
  int womenAvgWeight = 77;
  int menAvgWeight = 90;
  int age = 30;
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        gender = 'Male';
                        height = menAvgHeight;
                        weight = menAvgWeight;
                        maleIsPressed = true;
                        femaleIsPressed = false;
                      });
                    },
                    child: Container(
                      height: 190,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: maleIsPressed ? Colors.blue : Colors.grey[400],
                      ),
                      child: Column(children: const [
                        Icon(
                          Icons.male,
                          size: 140,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        gender = 'Female';
                        height = womenAvgHeight;
                        weight = womenAvgWeight;
                        femaleIsPressed = true;
                        maleIsPressed = false;
                      });
                    },
                    child: Container(
                      height: 190,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: femaleIsPressed ? Colors.blue : Colors.grey[400],
                      ),
                      child: Column(children: const [
                        Icon(
                          Icons.female,
                          size: 140,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                  ),
                  const Spacer(),
                ]),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              const Spacer(),
              const Text(
                'HEIGHT',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                    text: height.toString(),
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: const [
                      TextSpan(
                          text: ' CM',
                          style: TextStyle(
                              fontSize: 20,
                              fontFeatures: [FontFeature.subscripts()]))
                    ]),
              ),
              Slider(
                min: 45,
                max: 251,
                value: height.toDouble(),
                onChanged: (value) {
                  setState(() {
                    height = value.toInt();
                  });
                },
              ),
              const Spacer()
            ]),
          )),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Container(
                    height: 190,
                    width: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${weight.toInt()}',
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Row(
                            children: [
                              const Spacer(
                                flex: 100,
                              ),
                              FloatingActionButton(
                                  heroTag: null,
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      weight -= 1;
                                    });
                                  },
                                  child: const Icon(Icons.remove)),
                              const Spacer(
                                flex: 1,
                              ),
                              FloatingActionButton(
                                  heroTag: null,
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      weight += 1;
                                    });
                                  },
                                  child: const Icon(Icons.add)),
                              const Spacer(
                                flex: 100,
                              ),
                            ],
                          )
                        ]),
                  ),
                  const Spacer(),
                  Container(
                    height: 190,
                    width: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${age.toInt()}',
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Row(
                            children: [
                              const Spacer(
                                flex: 100,
                              ),
                              FloatingActionButton(
                                  heroTag: null,
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      age -= 1;
                                    });
                                  },
                                  child: const Icon(Icons.remove)),
                              const Spacer(
                                flex: 1,
                              ),
                              FloatingActionButton(
                                  heroTag: null,
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      age += 1;
                                    });
                                  },
                                  child: const Icon(Icons.add)),
                              const Spacer(
                                flex: 100,
                              ),
                            ],
                          )
                        ]),
                  ),
                  const Spacer(),
                ]),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (gender == '') {
                  Fluttertoast.showToast(
                    msg: 'Please choose your gender',
                    fontSize: 20,
                  );
                } else if (height < 45 || height > 251) {
                  Fluttertoast.showToast(
                    msg: 'Please choose a correct height',
                    fontSize: 20,
                  );
                } else if (weight < 0 || weight > 635) {
                  Fluttertoast.showToast(
                    msg: 'Please enter a correct weight',
                    fontSize: 20,
                  );
                } else if (age < 0 || age > 123) {
                  Fluttertoast.showToast(
                    msg: 'Please enter a correct age',
                    fontSize: 20,
                  );
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      age: age,
                      gender: gender,
                      height: height,
                      weight: weight,
                    );
                  }));
                }
              },
              child: const Text(
                'CALCULATE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
