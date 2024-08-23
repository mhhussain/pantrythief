import 'package:units_converter/units_converter.dart';

enum IngredientUnit {
  unknown,
  gallon,
  quart,
  pint,
  cup,
  teaspoon,
  tablespoon,
  ounce,
  gram,
  milligram,
  fluidounce,
  milliliter,
  liter,
  pound;

  static IngredientUnit fromString(String value) {
    switch (value) {
      case 'gallon':
        return IngredientUnit.gallon;
      case 'quart':
        return IngredientUnit.quart;
      case 'pint':
        return IngredientUnit.pint;
      case 'cup':
        return IngredientUnit.cup;
      case 'teaspoon':
        return IngredientUnit.teaspoon;
      case 'tablespoon':
        return IngredientUnit.tablespoon;
      case 'ounce':
        return IngredientUnit.ounce;
      case 'gram':
        return IngredientUnit.gram;
      case 'milligram':
        return IngredientUnit.milligram;
      case 'fluidounce':
        return IngredientUnit.fluidounce;
      case 'milliliter':
        return IngredientUnit.milliliter;
      case 'liter':
        return IngredientUnit.liter;
      case 'pound':
        return IngredientUnit.pound;
      default:
        return IngredientUnit.unknown;
    }
  }

  String get name {
    switch (this) {
      case (IngredientUnit.gallon):
        return 'gallon';
      case (IngredientUnit.quart):
        return 'quart';
      case (IngredientUnit.pint):
        return 'pint';
      case (IngredientUnit.cup):
        return 'cup';
      case (IngredientUnit.teaspoon):
        return 'teaspoon';
      case (IngredientUnit.tablespoon):
        return 'tablespoon';
      case (IngredientUnit.ounce):
        return 'ounce';
      case (IngredientUnit.gram):
        return 'gram';
      case (IngredientUnit.milligram):
        return 'milligram';
      case (IngredientUnit.fluidounce):
        return 'fluidounce';
      case (IngredientUnit.milliliter):
        return 'milliliter';
      case (IngredientUnit.liter):
        return 'liter';
      case (IngredientUnit.pound):
        return 'pound';
      case (IngredientUnit.unknown):
        return 'unknown';
      default:
        return 'unknown';
    }
  }

  dynamic get conversionUnit {
    switch (this) {
      case (IngredientUnit.gallon):
        return VOLUME.usGallons;
      case (IngredientUnit.quart):
        return VOLUME.usQuarts;
      case (IngredientUnit.pint):
        return VOLUME.usPints;
      case (IngredientUnit.cup):
        return VOLUME.cups;
      case (IngredientUnit.teaspoon):
        return VOLUME.teaspoonsUs;
      case (IngredientUnit.tablespoon):
        return VOLUME.tablespoonsUs;
      case (IngredientUnit.fluidounce):
        return VOLUME.usFluidOunces;
      case (IngredientUnit.milliliter):
        return VOLUME.milliliters;
      case (IngredientUnit.liter):
        return VOLUME.liters;
      case (IngredientUnit.ounce):
        return MASS.ounces;
      case (IngredientUnit.gram):
        return MASS.grams;
      case (IngredientUnit.milligram):
        return MASS.milligrams;
      case (IngredientUnit.pound):
        return MASS.pounds;
      case (IngredientUnit.unknown):
        return null;
      default:
        return null;
    }
  }

  double to(IngredientUnit i) {
    // return conversionChart[this]![i]!;
    return 1.convertFromTo(conversionUnit, i.conversionUnit)!;
  }
}