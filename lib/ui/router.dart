import 'package:flutter/material.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/templates/ingredients_view.dart';
import 'package:pantrythief/ui/widgets/templates/recipes_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/ingredients':
        return MaterialPageRoute(builder: (_) => const IngredientsView());
      case '/recipes':
        return MaterialPageRoute(builder: (_) => const RecipesView());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: TextSmall('No route defined for ${settings.name}')),
        ));
    }
  }
}