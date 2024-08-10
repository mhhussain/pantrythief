import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/data/models/recipe_model.dart';

class DummyIngredientsData {
  Future<List<IngredientModel>> getIngredients() async {
    return [
      IngredientModel(
        name: 'Chicken',
        amount: 1,
        units: 'pound'
      ),
      IngredientModel(
        name: 'Gosht',
        amount: 1,
        units: 'pound'
      ),
      IngredientModel(
        name: 'Salt',
        amount: 999,
        units: 'tbsp'
      ),
      IngredientModel(
        name: 'Garam Masala',
        amount: 50,
        units: 'tea'
      ),
      IngredientModel(
        name: 'Milk',
        amount: 1,
        units: 'gallon'
      ),
      IngredientModel(
        name: 'Cream',
        amount: 4,
        units: 'cups'
      ),
      IngredientModel(
        name: 'Rice',
        amount: 2000,
        units: 'grams'
      ),
      IngredientModel(
        name: 'Tomato Paste',
        amount: 1,
        units: 'can'
      ),
    ];
  }
}