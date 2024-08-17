import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/data/api/local/ingredient_api.dart';
import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/domain/services/ingredient_service.dart';

class IngredientRepository implements IngredientService {
  final IngredientApi _ingredientApi;

  IngredientRepository(this._ingredientApi);

  @override
  Future<DataState<List<IngredientModel>>> getIngredients() async {
    final data = await _ingredientApi.getIngredients();

    return DataSuccess(data);
  }

  @override
  Future<DataState<void>> addIngredient(IngredientModel ingredient) async {
    await _ingredientApi.addIngredient(ingredient);
    return const DataSuccess(null);
  }

  @override
  Future<DataState<void>> updateIngredient(IngredientModel ingredient) async {
    // await _ingredientApi.updateIngredient(IngredientModel(name: ingredient.name, amount: ingredient.amount, units: ingredient.units));
    await _ingredientApi.updateIngredient(ingredient);
    return const DataSuccess(null);
  }

  @override
  Future<DataState<void>> removeIngredient(IngredientModel ingredient) async {
    await _ingredientApi.removeIngredient(ingredient);
    return const DataSuccess(null);
  }
}