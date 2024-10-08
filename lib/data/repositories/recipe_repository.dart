import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/data/api/local/recipes_api.dart';
import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/data/models/recipe_model.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/domain/services/recipe_service.dart';

class RecipeRepository implements RecipeService {
  final RecipeApi _recipeApi;

  RecipeRepository(this._recipeApi);

  @override
  Future<DataState<List<RecipeModel>>> getRecipes() async {
    final data = await _recipeApi.getRecipes();

    return DataSuccess(data);
  }


  @override
  Future<DataState<RecipeEntity>> getRecipeByName(String name) async {
    final data = await _recipeApi.getRecipeByName(name);

    return DataSuccess(data);
  }

  @override
  Future<DataState<void>> addRecipe(RecipeEntity recipe) async {
    try {
      await _recipeApi.addRecipe(RecipeModel(
        name: recipe.name,
        ingredients: recipe.ingredients.map((i) => IngredientModel(name: i.name, amount: i.amount, units: i.units)).toList(),
        instructions: recipe.instructions
      ));

      return const DataSuccess(null);

    } on Exception catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<void>> updateRecipe(RecipeEntity recipe) async {
    await _recipeApi.updateRecipe(RecipeModel(
      name: recipe.name,
      ingredients: recipe.ingredients.map((i) => IngredientModel(name: i.name, amount: i.amount, units: i.units)).toList(),
      instructions: recipe.instructions
    ));

    return const DataSuccess(null);
  }
  
  @override
  Future<DataState<void>> removeRecipe(RecipeEntity recipe) async {
    await _recipeApi.removeRecipe(RecipeModel(name: recipe.name, ingredients: [], instructions: ''));

    return const DataSuccess(null);
  }
}