import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/shared/bottom_app_bar.dart';

class ShoppingListView extends StatefulWidget {
  const ShoppingListView({super.key});

  @override
  State<ShoppingListView> createState() => _IngredientsViewState();
}

class _IngredientsViewState extends State<ShoppingListView> {

  @override
  void initState() {
    // retrieve ingredients from shopping list from shared_preferences

    super.initState();
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