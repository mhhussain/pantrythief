import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';

abstract class RecipeService {
  Future<DataState<List<RecipeEntity>>> getRecipes();
}