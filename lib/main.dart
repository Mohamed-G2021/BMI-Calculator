import 'dart:ui';
import 'package:bmi_calculator/result_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flag/flag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/translations',
        startLocale: const Locale('ar'),
        saveLocale: true,
        fallbackLocale: const Locale('ar'),
        child: const MyApp()),
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
    return MaterialApp(
      title: "app_title".tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomePage(),
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
  dynamic dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("app_title".tr()),
          actions: [
            SizedBox(
              width: 100,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    value: dropDownValue ?? 'arabic',
                    items: [
                      DropdownMenuItem(
                        onTap: () {
                          context.setLocale(const Locale('ar'));
                        },
                        value: 'arabic',
                        child: Flag.fromCode(
                          FlagsCode.SA,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      DropdownMenuItem(
                        onTap: () {
                          context.setLocale(const Locale('en'));
                        },
                        value: 'english',
                        child: Flag.fromCode(
                          FlagsCode.US,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropDownValue = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
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
                                gender = "male".tr();
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
                              child: Column(children: [
                                const Icon(
                                  Icons.male,
                                  size: 140,
                                ),
                                Text(
                                  "male".tr(),
                                  style: const TextStyle(
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
                                gender = "female".tr();
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
                              child: Column(children: [
                                const Icon(
                                  Icons.female,
                                  size: 140,
                                ),
                                Text(
                                  "female".tr(),
                                  style: const TextStyle(
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
                          Text(
                            "height".tr(),
                            style: const TextStyle(
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
                                              msg: "height_error_message".tr(),
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
                                          children: [
                                            TextSpan(
                                                text: ' ${"cm".tr()}',
                                                style: const TextStyle(
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
                                  Text(
                                    "weight".tr(),
                                    style: const TextStyle(
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
                                                          "weight_error_message"
                                                              .tr(),
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
                                                  children: [
                                                    TextSpan(
                                                        text: ' ${"kg".tr()}',
                                                        style: const TextStyle(
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
                                  Text(
                                    "age".tr(),
                                    style: const TextStyle(
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
                                                      msg: "age_error_message"
                                                          .tr(),
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
                                                  children: [
                                                    TextSpan(
                                                        text: ' ${"year".tr()}',
                                                        style: const TextStyle(
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
                            msg: "gender_error_message".tr(),
                            fontSize: 20,
                          );
                        } else if (height < 45 || height > 251) {
                          Fluttertoast.showToast(
                            msg: "height_error_message".tr(),
                            fontSize: 20,
                          );
                        } else if (weight < 0 || weight > 635) {
                          Fluttertoast.showToast(
                            msg: "weight_error_message".tr(),
                            fontSize: 20,
                          );
                        } else if (age < 0 || age > 123) {
                          Fluttertoast.showToast(
                            msg: "age_error_message".tr(),
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
                      child: Text(
                        "calculate".tr(),
                        style: const TextStyle(
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
