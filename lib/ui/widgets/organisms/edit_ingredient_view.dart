import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pantrythief/core/enum/ingredient_unit.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/ui/widgets/atoms/pt_button.dart';
import 'package:pantrythief/ui/widgets/atoms/text_large.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class EditIngredientView extends HookWidget {
  final IngredientEntity initState;
  final Function(IngredientEntity) save;

  const EditIngredientView({
    super.key,
    required this.initState,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    final ingredient = useState<IngredientEntity>(initState);
    final amountController = useTextEditingController(text: ingredient.value.amount.toString());

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(14.0, 20.0, 14.0, 0.0),
      child: Column(
        children: [
          TextLarge(ingredient.value.name),
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
          // TextLarge(ingredient.units.name),
          DropdownButton<IngredientUnit>(
            borderRadius: BorderRadius.circular(4.0),
            menuMaxHeight: MediaQuery.of(context).size.height * 0.35,
            value: ingredient.value.units,
            items: IngredientUnit.values.map((i) => DropdownMenuItem<IngredientUnit>(
              value: i,
              child: TextSmall(i.name),
            )).toList(),
            onChanged: (IngredientUnit? u) {
              ingredient.value = IngredientEntity(
                name: ingredient.value.name,
                amount: (ingredient.value.amount * ingredient.value.units.to(u!)).floor(),
                units: u,
              );
              amountController.text = ingredient.value.amount.toString();
            },
            isExpanded: true,
            hint: const TextSmall('Select unit'),
          ),
          const SizedBox(height: 25.0),
          PTButton(
            text: 'update',
            onTap: () {
              save(IngredientEntity(
                name: ingredient.value.name,
                amount: int.parse(amountController.text),
                units: ingredient.value.units,
              ));

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}