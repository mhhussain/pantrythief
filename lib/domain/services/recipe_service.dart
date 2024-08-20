import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';

abstract class RecipeService {
  Future<DataState<List<RecipeEntity>>> getRecipes();

  Future<DataState<RecipeEntity>> getRecipeByName(String name);

  Future<DataState<void>> addRecipe(RecipeEntity recipe);

  Future<DataState<void>> updateRecipe(RecipeEntity recipe);
  
  Future<DataState<void>> removeRecipe(RecipeEntity recipe);
}