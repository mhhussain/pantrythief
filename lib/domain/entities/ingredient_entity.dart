import 'package:equatable/equatable.dart';
import 'package:pantrythief/core/enum/ingredient_unit.dart';

class IngredientEntity extends Equatable {
  final String name;
  final int amount;
  // final String units;
  final IngredientUnit units;

  const IngredientEntity({
    required this.name,
    required this.amount,
    required this.units,
  });

  IngredientEntity operator +(covariant IngredientEntity ingredient) {
    return IngredientEntity(name: name, amount: amount, units: units);
  }

  add(IngredientEntity ingredient) {
    if (name != ingredient.name) throw 'mismatched ingredient name';
    return IngredientEntity(name: name, amount: amount + ingredient.amount, units: units);
  }

  @override
  List<Object?> get props => [
    name,
    amount,
    units,
  ];
}