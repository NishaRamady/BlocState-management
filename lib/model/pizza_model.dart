import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Pizza({required this.id, required this.name, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image];
  static List<Pizza> pizzas = [
    Pizza(
        id: '0',
        name: "Pizza Margherita",
        image:Image.asset("assets/images/pizza.png")),
        Pizza(
          id: "1", 
          name: "Pizza pepperoni", 
          image: Image.asset("assets/images/pepperoni.png")),

  ];
}
