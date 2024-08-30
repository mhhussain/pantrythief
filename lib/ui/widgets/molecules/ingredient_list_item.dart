import 'package:flutter/material.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class IngredientListItem extends StatelessWidget {
  final IngredientEntity ingredient;
  final IngredientEntity? compare1;
  final IngredientEntity? compare2;
  final Function(IngredientEntity)? onTap;
  final Function(IngredientEntity)? onDelete;
  final Function(IngredientEntity)? onTransfer;
  
  const IngredientListItem({
    super.key,
    required this.ingredient,
    this.compare1,
    this.compare2,
    this.onTap,
    this.onDelete,
    this.onTransfer,
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
            TextSmall(
              '${ingredient.amountFormatted} ${ingredient.units.name}${compare1 == null ? '' : ' (${(compare1!.amount * compare1!.units.to(ingredient.units))} ${ingredient.units.name})'}'
            ),
            const SizedBox(width: 10.0),
            onTransfer != null ?
              GestureDetector(
                onTap: () => onTransfer!(ingredient),
                child: const Icon(Icons.upload_outlined)
              ) :
              const SizedBox(),
            const SizedBox(width: 10.0),
            GestureDetector(
              onTap: () => onDelete!(ingredient),
              child: const Icon(Icons.remove_circle_outline),
            )
          ],
        )
      ),
    );
  }
}