import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pantrythief/core/enum/ingredient_unit.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/pt_button.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class AddIngredientDialog extends HookWidget {
  final Function(IngredientEntity) onAdd;

  const AddIngredientDialog({
    super.key,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final amountController = useTextEditingController();
    // final TextEditingController unitController = useTextEditingController();
    final selectedUnit = useState<IngredientUnit>(IngredientUnit.unknown);

    return Padding(
      padding: const EdgeInsets.fromLTRB(50.0, 150.0, 50.0, 150.0),
      child: Material(
        child: Container(
          padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Add new ingredient'),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  labelText: 'name',
                  hintText: 'name',
                  fillColor: Colors.grey
                ),
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  labelText: 'amount',
                  hintText: 'amount',
                  fillColor: Colors.grey
                ),
              ),
              DropdownButton<IngredientUnit>(
                borderRadius: BorderRadius.circular(4.0),
                dropdownColor: Colors.redAccent,
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
              // TextField(
              //   controller: unitController,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     enabledBorder: OutlineInputBorder(),
              //     labelText: 'unit',
              //     hintText: 'unit',
              //     fillColor: Colors.grey
              //   ),
              // ),
              PTButton(
                text: 'Add',
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
        ),
      ),
    );
  }
}