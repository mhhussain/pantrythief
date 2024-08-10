import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/data/api/dummy/ingredients_data.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/services/ingredient_service.dart';

class IngredientRepository implements IngredientService {
  final DummyIngredientsData _ingredientApi;

  IngredientRepository(this._ingredientApi);

  @override
  Future<DataState<List<IngredientEntity>>> getIngredients() async {
    final data = await _ingredientApi.getIngredients();

    return DataSuccess(data);
  }
}