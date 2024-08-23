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

  double to(IngredientUnit i) {
    Map<IngredientUnit, Map<IngredientUnit, double>> conversionChart = {
      IngredientUnit.gallon: { IngredientUnit.quart: 4, IngredientUnit.cup: IngredientUnit.quart.to(IngredientUnit.cup) },
      IngredientUnit.quart: { IngredientUnit.cup: 4 },
      IngredientUnit.cup: {}
    };
    return conversionChart[this]![i]!;
  }
}