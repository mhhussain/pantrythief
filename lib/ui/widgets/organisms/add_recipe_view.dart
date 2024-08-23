import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/pt_button.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/organisms/edit_ingredient_view.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredients_list.dart';

class AddRecipeView extends HookWidget {
  final List<IngredientEntity> ingredientsList;
  final Function(RecipeEntity) save;

  const AddRecipeView({
    super.key,
    required this.ingredientsList,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final instructionsController = useTextEditingController();
    final selectedIngredient = useState<IngredientEntity>(ingredientsList[0]);

    final recipe = useState<RecipeEntity>(RecipeEntity(
      name: nameController.text,
      ingredients: [],
      instructions: instructionsController.text
    ));

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextSmall('add recipe >'),
          const SizedBox(height: 20.0),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight
                ),
              ),
              labelText: 'name',
              labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
              fillColor: Colors.white
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            controller: instructionsController,
            minLines: 3,
            maxLines: 3,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight
                ),
              ),
              labelText: 'instructions',
              labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
              fillColor: Colors.white
            ),
          ),
          const SizedBox(height: 20.0),
          const TextSmall('ingredients list'),
          DropdownButton<IngredientEntity>(
            borderRadius: BorderRadius.circular(4.0),
            menuMaxHeight: MediaQuery.of(context).size.height * 0.35,
            value: selectedIngredient.value,
            items: ingredientsList.map((i) => DropdownMenuItem<IngredientEntity>(
              value: i,
              child: TextSmall(i.name),
            )).toList(),
            onChanged: (IngredientEntity? i) {
              recipe.value = RecipeEntity(
                name: recipe.value.name,
                ingredients: [...recipe.value.ingredients, i!],
                instructions: recipe.value.instructions
              );
            },
            isExpanded: true,
            hint: const TextSmall('Select unit'),
          ),
          const SizedBox(height: 20.0),
          IngredientsList(
            ingredients: recipe.value.ingredients.toList(),
            onTap: (IngredientEntity s) {
              showModalBottomSheet(
                context: context,
                builder: (context) => EditIngredientView(
                  ingredient: s,
                  save: (IngredientEntity s1) {
                    recipe.value = RecipeEntity(
                      name: recipe.value.name,
                      ingredients: [...recipe.value.ingredients.where((s2) => s2.name != s1.name), s1],
                      instructions: recipe.value.instructions
                    );
                  },
                ),
              );
            },
            onDelete: (IngredientEntity s) {
              recipe.value = RecipeEntity(
                name: recipe.value.name,
                ingredients: [...recipe.value.ingredients.where((s1) => s1.name != s.name)],
                instructions: recipe.value.instructions
              );
            },
          ),
          const SizedBox(height: 20.0),
          PTButton(
            text: 'add',
            onTap: () {
              save(RecipeEntity(
                name: nameController.text,
                ingredients: recipe.value.ingredients,
                instructions: instructionsController.text)
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}