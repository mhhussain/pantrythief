import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';

class RecipesViewModel {
  final List<RecipeEntity> recipes;
  final List<IngredientEntity> ingredients;
  final List<IngredientEntity> shoppinglist;

  // RecipesViewModel.initial();
  
  RecipesViewModel({
    required this.recipes,
    required this.ingredients,
    required this.shoppinglist,
  });
}