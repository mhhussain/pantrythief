import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/services/ingredient_service.dart';
import 'package:pantrythief/core/usecase/usecase.dart';

class RemoveIngredientUseCase implements UseCase<DataState<void>, IngredientEntity> {
  IngredientService _ingredientService;

  RemoveIngredientUseCase(this._ingredientService);

  @override
  Future<DataState<void>> call({IngredientEntity? params}) {
    return _ingredientService.removeIngredient(params!);
  }
}