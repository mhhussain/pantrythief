import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/data/api/dummy/recipe_data.dart';
import 'package:pantrythief/data/models/recipe_model.dart';
import 'package:pantrythief/domain/services/recipe_service.dart';

class RecipeRepository implements RecipeService {
  final DummyRecipeData _recipeApi;

  RecipeRepository(this._recipeApi);

  @override
  Future<DataState<List<RecipeModel>>> getRecipes() async {
    final data = await _recipeApi.getRecipes();

    return DataSuccess(data);
  }
}