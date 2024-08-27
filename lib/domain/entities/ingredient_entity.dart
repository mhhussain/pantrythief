import 'package:equatable/equatable.dart';
import 'package:pantrythief/core/enum/ingredient_unit.dart';

class IngredientEntity extends Equatable {
  final String name;
  final double amount;
  final IngredientUnit units;

  const IngredientEntity({
    required this.name,
    required this.amount,
    required this.units,
  });

  double get amountFormatted { return double.parse(amount.toStringAsPrecision(3)); }


  IngredientEntity operator +(IngredientEntity ingredient) {
    if (name != ingredient.name) throw 'mismatched ingredient name';
    return IngredientEntity(
      name: name,
      amount: (amount + (units == ingredient.units ? ingredient.amount : ingredient.to(units).amount)).clamp(0, double.nan),
      units: units
    );
  }

  IngredientEntity operator -(IngredientEntity ingredient) {
    if (name != ingredient.name) throw 'mismatched ingredient name';
    return IngredientEntity(
      name: name,
      amount: (amount - (units == ingredient.units ? ingredient.amount : ingredient.to(units).amount)).clamp(0, double.nan),
      units: units
    );
  }

  IngredientEntity to(IngredientUnit newUnit) {
    return IngredientEntity(
      name: name,
      amount: (amount * units.to(newUnit)),
      units: newUnit,
    );
  }

  IngredientEntity reduce(List<IngredientEntity> ingredients) {
    final i = ingredients.where((i1) => name == i1.name).firstOrNull ?? IngredientEntity(name: name, amount: 0.0, units: units);
    return IngredientEntity(
      name: name,
      amount: ((i.amount * i.units.to(units)) - amount),
      units: units
    );
  }

  IngredientEntity check(List<IngredientEntity> ingredients) {
    return reduce(ingredients);
  }

  @override
  List<Object?> get props => [
    name,
    amount,
    units,
  ];
}