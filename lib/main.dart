import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAM',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator'),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {
  final _formKey = GlobalKey<FormState>();

  double weight = 0.0;
  double height = 0.0;
  String bmi = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter weight';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  weight = double.parse(value);
                });
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: 'Weight'),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 32),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter height';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  height = double.parse(value);
                });
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: 'Height'),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 32),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              bmi,
              style: TextStyle(
                  fontSize: 48, color: Color.fromRGBO(25, 160, 255, 100)),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    bmi = (weight / pow((height / 100), 2)).toStringAsFixed(2);
                  });
                }
              },
              child: Text(
                'Show BMI',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
