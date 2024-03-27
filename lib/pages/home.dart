import 'package:flutter/material.dart';
import 'package:app_one/pages/inputForm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  double result = 0.0;

  @override
  void initState() {
    super.initState();
    number1Controller.addListener(updateNumber1);
    number2Controller.addListener(updateNumber2);
  }

  void updateNumber1() {
    setState(() {}); // Update the UI when number1Controller changes
  }

  void updateNumber2() {
    setState(() {}); // Update the UI when number2Controller changes
  }

  void performOperation(String operation) {
    double num1 = double.tryParse(number1Controller.text) ?? 0.0;
    double num2 = double.tryParse(number2Controller.text) ?? 0.0;

    switch (operation) {
      case '+':
        setState(() {
          result = num1 + num2;
        });
        break;
      case '-':
        setState(() {
          result = num1 - num2;
        });
        break;
      case '*':
        setState(() {
          result = num1 * num2;
        });
        break;
      case '/':
        setState(() {
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            // Handle division by zero error
            result = double.infinity;
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: number1Controller,
                decoration: InputDecoration(
                  labelText: 'Enter Number 1',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: number2Controller,
                decoration: InputDecoration(
                  labelText: 'Enter Number 2',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text(
                'Number 1: ${number1Controller.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Number 2: ${number2Controller.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => performOperation('+'),
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: () => performOperation('-'),
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () => performOperation('*'),
                    child: Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: () => performOperation('/'),
                    child: Text('/'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Result: ${result.toStringAsFixed(2)}', // Limit decimals to 2
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => formOne()),
                  );
                },
                child: Text('Go to Name Input Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
