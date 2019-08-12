import 'package:cooking_recipes/src/models/recipes/ingredient_model.dart';
import 'package:flutter/material.dart';

class IngredientCreationDialog extends StatelessWidget {

  static final _formKey = GlobalKey<FormState>();
  static final _controllerQuantity = TextEditingController();
  static final _controllerUnit = TextEditingController();
  static final _controllerLabel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add ingredient'),
      content: _buildForm(),
      actions: <Widget>[
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              var result = IngredientModel.create(double.parse(_controllerQuantity.text), _controllerUnit.text,_controllerLabel.text);
              _controllerQuantity.clear();
              _controllerUnit.clear();
              _controllerLabel.clear();

              Navigator.of(context).pop(result);
            }
          },
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _controllerQuantity,
              decoration: InputDecoration(
                hintText: 'Quantity',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) return 'Empty field';
                return null;
              },
            ),
            TextFormField(
              controller: _controllerUnit,
              decoration: InputDecoration(
                hintText: 'Unit',
              ),
              validator: (value) {
                if (value.isEmpty) return 'Empty field';
                return null;
              },
            ),
            TextFormField(
              controller: _controllerLabel,
              decoration: InputDecoration(
                hintText: 'Label',
              ),
              validator: (value) {
                if (value.isEmpty) return 'Empty field';
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}