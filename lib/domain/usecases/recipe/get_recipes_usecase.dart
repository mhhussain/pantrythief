import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/domain/services/recipe_service.dart';
import 'package:pantrythief/core/usecase/usecase.dart';

class GetRecipesUseCase implements UseCase<DataState<List<RecipeEntity>>, void> {
  RecipeService _recipeService;

  GetRecipesUseCase(this._recipeService);

  @override
  Future<DataState<List<RecipeEntity>>> call({void params}) {
    return _recipeService.getRecipes();
  }
}