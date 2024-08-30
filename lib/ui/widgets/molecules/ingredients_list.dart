import 'package:flutter/material.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredient_list_item.dart';
import 'package:collection/collection.dart';

class IngredientsList extends StatelessWidget {
  final List<IngredientEntity> ingredients;
  final List<IngredientEntity>? compareList1;
  final List<IngredientEntity>? compareList2;
  final Function(IngredientEntity)? onTap;
  final Function(IngredientEntity)? onDelete;
  final Function(IngredientEntity)? onTransfer;

  const IngredientsList({
    super.key,
    required this.ingredients,
    this.compareList1,
    this.compareList2,
    this.onTap,
    this.onDelete,
    this.onTransfer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients.sorted((a, b) => a.name.compareTo(b.name)).map((i) => IngredientListItem(
        ingredient: i,
        onTap: onTap,
        onDelete: onDelete,
        onTransfer: onTransfer,
      )).toList(),
    );
  }
}