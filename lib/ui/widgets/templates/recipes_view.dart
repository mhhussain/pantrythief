import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/domain/usecases/ingredient/get_ingredients_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/add_recipe_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/get_recipes_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/remove_recipe_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/update_recipe_usecase.dart';
import 'package:pantrythief/domain/usecases/shopping_list/get_shopping_list_usecase.dart';
import 'package:pantrythief/injection_container.dart';
import 'package:pantrythief/ui/view_models/recipes_view_model.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/molecules/recipe_list_item.dart';
import 'package:pantrythief/ui/widgets/templates/add_recipe_view.dart';
import 'package:pantrythief/ui/widgets/organisms/bottom_app_bar.dart';
import 'package:pantrythief/ui/widgets/templates/recipe_view.dart';
import 'package:collection/collection.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  bool isLoading = true;
  
  RecipesViewModel model = RecipesViewModel(recipes: [], ingredients: [], shoppinglist: []);
  final GetRecipesUseCase _getRecipesUseCase = locator<GetRecipesUseCase>();
  final AddRecipeUseCase _addRecipeUseCase = locator<AddRecipeUseCase>();
  final UpdateRecipeUseCase _updateRecipeUseCase = locator<UpdateRecipeUseCase>();
  final RemoveRecipeUseCase _removeRecipeUseCase = locator<RemoveRecipeUseCase>();

  final GetIngredientsUseCase _getIngredientsUseCase = locator<GetIngredientsUseCase>();
  final GetShoppingListUsecase _getShoppingListUsecase = locator<GetShoppingListUsecase>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final recipes = await _getRecipesUseCase();
    final ingredients = await _getIngredientsUseCase();
    final shoppinglist = await _getShoppingListUsecase();

    setState(() {
      model = RecipesViewModel(
        recipes: recipes.data!,
        ingredients: ingredients.data!,
        shoppinglist: shoppinglist.data!,
      );
      isLoading = false;
    });
  }

  Future<void> _addRecipe(RecipeEntity recipe) async {
    setState(() {
      isLoading = true;
    });

    await _addRecipeUseCase(params: recipe);
    final updatedRecipes = await _getRecipesUseCase();

    setState(() {
      model = RecipesViewModel(
        recipes: updatedRecipes.data!,
        ingredients: model.ingredients,
        shoppinglist: model.shoppinglist,
      );
      isLoading = false;
    });
  }

  Future<void> _saveRecipe(RecipeEntity recipe) async {
    setState(() {
      isLoading = true;
    });

    // save recipe
    await _updateRecipeUseCase(params: recipe);
    final updatedRecipes = await _getRecipesUseCase();

    setState(() {
      model = RecipesViewModel(
        recipes: updatedRecipes.data!,
        ingredients: model.ingredients,
        shoppinglist: model.shoppinglist,
      );
      isLoading = false;
    });
  }

  Future<void> _removeRecipe(RecipeEntity recipe) async {
    setState(() {
      isLoading = true;
    });

    // save recipe
    await _removeRecipeUseCase(params: recipe);
    final updatedRecipes = await _getRecipesUseCase();

    setState(() {
      model = RecipesViewModel(
        recipes: updatedRecipes.data!,
        ingredients: model.ingredients,
        shoppinglist: model.shoppinglist,
      );
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 0,
        centerTitle: false,
        title: const TextTitle('recipes'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 50.0, 14.0, 0.0),
          child: Column(
            children: [
              ...model.recipes.sorted((a, b) => a.name.compareTo(b.name)).map((r) => RecipeListItem(
                recipe: r,
                ingredients: model.ingredients,
                shoppinglist: model.shoppinglist,
                onClick: (RecipeEntity i) {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => DraggableScrollableSheet(
                      initialChildSize: 0.85,
                      minChildSize: 0.85,
                      maxChildSize: 0.85,
                      expand: false,
                      builder: (context, scrollController) => RecipeView(
                        initState: i,
                        ingredientsList: model.ingredients,
                        save: (RecipeEntity s) {
                          _saveRecipe(s);
                        },
                        delete: (RecipeEntity s) {
                          _removeRecipe(s);
                        },
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.85,
              minChildSize: 0.85,
              maxChildSize: 0.85,
              expand: false,
              builder: (context, scrollController) => AddRecipeView(
                ingredientsList: model.ingredients,
                save: (RecipeEntity s) => _addRecipe(s),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomAppBar(current: 1,),
    );
  }
}