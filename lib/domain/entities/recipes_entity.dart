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

  @override
  List<Object?> get props => [
    name,
    ingredients,
    instructions,
  ];
}