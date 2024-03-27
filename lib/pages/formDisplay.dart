import 'package:flutter/material.dart';

class FormData extends StatelessWidget {
  final String name;

  const FormData({required this.name}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
