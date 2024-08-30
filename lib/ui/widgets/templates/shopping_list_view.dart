import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';
import 'package:pantrythief/domain/usecases/shopping_list/add_to_shopping_list_usecase.dart';
import 'package:pantrythief/domain/usecases/shopping_list/get_shopping_list_usecase.dart';
import 'package:pantrythief/domain/usecases/shopping_list/remove_from_shopping_list_usecase.dart';
import 'package:pantrythief/domain/usecases/shopping_list/transfer_to_ingredients_usecase.dart';
import 'package:pantrythief/injection_container.dart';
import 'package:pantrythief/ui/view_models/shopping_list_view_model.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/molecules/ingredients_list.dart';
import 'package:pantrythief/ui/widgets/organisms/add_ingredient_view.dart';
import 'package:pantrythief/ui/widgets/organisms/bottom_app_bar.dart';

class ShoppingListView extends StatefulWidget {
  const ShoppingListView({super.key});

  @override
  State<ShoppingListView> createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  bool isLoading = true;

  ShoppingListViewModel model = ShoppingListViewModel(shoppinglist: []);
  GetShoppingListUsecase _getShoppingListUsecase = locator<GetShoppingListUsecase>();
  AddToShoppingListUsecase _addToShoppingListUsecase = locator<AddToShoppingListUsecase>();
  RemoveFromShoppingListUsecase _removeFromShoppingListUsecase = locator<RemoveFromShoppingListUsecase>();
  TransferToIngredientsUsecase _transferToIngredientsUsecase = locator<TransferToIngredientsUsecase>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final shoppinglist = await _getShoppingListUsecase();
    
    if (shoppinglist is DataSuccess) {
      setState(() {
        model = ShoppingListViewModel(shoppinglist: shoppinglist.data!);
        isLoading = false;
      });
    }
  }

  Future<void> _addToShoppingList(IngredientEntity ingredient) async {
    setState(() {
      isLoading = true;
    });

    await _addToShoppingListUsecase(params: ingredient);
    final updatedShoppingList = await _getShoppingListUsecase();

    setState(() {
      model = ShoppingListViewModel(shoppinglist: updatedShoppingList.data!);
      isLoading = false;
    });
  }

  Future<void> _removeFromShoppingList(IngredientEntity ingredient) async {
    setState(() {
      isLoading = true;
    });

    await _removeFromShoppingListUsecase(params: ingredient);
    final updatedShoppingList = await _getShoppingListUsecase();

    setState(() {
      model = ShoppingListViewModel(shoppinglist: updatedShoppingList.data!);
      isLoading = false;
    });
  }

  Future<void> _transferToIngredients(IngredientEntity ingredient) async {
    setState(() {
      isLoading = true;
    });

    await _transferToIngredientsUsecase(params: ingredient);
    final updatedShoppingList = await _getShoppingListUsecase();

    setState(() {
      model = ShoppingListViewModel(shoppinglist: updatedShoppingList.data!);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 0,
        centerTitle: false,
        title: const TextTitle('shopping list'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 50.0, 14.0, 0.0),
          child: IngredientsList(
            ingredients: model.shoppinglist,
            onTap: (IngredientEntity i) { /* NO EDIT FUNCTION */},
            onDelete: (IngredientEntity i) {
              _removeFromShoppingList(i);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: TextSmall('deleted'),
                backgroundColor: Colors.red,
              ));
            },
            onTransfer: (IngredientEntity i) {
              _transferToIngredients(i);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: TextSmall('transfered'),
                backgroundColor: Colors.green,
              ));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'add',
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddIngredientView(
              onAdd: (IngredientEntity i) => _addToShoppingList(i),
            ),
          ),
        },
      ),
      bottomNavigationBar: const BottomAppBar(current: 2,),
    );
  }
}