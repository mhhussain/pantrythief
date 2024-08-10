import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/data/models/recipe_model.dart';

class DummyRecipeData {
  Future<List<RecipeModel>> getRecipes() async {
    final rm1 = RecipeModel(
      name: 'Butter Chicken',
      ingredients: [
        IngredientModel(
          name: 'Butter',
          amount: 3,
          units: 'tbsp'
        ),
        IngredientModel(
          name: 'Chicken',
          amount: 1,
          units: 'pound'
        ),
      ],
      instructions: 'Mix everything and nuke it'
    );
    final rm2 = RecipeModel(
      name: 'Chicken Biryani',
      ingredients: [
        IngredientModel(
          name: 'Rice',
          amount: 300,
          units: 'grams'
        ),
        IngredientModel(
          name: 'Chicken',
          amount: 1,
          units: 'pound'
        ),
      ],
      instructions: 'nuke it all'
    );
    return [rm1, rm2];
  }
}