import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/domain/services/recipe_service.dart';
import 'package:pantrythief/domain/usecases/usecase.dart';

class GetRecipeByNameUseCase implements UseCase<DataState<RecipeEntity>, String> {
  RecipeService _recipeService;

  GetRecipeByNameUseCase(this._recipeService);

  @override
  Future<DataState<RecipeEntity>> call({String? params}) {
    return _recipeService.getRecipeByName(params!);
  }
}