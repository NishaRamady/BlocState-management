import 'dart:math';

import 'package:blocstatemanagement/bloc/pizza_bloc.dart';
import 'package:blocstatemanagement/model/pizza_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Pizza Bloc"),
        centerTitle: true,
        backgroundColor: Colors.orange[800],
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
          if (state is PizzaInitial) {
            return const CircularProgressIndicator(
              color: Colors.orange,
            );
          }
          if (state is PizzaLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.pizzas.length}',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      for (int index = 0; index < state.pizzas.length; index++)
                        Positioned(

                              left: Random().nextInt(250).toDouble(),
                             top: Random().nextInt(400).toDouble(),
                            child: SizedBox(
                          height: 150,
                          width: 150,
                          child: state.pizzas[index].image,
                        ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          } 
          else {
            return const Text("Something went wrong!");
          }
        }
        
        
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            child: const Icon(Icons.local_pizza_outlined),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0]));
             }),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[0]));
            }),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            child: const Icon(Icons.local_pizza_outlined),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1]));
            }),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[1]));
            }),
        const SizedBox(
          height: 10,
        )
      ]),
      );
  }
}
