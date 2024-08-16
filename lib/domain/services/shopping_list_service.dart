import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';

abstract class ShoppingListService {
  Future<DataState<List<IngredientEntity>>> getIngredients();

  Future<DataState<void>> addIngredient(IngredientEntity ingredient);

  Future<DataState<void>> removeIngredient(IngredientEntity ingredient);
}