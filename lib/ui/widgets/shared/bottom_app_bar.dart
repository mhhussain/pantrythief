import 'package:flutter/material.dart';
import 'package:pantrythief/ui/screens/ingredients_view.dart';
import 'package:pantrythief/ui/screens/recipes_view.dart';
import 'package:pantrythief/ui/screens/shopping_list_view.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';

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
      items: const [
        BottomNavigationBarItem(
          label: '',
          icon: TextTitle('I')
        ),
        BottomNavigationBarItem(
          label: '',
          icon: TextTitle('R')
        ),
        BottomNavigationBarItem(
          label: '',
          icon: TextTitle('S')
        )
      ]
    );
  }
}