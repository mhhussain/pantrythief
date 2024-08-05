import 'package:dartz/dartz.dart';
import 'package:pantrythief/core/models/ingredient.dart';

class Recipe {
  final IList<Ingredient> ingredients;
  final String instructions;

  const Recipe({
    required this.ingredients,
    required this.instructions,
  });
}