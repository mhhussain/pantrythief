import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/core/usecase/usecase.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/services/shopping_list_service.dart';

class GetShoppingListUsecase implements UseCase<DataState<List<IngredientEntity>>, void> {
  ShoppingListService _shoppingListService;

  GetShoppingListUsecase(this._shoppingListService);

  @override
  Future<DataState<List<IngredientEntity>>> call({void params}) {
    return _shoppingListService.getIngredients();
  }
}