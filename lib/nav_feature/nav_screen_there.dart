import 'package:flutter/material.dart';

class FirstNamedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Push Navigation
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondNamedScreen()),
                );
              },
              child: Text(
                'Push to Second Screen',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),

            SizedBox(height: 20),
            // PushReplacement Navigation
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SecondNamedScreen()),
                );
              },
              child: Text('PushReplacement to Second Screen'),
            ),
            SizedBox(height: 20),
            // Named Route Navigation
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Named Route to Second Screen'),
            ),
            SizedBox(height: 20),
            // Passing Data with Named Routes
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/third',
                  arguments: {'message': 'Hello from First Screen!'},
                );
              },
              child: Text('Pass Data to Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondNamedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Pop to First Screen'),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(args['message']),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Pop to First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
