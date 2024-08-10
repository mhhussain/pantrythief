import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/services/ingredient_service.dart';
import 'package:pantrythief/domain/usecases/usecase.dart';

class GetIngredientsUseCase implements UseCase<DataState<List<IngredientEntity>>, void> {
  IngredientService _ingredientService;

  GetIngredientsUseCase(this._ingredientService);

  @override
  Future<DataState<List<IngredientEntity>>> call({void params}) {
    return _ingredientService.getIngredients();
  }
}