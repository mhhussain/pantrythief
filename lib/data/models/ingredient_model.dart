import 'package:pantrythief/domain/entities/ingredient.dart';

class IngredientModel extends IngredientEntity {
  const IngredientModel({
    required super.name,
    required super.amount,
    required super.unit,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) => IngredientModel(
    name: json['name'],
    amount: json['amount'],
    unit: json['unit'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'amount': amount,
    'unit': unit
  };
}