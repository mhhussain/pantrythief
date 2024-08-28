import 'package:flutter/material.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class RecipeListItem extends StatelessWidget {
  final RecipeEntity recipe;
  final List<IngredientEntity> ingredients;
  final List<IngredientEntity> shoppinglist;
  final Function(RecipeEntity) onClick;

  const RecipeListItem({
    super.key,
    required this.recipe,
    required this.ingredients,
    required this.shoppinglist,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onClick(recipe),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextSmall(recipe.name),
            TextSmall('${recipe.reduce(ingredients)}x'),
          ],
        )
      ),
    );
  }
}