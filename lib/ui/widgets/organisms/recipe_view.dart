import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/text_large.dart';
import 'package:pantrythief/ui/widgets/atoms/text_medium.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/organisms/ingredients_list.dart';

class RecipeView extends HookWidget {
  final RecipeEntity initState;
  final Function(RecipeEntity) save;

  const RecipeView({
    super.key,
    required this.initState,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    final recipe = useState<RecipeEntity>(initState);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextSmall('recipes >'),
          const SizedBox(height: 20.0),
          TextLarge(recipe.value.name),
          IngredientsList(
            ingredients: recipe.value.ingredients.toList(),
            onDelete: (s) {
              final newState = RecipeEntity(
                name: recipe.value.name,
                ingredients: recipe.value.ingredients.where((r) => r.name != s.name).toList(),
                instructions: recipe.value.instructions
              );

              save(newState);
              recipe.value = newState;
            },
          ),
          const SizedBox(height: 30.0),
          const TextMedium('instructions'),
          const SizedBox(height: 10.0),
          TextSmall(recipe.value.instructions),
        ],
      )
    );
  }
}