import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/core/models/ingredient.dart' as model;
import 'package:pantrythief/ui/widgets/atoms/add_circle_button.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredient.dart';
import 'package:pantrythief/ui/widgets/organisms/ingredients_list.dart';
import 'package:pantrythief/ui/widgets/shared/bottom_app_bar.dart';

class IngredientsView extends StatefulWidget {
  const IngredientsView({super.key});

  @override
  State<IngredientsView> createState() => _IngredientsViewState();
}

class _IngredientsViewState extends State<IngredientsView> {
  IList<model.Ingredient> ingredients = IList<model.Ingredient>.from([const model.Ingredient(name: 'Milk', amount: '1', unit: 'gallon')]);

  @override
  void initState() {
    // retrieve ingredients list from shared_preferences
    ingredients = ingredients.appendElement(const model.Ingredient(name: 'Salt', amount: '10', unit: 'grams'));

    super.initState();
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
                  IngredientsList(ingredients: ingredients),
                  AddCircleButton(
                    onTap: () {print('TODO:implement');},
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