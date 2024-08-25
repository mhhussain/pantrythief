import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/core/usecase/usecase.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/services/shopping_list_service.dart';

class RemoveFromShoppingListUsecase implements UseCase<DataState<void>, IngredientEntity> {
  ShoppingListService _shoppingListService;

  RemoveFromShoppingListUsecase(this._shoppingListService);

  @override
  Future<DataState<void>> call({IngredientEntity? params}) {
    return _shoppingListService.removeIngredient(params!);
  }
}