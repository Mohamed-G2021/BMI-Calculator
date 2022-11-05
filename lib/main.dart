import 'dart:ui';
import 'package:bmi_calculator/result_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
    MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
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
  bool editHeightPressed = false;
  final heightTextController = TextEditingController();
  bool editWeightPressed = false;
  final weightTextController = TextEditingController();
  bool editAgePressed = false;
  final ageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
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
                                color: maleIsPressed
                                    ? Colors.blue
                                    : Colors.grey[400],
                              ),
                              child: Column(children: const [
                                Icon(
                                  Icons.male,
                                  size: 140,
                                ),
                                Text(
                                  'MALE',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
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
                                color: femaleIsPressed
                                    ? Colors.blue
                                    : Colors.grey[400],
                              ),
                              child: Column(children: const [
                                Icon(
                                  Icons.female,
                                  size: 140,
                                ),
                                Text(
                                  'FEMALE',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                            ),
                          ),
                          const Spacer(),
                        ]),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          const Spacer(),
                          const Text(
                            'HEIGHT',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              editHeightPressed
                                  ? IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () {
                                        setState(() {
                                          editHeightPressed = false;
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        setState(() {
                                          editHeightPressed = true;
                                        });
                                      },
                                    ),
                              editHeightPressed
                                  ? SizedBox(
                                      width: 55,
                                      child: TextFormField(
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0),
                                            //  focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none),
                                        keyboardType: TextInputType.number,
                                        autofocus: true,
                                        controller: heightTextController,
                                        maxLength: 3,
                                        onEditingComplete: () {
                                          if (heightTextController.text == '' ||
                                              int.parse(heightTextController
                                                      .text) <
                                                  45 ||
                                              int.parse(heightTextController
                                                      .text) >
                                                  251) {
                                            Fluttertoast.showToast(
                                              msg:
                                                  'Please choose a correct height',
                                              fontSize: 20,
                                            );
                                          } else {
                                            setState(() {
                                              editHeightPressed = false;
                                              height = int.parse(
                                                  heightTextController.text);
                                            });
                                          }
                                        },
                                      ))
                                  : RichText(
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
                                                    fontFeatures: [
                                                      FontFeature.subscripts()
                                                    ]))
                                          ]),
                                    ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
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
                      ),
                      const Spacer(),
                    ],
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
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      editWeightPressed
                                          ? IconButton(
                                              icon: const Icon(Icons.cancel),
                                              onPressed: () {
                                                setState(() {
                                                  editWeightPressed = false;
                                                });
                                              },
                                            )
                                          : IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                setState(() {
                                                  editWeightPressed = true;
                                                });
                                              },
                                            ),
                                      editWeightPressed
                                          ? SizedBox(
                                              width: 55,
                                              child: TextFormField(
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                decoration:
                                                    const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        0),
                                                        //  focusedBorder: InputBorder.none,
                                                        enabledBorder:
                                                            InputBorder.none),
                                                keyboardType:
                                                    TextInputType.number,
                                                autofocus: true,
                                                controller:
                                                    weightTextController,
                                                maxLength: 3,
                                                onEditingComplete: () {
                                                  if (weightTextController
                                                              .text ==
                                                          '' ||
                                                      int.parse(
                                                              weightTextController
                                                                  .text) <
                                                          0 ||
                                                      int.parse(
                                                              weightTextController
                                                                  .text) >
                                                          635) {
                                                    Fluttertoast.showToast(
                                                      msg:
                                                          'Please choose a correct weight',
                                                      fontSize: 20,
                                                    );
                                                  } else {
                                                    setState(() {
                                                      editWeightPressed = false;
                                                      weight = int.parse(
                                                          weightTextController
                                                              .text);
                                                    });
                                                  }
                                                },
                                              ))
                                          : RichText(
                                              text: TextSpan(
                                                  text: weight.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                  children: const [
                                                    TextSpan(
                                                        text: ' KG',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontFeatures: [
                                                              FontFeature
                                                                  .subscripts()
                                                            ]))
                                                  ]),
                                            ),
                                      const SizedBox(
                                        width: 20,
                                      )
                                    ],
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
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      editAgePressed
                                          ? IconButton(
                                              icon: const Icon(Icons.cancel),
                                              onPressed: () {
                                                setState(() {
                                                  editAgePressed = false;
                                                });
                                              },
                                            )
                                          : IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                setState(() {
                                                  editAgePressed = true;
                                                });
                                              },
                                            ),
                                      editAgePressed
                                          ? SizedBox(
                                              width: 55,
                                              child: TextFormField(
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                decoration:
                                                    const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        0),
                                                        //  focusedBorder: InputBorder.none,
                                                        enabledBorder:
                                                            InputBorder.none),
                                                keyboardType:
                                                    TextInputType.number,
                                                autofocus: true,
                                                controller: ageTextController,
                                                maxLength: 3,
                                                onEditingComplete: () {
                                                  if (ageTextController
                                                              .text ==
                                                          '' ||
                                                      int.parse(
                                                              ageTextController
                                                                  .text) <
                                                          0 ||
                                                      int.parse(
                                                              ageTextController
                                                                  .text) >
                                                          123) {
                                                    Fluttertoast.showToast(
                                                      msg:
                                                          'Please choose a correct age',
                                                      fontSize: 20,
                                                    );
                                                  } else {
                                                    setState(() {
                                                      editAgePressed = false;
                                                      age = int.parse(
                                                          ageTextController
                                                              .text);
                                                    });
                                                  }
                                                },
                                              ))
                                          : RichText(
                                              text: TextSpan(
                                                  text: age.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                  children: const [
                                                    TextSpan(
                                                        text: ' YR',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontFeatures: [
                                                              FontFeature
                                                                  .subscripts()
                                                            ]))
                                                  ]),
                                            ),
                                    ],
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
                    child: MaterialButton(
                      color: Colors.blue,
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
