import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredient.dart';

class IngredientsList extends StatelessWidget {
  final IList<IngredientModel> ingredients;
  final Function(IngredientEntity) onDelete;

  const IngredientsList({
    super.key,
    required this.ingredients,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients.map((i) => Ingredient(ingredient: i, onDelete: onDelete,)).toList(),
    );
  }
}