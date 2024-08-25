import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/core/resources/data_state.dart';
import 'package:pantrythief/domain/usecases/shopping_list/get_shopping_list_usecase.dart';
import 'package:pantrythief/injection_container.dart';
import 'package:pantrythief/ui/view_models/shopping_list_view_model.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
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

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle('Shopping List'),
      ),
      body: const Center(child: TextSmall('data')),
      bottomNavigationBar: const BottomAppBar(current: 2,),
    );
  }
}