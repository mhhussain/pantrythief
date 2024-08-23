import 'package:flutter/material.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredient_list_item.dart';

class IngredientsList extends StatelessWidget {
  final List<IngredientEntity> ingredients;
  final Function(IngredientEntity) onTap;
  final Function(IngredientEntity) onDelete;

  const IngredientsList({
    super.key,
    required this.onTap,
    required this.ingredients,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients.map((i) => IngredientListItem(
        ingredient: i,
        onTap: onTap,
        onDelete: onDelete,
      )).toList(),
    );
  }
}