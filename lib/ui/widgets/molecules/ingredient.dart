import 'package:flutter/material.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';

class Ingredient extends StatelessWidget {
  final IngredientEntity ingredient;
  final Function(IngredientEntity) onDelete;
  
  const Ingredient({
    super.key,
    required this.ingredient,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2.0, 0, 2.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: [
            BoxShadow(
              // color: Colors.grey.withOpacity(0.5),
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(3, 3)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextTitle(ingredient.name),
            TextSmall('${ingredient.amount} ${ingredient.units.name}'),
            GestureDetector(
              onTap: () => onDelete(ingredient),
              child: Icon(
                Icons.delete,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        )
      ),
    );
  }
}