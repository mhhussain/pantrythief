import 'package:get_it/get_it.dart';
import 'package:pantrythief/data/api/dummy/ingredients_data.dart';
import 'package:pantrythief/data/api/dummy/recipe_data.dart';
import 'package:pantrythief/data/api/local/ingredient_api.dart';
import 'package:pantrythief/data/api/local/recipes_api.dart';
import 'package:pantrythief/data/api/local/shopping_list_api.dart';
import 'package:pantrythief/data/repositories/ingredient_repository.dart';
import 'package:pantrythief/data/repositories/recipe_repository.dart';
import 'package:pantrythief/data/repositories/shopping_list_repository.dart';
import 'package:pantrythief/domain/services/ingredient_service.dart';
import 'package:pantrythief/domain/services/recipe_service.dart';
import 'package:pantrythief/domain/services/shopping_list_service.dart';
import 'package:pantrythief/domain/usecases/ingredient/get_ingredients_usecase.dart';
import 'package:pantrythief/domain/usecases/ingredient/add_ingredient_usecase.dart';
import 'package:pantrythief/domain/usecases/ingredient/update_ingredient_usecase.dart';
import 'package:pantrythief/domain/usecases/ingredient/remove_ingredient_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/get_recipes_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/get_recipe_by_name_usercase.dart';
import 'package:pantrythief/domain/usecases/recipe/add_recipe_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/remove_recipe_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/update_recipe_usecase.dart';
import 'package:pantrythief/domain/usecases/shopping_list/add_to_shopping_list_usecase.dart';
import 'package:pantrythief/domain/usecases/shopping_list/get_shopping_list_usecase.dart';
import 'package:pantrythief/domain/usecases/shopping_list/remove_from_shopping_list_usecase.dart';
import 'package:pantrythief/domain/usecases/shopping_list/transfer_to_ingredients_usecase.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // data
  locator.registerSingleton<DummyRecipeData>(DummyRecipeData());
  locator.registerSingleton<DummyIngredientsData>(DummyIngredientsData());
  locator.registerSingleton<IngredientApi>(IngredientApi());
  locator.registerSingleton<RecipeApi>(RecipeApi());
  locator.registerSingleton<ShoppingListApi>(ShoppingListApi());

  // domain - services
  locator.registerSingleton<RecipeService>(RecipeRepository(locator()));
  locator.registerSingleton<IngredientService>(IngredientRepository(locator()));
  locator.registerSingleton<ShoppingListService>(ShoppingListRepository(locator()));

  // domain - usecases
  //   ingredients
  locator.registerSingleton<GetIngredientsUseCase>(GetIngredientsUseCase(locator()));
  locator.registerSingleton<AddIngredientUseCase>(AddIngredientUseCase(locator()));
  locator.registerSingleton<RemoveIngredientUseCase>(RemoveIngredientUseCase(locator()));
  locator.registerSingleton<UpdateIngredientUseCase>(UpdateIngredientUseCase(locator()));
  //   recipes
  locator.registerSingleton<GetRecipesUseCase>(GetRecipesUseCase(locator()));
  locator.registerSingleton<GetRecipeByNameUseCase>(GetRecipeByNameUseCase(locator()));
  locator.registerSingleton<AddRecipeUseCase>(AddRecipeUseCase(locator()));
  locator.registerSingleton<UpdateRecipeUseCase>(UpdateRecipeUseCase(locator()));
  locator.registerSingleton<RemoveRecipeUseCase>(RemoveRecipeUseCase(locator()));
  //   shopping list
  locator.registerSingleton<GetShoppingListUsecase>(GetShoppingListUsecase(locator()));
  locator.registerSingleton<AddToShoppingListUsecase>(AddToShoppingListUsecase(locator()));
  locator.registerSingleton<RemoveFromShoppingListUsecase>(RemoveFromShoppingListUsecase(locator()));
  locator.registerSingleton<TransferToIngredientsUsecase>(TransferToIngredientsUsecase(locator(), locator()));
}