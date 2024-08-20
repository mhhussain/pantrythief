import 'package:pantrythief/core/enum/ingredient_unit.dart';
import 'package:pantrythief/data/models/ingredient_model.dart';

class DummyIngredientsData {
  Future<List<IngredientModel>> getIngredients() async {
    return [
      IngredientModel(
        name: 'Chicken',
        amount: 1,
        units: IngredientUnit.pound,
      ),
      IngredientModel(
        name: 'Gosht',
        amount: 1,
        units: IngredientUnit.pound,
      ),
      IngredientModel(
        name: 'Salt',
        amount: 999,
        units: IngredientUnit.teaspoon,
      ),
      IngredientModel(
        name: 'Garam Masala',
        amount: 50,
        units: IngredientUnit.teaspoon,
      ),
      IngredientModel(
        name: 'Milk',
        amount: 1,
        units: IngredientUnit.gallon,
      ),
      IngredientModel(
        name: 'Cream',
        amount: 4,
        units: IngredientUnit.cup,
      ),
      IngredientModel(
        name: 'Rice',
        amount: 2000,
        units: IngredientUnit.gram,
      ),
      IngredientModel(
        name: 'Tomato Paste',
        amount: 300,
        units: IngredientUnit.gram,
      ),
    ];
  }
}