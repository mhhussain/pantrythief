import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';

abstract class IngredientService {
  Future<DataState<List<IngredientEntity>>> getIngredients();

  Future<DataState<void>> addIngredient(covariant IngredientEntity ingredient);

  Future<DataState<void>> updateIngredient(covariant IngredientEntity ingredient);

  Future<DataState<void>> removeIngredient(covariant IngredientEntity ingredient);
}