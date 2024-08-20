import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/core/enum/ingredient_unit.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/domain/usecases/recipe/add_recipe_usecase.dart';
import 'package:pantrythief/domain/usecases/recipe/get_recipes_usecase.dart';
import 'package:pantrythief/injection_container.dart';
import 'package:pantrythief/ui/view_models/recipes_view_model.dart';
import 'package:pantrythief/ui/widgets/atoms/add_circle_button.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/organisms/bottom_app_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle('Recipes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...model.recipes.map((r) {
              return Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.15),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(4.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextSmall(r.name),
                    Column(
                      children: [
                        ...r.ingredients.map((i) => Row(
                          children: [
                            TextSmall('${i.name} - ${i.amount} ${i.units.name}'),
                          ],
                        ))
                      ],
                    ),
                    Icon(
                      Icons.delete,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                )
              );
            }),
            AddCircleButton(
              onTap: () {
                _addRecipe();
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(current: 1,),
    );
  }
}