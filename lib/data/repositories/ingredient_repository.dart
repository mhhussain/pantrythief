import 'package:pantrythief/core/resources/data_state.dart';
// import 'package:pantrythief/data/api/dummy/ingredients_data.dart';
import 'package:pantrythief/data/api/local/ingredient_api.dart';
import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
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
  Future<DataState<void>> addIngredient(IngredientEntity ingredient) async {
    await _ingredientApi.addIngredient(IngredientModel(name: ingredient.name, amount: ingredient.amount, units: ingredient.units));
    return const DataSuccess(true);
  }

  @override
  Future<DataState<void>> updateIngredient(IngredientEntity ingredient) async {
    await _ingredientApi.updateIngredient(IngredientModel(name: ingredient.name, amount: ingredient.amount, units: ingredient.units));
    return const DataSuccess(true);
  }

  @override
  Future<DataState<void>> removeIngredient(IngredientEntity ingredient) async {
    await _ingredientApi.removeIngredient(IngredientModel(name: ingredient.name, amount: ingredient.amount, units: ingredient.units));
    return const DataSuccess(true);
  }
}