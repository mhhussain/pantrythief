import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/ui/widgets/atoms/add_circle_button.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/molecules/add_ingredient_dialog.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredient.dart';
import 'package:pantrythief/ui/widgets/organisms/ingredients_list.dart';
import 'package:pantrythief/ui/widgets/shared/bottom_app_bar.dart';

class IngredientsView extends StatefulWidget {
  const IngredientsView({super.key});

  @override
  State<IngredientsView> createState() => _IngredientsViewState();
}

class _IngredientsViewState extends State<IngredientsView> {
  IList<IngredientModel> ingredients = IList<IngredientModel>.from([IngredientModel(name: 'Milk', amount: 1, units: 'gallon')]);

  @override
  void initState() {
    // retrieve ingredients list from shared_preferences
    ingredients = ingredients.appendElement(IngredientModel(name: 'Salt', amount: 3, units: 'grams'));

    super.initState();
  }

  void addIngredient(String name, int amount, String unit) {
    final newIngredient  = IngredientModel(
      name: name,
      amount: amount,
      units: unit
    );

    setState(() {
      ingredients = ingredients.appendElement(newIngredient);
    });
  }

  void removeIngredient(String name) {
    setState(() {
      ingredients = ingredients.filter((ingredient) => ingredient.name != name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle('Ingredients'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 25.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 25.0,),
                  TextField(decoration: InputDecoration(hintText: 'name'),),
                  AddCircleButton(
                    onTap: () {}
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(current: 0,),
    );
  }
}