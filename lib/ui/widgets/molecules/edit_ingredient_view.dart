import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/pt_button.dart';
import 'package:pantrythief/ui/widgets/atoms/text_large.dart';

class EditIngredientView extends HookWidget {
  final IngredientEntity ingredient;
  final Function(IngredientEntity) save;

  const EditIngredientView({
    super.key,
    required this.ingredient,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController(text: ingredient.amount.toString());
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(14.0, 20.0, 14.0, 0.0),
      child: Column(
        children: [
          TextLarge(ingredient.name),
          const SizedBox(height: 25.0,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            child: TextField(
              keyboardType: const TextInputType.numberWithOptions(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 48),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColorLight
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 60.0,
                ),
              ),
              controller: amountController,
            ),
          ),
          TextLarge(ingredient.units.name),
          const SizedBox(height: 25.0),
          PTButton(
            text: 'Save',
            onTap: () {
              save(IngredientEntity(
                name: ingredient.name,
                amount: int.parse(amountController.text),
                units: ingredient.units,
              ));
              
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}