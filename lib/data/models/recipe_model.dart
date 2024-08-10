import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';

class RecipeModel extends RecipeEntity {
  RecipeModel({
    required super.name,
    required super.ingredients,
    required super.instructions,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> map) {
    return RecipeModel(
      name: map['name'],
      // ingredient data must be extracted from inner json objects
      ingredients: (map['ingredients'] as List).map((i) => IngredientModel.fromJson(i)).toList(),
      instructions: map['instructions'],
    );
  }
}