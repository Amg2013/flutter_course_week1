import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/features/auth/bloc/login_bloc.dart';
import 'package:iti_project/features/auth/login_screen.dart';
import 'package:iti_project/bloc_screens/bloc/counter_bloc.dart';
import 'package:iti_project/tasks/screens/add_tassk.dart';
import 'package:iti_project/tasks/screens/task_home.dart';
import 'package:iti_project/utils/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///
    ///
    ///
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: MaterialApp(
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        // darkTheme: AppThemes.lightTheme,
        home: TaskHome(),
      ),
    );
  }
}
