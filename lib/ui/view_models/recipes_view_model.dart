import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/ui/view_models/base_view_model.dart';

class RecipesViewModel extends BaseViewModel {
  final List<RecipeEntity> recipes;

  // RecipesViewModel.initial();
  
  RecipesViewModel({
    required this.recipes
  });
}