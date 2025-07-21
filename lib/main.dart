import 'package:flutter/material.dart';
import 'package:iti_project/auth/login_screen.dart';
import 'package:iti_project/list_view/list_view_ui.dart';
import 'package:iti_project/nav_feature/nav_examples.dart';
import 'package:iti_project/nav_feature/nav_screen_there.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      //home: FirstScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstNamedScreen(),
        '/second': (context) => SecondNamedScreen(),
        '/third': (context) => ThirdScreen(),
        // '/listViewUI': (context) => DataListView(dataGenerator: dataGenerator),
      },
    );
  }
}
