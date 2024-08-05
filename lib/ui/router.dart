import 'package:flutter/material.dart';
import 'package:pantrythief/ui/screens/ingredients_view.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/ingredients':
        return MaterialPageRoute(builder: (_) => const IngredientsView());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: TextSmall('No route defined for ${settings.name}')),
        ));
    }
  }
}