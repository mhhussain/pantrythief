import 'package:equatable/equatable.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';

class RecipeEntity extends Equatable {
  final String name;
  final List<IngredientEntity> ingredients;
  final String instructions;

  const RecipeEntity({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });

  List<IngredientEntity> reduce(List<IngredientEntity> ingredientsList) {
    return ingredients.map((i) => i.reduce(ingredientsList)).toList();
  }

  List<IngredientEntity> check(List<IngredientEntity> ingredientsList) {
    return reduce(ingredientsList).where((i) => i.amount > 0).toList();
  }

  List<IngredientEntity> missing(List<IngredientEntity> ingredientsList) {
    return reduce(ingredientsList).where((i) => i.amount < 0).toList();
  }

  @override
  List<Object?> get props => [
    name,
    ingredients,
    instructions,
  ];
}