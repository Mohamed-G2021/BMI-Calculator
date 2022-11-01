import 'dart:math';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double? result = weight / (pow((height / 100), 2));
    List<String> resultStatuses = [
      'Underweight',
      'Normal weight',
      'Pre-obesity',
      'Obesity class 1',
      'Obesity class 2',
      'Obesity class 3'
    ];
    String getStatus() {
      if (result <= 18.5) {
        return resultStatuses[0];
      } else if (result > 18.5 && result <= 24.9) {
        return resultStatuses[1];
      } else if (result >= 25.0 && result <= 29.9) {
        return resultStatuses[2];
      } else if (result >= 30.0 && result <= 34.9) {
        return resultStatuses[2];
      } else if (result >= 35.0 && result <= 39.9) {
        return resultStatuses[4];
      } else if (result >= 40) {
        return resultStatuses[5];
      } else {
        return 'Please enter correct data';
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Result: ${result.toInt()}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Status: ${getStatus()}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Gender: $gender',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Age: $age',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Weight: $weight',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Height: $height',
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
