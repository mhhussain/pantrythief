
import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';

class RecipeModel extends RecipeEntity {

  // Not sure how necessary this is
  @override
  final List<IngredientModel> ingredients;

  const RecipeModel({
    required super.name,
    required this.ingredients,
    required super.instructions,
  }) : super(ingredients: ingredients);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'ingredients': ingredients.map((i) => i.toJson()).toList(),
      'instructions': instructions,
    };
  }

  factory RecipeModel.fromJson(Map<String, dynamic> map) {
    return RecipeModel(
      name: map['name'],
      // ingredient data must be extracted from inner json objects
      ingredients: (map['ingredients'] as List).map((i) => IngredientModel.fromJson(i)).toList(),
      instructions: map['instructions'],
    );
  }
}