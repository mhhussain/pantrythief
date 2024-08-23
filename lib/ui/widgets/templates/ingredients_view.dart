import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/usecases/ingredient/add_ingredient_usecase.dart';
import 'package:pantrythief/domain/usecases/ingredient/remove_ingredient_usecase.dart';
import 'package:pantrythief/domain/usecases/ingredient/update_ingredient_usecase.dart';
import 'package:pantrythief/ui/widgets/atoms/add_circle_button.dart';
import 'package:pantrythief/ui/widgets/molecules/add_ingredient_view.dart';
import 'package:pantrythief/ui/widgets/molecules/edit_ingredient_view.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredient_list_item.dart';
import 'package:pantrythief/ui/widgets/organisms/bottom_app_bar.dart';
import 'package:pantrythief/domain/usecases/ingredient/get_ingredients_usecase.dart';
import 'package:pantrythief/injection_container.dart';
import 'package:pantrythief/ui/view_models/ingredients_view_model.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/organisms/ingredients_list.dart';

class IngredientsView extends StatefulWidget {
  const IngredientsView({super.key});

  @override
  State<IngredientsView> createState() => _IngredientsViewState();
}

class _IngredientsViewState extends State<IngredientsView> {
  bool isLoading = true;

  IngredientsViewModel model = IngredientsViewModel(ingredients: []);
  GetIngredientsUseCase _getIngredientsUseCase = locator<GetIngredientsUseCase>();
  AddIngredientUseCase _addIngredientUseCase = locator<AddIngredientUseCase>();
  RemoveIngredientUseCase _removeIngredientUseCase = locator<RemoveIngredientUseCase>();
  UpdateIngredientUseCase _updateIngredientUseCase = locator<UpdateIngredientUseCase>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final ingredients = await _getIngredientsUseCase();
    
    if (ingredients is DataSuccess) {
      setState(() {
        model = IngredientsViewModel(ingredients: ingredients.data!);
        isLoading = false;
      });
    }
  }

  Future<void> _addIngredient(IngredientEntity ingredient) async {
    setState(() {
      isLoading = true;
    });

    await _addIngredientUseCase(params: ingredient);
    final updatedIngredients = await _getIngredientsUseCase();

    setState(() {
      model = IngredientsViewModel(ingredients: updatedIngredients.data!);
      isLoading = false;
    });
  }

  Future<void> _updateIngredient(IngredientEntity ingredient) async {
    setState(() {
      isLoading = true;
    });

    await _updateIngredientUseCase(params: ingredient);
    final updatedIngredients = await _getIngredientsUseCase();

    setState(() {
      model = IngredientsViewModel(ingredients: updatedIngredients.data!);
      isLoading = false;
    });
  }

  Future<void> _removeIngredient(IngredientEntity ingredient) async {
    
    await _removeIngredientUseCase(params: ingredient);
    final updatedIngredients = await _getIngredientsUseCase();

    setState(() {
      model = IngredientsViewModel(ingredients: updatedIngredients.data!);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        title: const TextTitle('ingredients'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 50.0, 14.0, 0.0),
          child: IngredientsList(
            ingredients: model.ingredients,
            onTap: (IngredientEntity i) {
              showModalBottomSheet(
                context: context,
                builder: (context) => EditIngredientView(
                  ingredient: i,
                  save: (IngredientEntity s) => _updateIngredient(s),
                )
              );
            },
            onDelete: (IngredientEntity i) {
              _removeIngredient(i);
            },
          ),
          // child: Column(
          //   children: [
          //     ...model.ingredients.map((i) => IngredientListItem(
          //       ingredient: i,
          //       onTap: (IngredientEntity i) {
          //         showModalBottomSheet(
          //           context: context,
          //           builder: (context) => EditIngredientView(
          //             ingredient: i,
          //             save: (IngredientEntity s) => _updateIngredient(s),
          //           )
          //         );
          //       },
          //       onDelete: (IngredientEntity i) {
          //         _removeIngredient(i);
          //       }
          //     )),
          //   ],
          // ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddIngredientView(
              onAdd: (IngredientEntity i) => _addIngredient(i),
            ),
          ),
        },
      ),
      bottomNavigationBar: const BottomAppBar(current: 0,),
    );
  }
}