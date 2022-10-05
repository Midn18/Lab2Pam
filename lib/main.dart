import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        title: 'IMC Calculator',
        home: Scaffold(
          backgroundColor: Colors.yellow[50],
          appBar: AppBar(
            centerTitle: true,
            title: const Text('IMC Calculator'),
          ),
          body: const MyBMIForm(),
        ));
  }
}

class MyBMIForm extends StatefulWidget {
  const MyBMIForm({super.key});

  @override
  State<MyBMIForm> createState() => _MyBMIFormState();
}

class _MyBMIFormState extends State<MyBMIForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double weight = 0.0;
  double height = 0.0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 150, 80, 0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    height = double.parse(value);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter your height in cm',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 20, 80, 0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    weight = double.parse(value);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter your weight in kg',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 50, 40, 0),
              child: Text(
                'Your BMI is: $result',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(140, 80, 120, 0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      result =
                          (weight / pow(height / 100, 2.0)).toStringAsFixed(2);
                    });
                  }
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
