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

  int reduce(List<IngredientEntity> ingredientsList) {
    var i = 0;
    var r = check(ingredientsList);

    while (r.length == ingredientsList.length) {
      i++;
      r = check(r);
    }

    return i;
  }

  List<IngredientEntity> subtract(List<IngredientEntity> ingredientsList) {
    return ingredients.map((i) => i.reduce(ingredientsList)).toList();
  }

  List<IngredientEntity> check(List<IngredientEntity> ingredientsList) {
    return subtract(ingredientsList).where((i) => i.amount > 0).toList();
  }

  List<IngredientEntity> missing(List<IngredientEntity> ingredientsList) {
    return subtract(ingredientsList).where((i) => i.amount < 0).toList();
  }

  @override
  List<Object?> get props => [
    name,
    ingredients,
    instructions,
  ];
}