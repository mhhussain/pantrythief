import 'package:flutter/material.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredient_list_item.dart';

class IngredientsList extends StatelessWidget {
  final List<IngredientEntity> ingredients;
  final Function(IngredientEntity)? onTap;
  final Function(IngredientEntity)? onDelete;
  final Function(IngredientEntity)? onTransfer;

  const IngredientsList({
    super.key,
    required this.ingredients,
    this.onTap,
    this.onDelete,
    this.onTransfer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients.map((i) => IngredientListItem(
        ingredient: i,
        onTap: onTap,
        onDelete: onDelete,
        onTransfer: onTransfer,
      )).toList(),
    );
  }
}