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

  String get unit => _unit;
  double get quantity => _quantity;
  String get label => _label;
}