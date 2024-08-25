import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/core/usecase/usecase.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/services/ingredient_service.dart';
import 'package:pantrythief/domain/services/shopping_list_service.dart';

class TransferToIngredientsUsecase implements UseCase<DataState<void>, IngredientEntity> {
  ShoppingListService _shoppingListService;
  IngredientService _ingredientService;

  TransferToIngredientsUsecase(this._shoppingListService, this._ingredientService);

  @override
  Future<DataState<void>> call({IngredientEntity? params}) async {
    final existingIngredients = await _ingredientService.getIngredients();
    final existingIngredient = existingIngredients.data!.where((i) => i.name == params!.name).first;

    final newIngredient = IngredientEntity(
      name: existingIngredient.name,
      amount: existingIngredient.amount + (params!.amount * params.units.to(existingIngredient.units)),
      units: existingIngredient.units
    );

    await _ingredientService.updateIngredient(newIngredient);
    await _shoppingListService.removeIngredient(params);

    return Future.value(const DataSuccess(null));
  }
}