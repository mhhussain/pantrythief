import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/data/api/local/shopping_list_api.dart';
import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/services/shopping_list_service.dart';

class ShoppingListRepository implements ShoppingListService {
  final ShoppingListApi _shoppingListApi;

  ShoppingListRepository(this._shoppingListApi);

  @override
  Future<DataState<List<IngredientEntity>>> getIngredients() async {
    final data = await _shoppingListApi.getIngredients();
    return DataSuccess(data);
  }

  @override
  Future<DataState<void>> addIngredient(IngredientEntity ingredient) async {
    await _shoppingListApi.addIngredient(IngredientModel(name: ingredient.name, amount: ingredient.amount, units: ingredient.units));
    return const DataSuccess(null);
  }

  @override
  Future<DataState<void>> removeIngredient(IngredientEntity ingredient) async {
    await _shoppingListApi.removeIngredient(IngredientModel(name: ingredient.name, amount: ingredient.amount, units: ingredient.units));
    return const DataSuccess(null);
  }
}