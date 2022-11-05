import 'dart:math';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int age;
  final int height;
  final int weight;
  final String gender;

  const ResultPage(
      {required this.age,
      required this.height,
      required this.weight,
      required this.gender,
      super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    double? result = widget.weight / (pow((widget.height / 100), 2));
    List<String> resultStatuses = [
      'Underweight',
      'Normal weight',
      'Pre-obesity',
      'Obesity class 1',
      'Obesity class 2',
      'Obesity class 3'
    ];
    Color statusShownColor = Colors.black;
    List<Color> statusColor = [
      Colors.red[100]!,
      Colors.green,
      Colors.orange,
      Colors.red[200]!,
      Colors.red,
      Colors.red[800]!,
    ];
    String getStatus() {
      if (result <= 18.5) {
        setState(() {
          statusShownColor = statusColor[0];
        });
        return resultStatuses[0];
      } else if (result > 18.5 && result <= 24.9) {
        setState(() {
          statusShownColor = statusColor[1];
        });
        return resultStatuses[1];
      } else if (result >= 25.0 && result <= 29.9) {
        setState(() {
          statusShownColor = statusColor[2];
        });
        return resultStatuses[2];
      } else if (result >= 30.0 && result <= 34.9) {
        setState(() {
          statusShownColor = statusColor[3];
        });
        return resultStatuses[3];
      } else if (result >= 35.0 && result <= 39.9) {
        setState(() {
          statusShownColor = statusColor[4];
        });
        return resultStatuses[4];
      } else if (result >= 40) {
        setState(() {
          statusShownColor = statusColor[5];
        });
        return resultStatuses[5];
      } else {
        return 'Sorry, something wrong happened ';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: 'Result: ',
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '${result.toInt()}',
                      style: TextStyle(
                        fontSize: 30,
                        color: statusShownColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
                    text: 'Status: ',
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                    children: [
                  TextSpan(
                    text: getStatus(),
                    style: TextStyle(
                        fontSize: 30,
                        color: statusShownColor,
                        fontWeight: FontWeight.bold),
                  )
                ])),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Gender: ${widget.gender}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Age: ${widget.age}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Weight: ${widget.weight}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Height: ${widget.height}',
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
