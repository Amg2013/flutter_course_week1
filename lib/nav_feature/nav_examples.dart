import 'package:flutter/material.dart';
import 'package:iti_project/nav_feature/nav_screen_two.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Push to Second Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Push to Second Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // PushReplacement to Second Screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('PushReplacement to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
