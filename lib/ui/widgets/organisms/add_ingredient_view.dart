import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pantrythief/core/enum/ingredient_unit.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/pt_button.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class AddIngredientView extends HookWidget {
  final Function(IngredientEntity) onAdd;

  const AddIngredientView({
    super.key,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final amountController = useTextEditingController();
    // final TextEditingController unitController = useTextEditingController();
    final selectedUnit = useState<IngredientUnit>(IngredientUnit.unknown);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('add new ingredient'),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight
                ),
              ),
              labelText: 'name',
              labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
              fillColor: Colors.white
            ),
          ),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(),
            controller: amountController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight
                ),
              ),
              labelText: 'amount',
              labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
              fillColor: Colors.white
            ),
          ),
          DropdownButton<IngredientUnit>(
            borderRadius: BorderRadius.circular(4.0),
            menuMaxHeight: MediaQuery.of(context).size.height * 0.35,
            value: selectedUnit.value,
            items: IngredientUnit.values.map((u) => DropdownMenuItem<IngredientUnit>(
              value: u,
              child: TextSmall(u.name),
            )).toList(),
            onChanged: (IngredientUnit? u) {
              if (u != null) {
                selectedUnit.value = u;
              }
            },
            isExpanded: true,
            hint: const TextSmall('Select unit'),
          ),
          PTButton(
            text: 'add',
            onTap: () {
              final ingredient = IngredientEntity(
                name: nameController.text,
                amount: int.parse(amountController.text),
                units: selectedUnit.value,
              );
              onAdd(ingredient);
              Navigator.of(context).pop();
            }
          ),
        ],
      ),
    );
  }
}