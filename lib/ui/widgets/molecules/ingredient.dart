import 'package:flutter/material.dart';
import 'package:pantrythief/core/models/ingredient.dart' as model;
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';

class Ingredient extends StatelessWidget {
  final model.Ingredient ingredient;
  
  const Ingredient({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2.0, 0, 2.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextTitle(ingredient.name),
            TextSmall('${ingredient.amount} ${ingredient.unit}'),
            Icon(
              Icons.delete,
              color: Theme.of(context).primaryColor,
            )
          ],
        )
      ),
    );
  }
}