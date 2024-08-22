import 'package:flutter/material.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class IngredientListItem extends StatelessWidget {
  final IngredientEntity ingredient;
  final Function(IngredientEntity) onDelete;
  
  const IngredientListItem({
    super.key,
    required this.ingredient,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2.0, 0, 2.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              )
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextSmall(ingredient.name),
              TextSmall('${ingredient.amount} ${ingredient.units.name}'),
              GestureDetector(
                onTap: () => onDelete(ingredient),
                child: const Icon(Icons.delete),
              )
            ],
          )
        ),
      ),
    );
  }
}