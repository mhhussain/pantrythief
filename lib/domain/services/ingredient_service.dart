import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';

abstract class IngredientService {
  Future<DataState<List<IngredientEntity>>> getIngredients();
}