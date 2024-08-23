import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/pt_button.dart';
import 'package:pantrythief/ui/widgets/atoms/text_large.dart';
import 'package:pantrythief/ui/widgets/atoms/text_medium.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/toggle_textfield.dart';
import 'package:pantrythief/ui/widgets/organisms/edit_ingredient_view.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredients_list.dart';

class RecipeView extends HookWidget {
  final RecipeEntity initState;
  final List<IngredientEntity> ingredientsList;
  final Function(RecipeEntity) save;
  final Function(RecipeEntity) delete;

  const RecipeView({
    super.key,
    required this.initState,
    required this.ingredientsList,
    required this.save,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    final recipe = useState<RecipeEntity>(initState);
    final selectedIngredient = useState<IngredientEntity>(ingredientsList[0]);
    final instructionsController = useTextEditingController(text: initState.instructions);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextSmall('recipes >'),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextLarge(recipe.value.name),
              TextLarge('${ingredientsList.length} (${0} with cart)'),
            ],
          ),
          IngredientsList(
            ingredients: recipe.value.ingredients.toList(),
            onTap: (IngredientEntity s) {
              showModalBottomSheet(
                context: context,
                builder: (context) => EditIngredientView(
                  ingredient: s,
                  // save: (IngredientEntity s) => _updateIngredient(s),
                  save: (IngredientEntity s) {
                    final newState = RecipeEntity(
                      name: recipe.value.name,
                      ingredients: [...recipe.value.ingredients.where((i) => i.name != s.name), s],
                      instructions: recipe.value.instructions,
                    );

                    recipe.value = newState;
                  },
                )
              );
            },
            onDelete: (s) {
              final newState = RecipeEntity(
                name: recipe.value.name,
                ingredients: recipe.value.ingredients.where((r) => r.name != s.name).toList(),
                instructions: recipe.value.instructions
              );
              recipe.value = newState;
            },
          ),
          const SizedBox(height: 20.0),
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
          const SizedBox(height: 30.0),
          // const TextMedium('instructions'),
          // const SizedBox(height: 10.0),
          // TextSmall(recipe.value.instructions),
          ToggleTextField(
            textController: instructionsController,
            onEdit: (String instructions) {
              recipe.value = RecipeEntity(
                name: recipe.value.name,
                ingredients: recipe.value.ingredients,
                instructions: instructions,
              );
            }
          ),
          const SizedBox(height: 20.0),
          recipe.value != initState ?
            PTButton(
              text: 'save',
              onTap: () {
                save(recipe.value);
                Navigator.of(context).pop();
              }
            ) : const SizedBox(),
          const SizedBox(height: 10.0),
          PTButton(
            text: 'delete',
            onTap: () {
              delete(recipe.value);
              Navigator.of(context).pop();
            }
          ),
        ],
      )
    );
  }
}