import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/domain/services/recipe_service.dart';
import 'package:pantrythief/core/usecase/usecase.dart';

class UpdateRecipeUseCase extends UseCase<DataState<void>, RecipeEntity> {
  RecipeService _recipeService;

  UpdateRecipeUseCase(this._recipeService);

  @override
  Future<DataState<void>> call({RecipeEntity? params}) {
    return _recipeService.updateRecipe(params!);
  }
}