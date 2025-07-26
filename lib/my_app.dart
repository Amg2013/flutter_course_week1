import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/bloc_screens/bloc/counter_bloc.dart';
import 'package:iti_project/bloc_screens/counter_screen_with_bloc.dart';
import 'package:iti_project/nav_feature/nav_screen_there.dart';
import 'package:iti_project/utils/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///
    ///
    ///
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        theme: AppThemes.lightTheme,

        // darkTheme: AppThemes.lightTheme,
        home: CounterScreenWithBloc(),
      ),
    );
  }
}
