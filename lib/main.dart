import 'package:blocstatemanagement/bloc/pizza_bloc.dart';
import 'package:blocstatemanagement/view/pizzaview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => PizzaBloc()..add(LoadPizzaCounter()))
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "The Pizza Bloc",
          home: HomeScreen(),
        ));
  }
}

