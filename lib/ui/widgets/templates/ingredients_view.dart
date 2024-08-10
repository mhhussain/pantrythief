import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/ui/widgets/molecules/ingredient.dart';
import 'package:pantrythief/ui/widgets/shared/bottom_app_bar.dart';
import 'package:pantrythief/domain/usecases/get_ingredients_use_case.dart';
import 'package:pantrythief/injection_container.dart';
import 'package:pantrythief/ui/view_models/ingredients_view_model.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';

class IngredientsView extends StatefulWidget {
  const IngredientsView({super.key});

  @override
  State<IngredientsView> createState() => _IngredientsViewState();
}

class _IngredientsViewState extends State<IngredientsView> {
  bool isLoading = true;

  IngredientsViewModel model = IngredientsViewModel(ingredients: []);
  GetIngredientsUseCase _getIngredientsUseCase = locator<GetIngredientsUseCase>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final ingredients = await _getIngredientsUseCase();
    setState(() {
      model = IngredientsViewModel(ingredients: ingredients.data!);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle('Ingredients'),
      ),
      body: Center(
        child: Column(
          children: [
            ...model.ingredients.map((i) => Ingredient(
              ingredient: i,
              onDelete: (s) {
              }
            )),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(current: 0,),
    );
  }
}