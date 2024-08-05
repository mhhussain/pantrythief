import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pantrythief/core/models/ingredient.dart' as model;
import 'package:pantrythief/ui/widgets/molecules/ingredient.dart';

class IngredientsList extends StatelessWidget {
  final IList<model.Ingredient> ingredients;

  const IngredientsList({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients.map((i) => Ingredient(ingredient: i,)).toList(),
    );
  }
}