import 'package:pantrythief/domain/entities/ingredient_entity.dart';

class IngredientModel extends IngredientEntity {
  IngredientModel({
    required super.name,
    required super.amount,
    required super.units,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> map) {
    return IngredientModel(
      name: map['name'],
      amount: map['amount'],
      units: map['units'],
    );
  }
}