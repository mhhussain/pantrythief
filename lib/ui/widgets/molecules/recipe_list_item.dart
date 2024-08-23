import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/entities/recipes_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class RecipeListItem extends StatelessWidget {
  final RecipeEntity recipe;
  final List<IngredientEntity>? ingredients;
  final Function(RecipeEntity) onClick;

  const RecipeListItem({
    super.key,
    required this.recipe,
    this.ingredients,
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
            TextSmall('1'),
          ],
        )
      ),
    );
  }
}