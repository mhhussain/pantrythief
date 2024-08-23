import 'package:flutter/material.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class IngredientListItem extends StatelessWidget {
  final IngredientEntity ingredient;
  final Function(IngredientEntity)? onTap;
  final Function(IngredientEntity) onDelete;
  
  const IngredientListItem({
    super.key,
    required this.ingredient,
    this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap!(ingredient),
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
            TextSmall(ingredient.name),
            const Spacer(),
            TextSmall('${ingredient.amount} ${ingredient.units.name}'),
            const SizedBox(width: 10.0),
            GestureDetector(
              onTap: () => onDelete(ingredient),
              child: const Icon(Icons.remove_circle_outline),
            )
          ],
        )
      ),
    );
  }
}