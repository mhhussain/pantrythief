import 'package:flutter/material.dart';
import 'package:pantrythief/ui/widgets/templates/ingredients_view.dart';
import 'package:pantrythief/ui/widgets/templates/recipes_view.dart';
import 'package:pantrythief/ui/pages/shopping_list_view.dart';

class BottomAppBar extends StatelessWidget {
  final int current;

  const BottomAppBar({
    super.key,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int i) {
        if (i == current) return;

        switch (i) {
          case 0:
            Navigator.of(context).push(
              PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const IngredientsView())
            );
          case 1:
            Navigator.of(context).push(
              PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const RecipesView())
            );
          case 2:
            Navigator.of(context).push(
              PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const ShoppingListView())
            );
        }
      },
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.food_bank, color: Theme.of(context).iconTheme.color),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.list_alt, color: Theme.of(context).iconTheme.color),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.shopping_cart, color: Theme.of(context).iconTheme.color),
        )
      ]
    );
  }
}