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
      ingredients: map['ingredients'],
      instructions: map['instructions'],
    );
  }
}