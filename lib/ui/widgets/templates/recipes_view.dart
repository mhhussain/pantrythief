import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/core/enum/ingredient_unit.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/domain/usecases/recipe/add_recipe_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/get_recipes_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/update_recipe_usecase.dart';
import 'package:pantrythief/injection_container.dart';
import 'package:pantrythief/ui/view_models/recipes_view_model.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/molecules/recipe_list_item.dart';
import 'package:pantrythief/ui/widgets/organisms/bottom_app_bar.dart';
import 'package:pantrythief/ui/widgets/organisms/recipe_view.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  bool isLoading = true;
  
  RecipesViewModel model = RecipesViewModel(recipes: []);
  final GetRecipesUseCase _getRecipesUseCase = locator<GetRecipesUseCase>();
  final AddRecipeUseCase _addRecipeUseCase = locator<AddRecipeUseCase>();
  final UpdateRecipeUseCase _updateRecipeUseCase = locator<UpdateRecipeUseCase>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final recipes = await _getRecipesUseCase();
    setState(() {
      model = RecipesViewModel(recipes: recipes.data!);
      isLoading = false;
    });
  }

  Future<void> _addRecipe() async {
    setState(() {
      isLoading = true;
    });

    await _addRecipeUseCase(params: const RecipeEntity(
      name: 'Butter Chicken',
      ingredients: [
        IngredientEntity(name: 'Butter', amount: 3, units: IngredientUnit.gram),
        IngredientEntity(name: 'Chicken', amount: 2, units: IngredientUnit.pound),
      ],
      instructions: 'Cook it!'
    ));
    final updatedRecipes = await _getRecipesUseCase();

    setState(() {
      model = RecipesViewModel(recipes: updatedRecipes.data!);
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
      model = RecipesViewModel(recipes: updatedRecipes.data!);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        title: const TextTitle('recipes'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 50.0, 14.0, 0.0),
          child: Column(
            children: [
              ...model.recipes.map((r) => RecipeListItem(
                recipe: r,
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
                        save: (RecipeEntity s) {
                          _saveRecipe(s);
                        }
                      ),
                    )
                  );
                }
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
        // onPressed: () => showDialog(
        //   context: context,
        //   builder: (context) => Text('tbd')
        // ),
        onPressed: () { _addRecipe(); }
      ),
      bottomNavigationBar: const BottomAppBar(current: 1,),
    );
  }
}