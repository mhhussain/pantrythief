import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/domain/services/recipe_service.dart';
import 'package:pantrythief/domain/usecases/usecase.dart';

class AddRecipeUseCase extends UseCase<DataState<void>, RecipeEntity> {
  RecipeService _recipeService;

  AddRecipeUseCase(this._recipeService);

  @override
  Future<DataState<void>> call({RecipeEntity? params}) {
    return _recipeService.addRecipe(params!);
  }
}