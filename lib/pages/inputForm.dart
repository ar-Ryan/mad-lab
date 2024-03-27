import 'package:flutter/material.dart';
import 'package:app_one/pages/formDisplay.dart';

class formOne extends StatefulWidget {
  const formOne({super.key});

  @override
  State<formOne> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<formOne> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Name'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String enteredName = name.text;
                if (enteredName.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormData(name: enteredName),
                    ),
                  );
                } else {
                  // Show a SnackBar or handle empty name case
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
