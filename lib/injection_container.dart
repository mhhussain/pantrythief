import 'package:get_it/get_it.dart';
import 'package:pantrythief/data/api/dummy/ingredients_data.dart';
import 'package:pantrythief/data/api/dummy/recipe_data.dart';
import 'package:pantrythief/data/api/local/ingredient_api.dart';
import 'package:pantrythief/data/api/local/recipes_api.dart';
import 'package:pantrythief/data/repositories/ingredient_repository.dart';
import 'package:pantrythief/data/repositories/recipe_repository.dart';
import 'package:pantrythief/domain/services/ingredient_service.dart';
import 'package:pantrythief/domain/services/recipe_service.dart';
import 'package:pantrythief/domain/usecases/add_ingredient_usecase.dart';
import 'package:pantrythief/domain/usecases/add_recipe_usecase.dart';
import 'package:pantrythief/domain/usecases/get_ingredients_usecase.dart';
import 'package:pantrythief/domain/usecases/get_recipes_usecase.dart';
import 'package:pantrythief/domain/usecases/remove_ingredient_usecase.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // data
  locator.registerSingleton<DummyRecipeData>(DummyRecipeData());
  locator.registerSingleton<DummyIngredientsData>(DummyIngredientsData());
  locator.registerSingleton<IngredientApi>(IngredientApi());
  locator.registerSingleton<RecipeApi>(RecipeApi());

  // domain - services
  locator.registerSingleton<RecipeService>(RecipeRepository(locator()));
  locator.registerSingleton<IngredientService>(IngredientRepository(locator()));

  // domain - usecases
  locator.registerSingleton<GetRecipesUseCase>(GetRecipesUseCase(locator()));
  locator.registerSingleton<GetIngredientsUseCase>(GetIngredientsUseCase(locator()));
  locator.registerSingleton<AddIngredientUseCase>(AddIngredientUseCase(locator()));
  locator.registerSingleton<RemoveIngredientUseCase>(RemoveIngredientUseCase(locator()));
  locator.registerSingleton<AddRecipeUseCase>(AddRecipeUseCase(locator()));
}