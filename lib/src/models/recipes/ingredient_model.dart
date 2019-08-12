import 'package:cooking_recipes/src/models/recipes/units.dart';

class IngredientModel {
  double _quantity;
  String _unit;
  String _label;

  IngredientModel.fromJson(Map<String, dynamic> json) {
    _unit = units[json['unit']];
    _quantity = double.parse(json['quantity'].toString());
    _label = json['label'];
  }

  IngredientModel.create(double quantity, String unit, String label) {
    _quantity = quantity;
    _unit = unit;
    _label = label;
  }

  IngredientModel.empty() {
    _unit = "";
    _quantity = 0;
    _label = "";
  }

  String get unit => _unit;
  double get quantity => _quantity;
  String get label => _label;
}