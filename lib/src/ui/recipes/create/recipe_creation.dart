import 'package:cooking_recipes/src/models/recipes/ingredient_model.dart';
import 'package:cooking_recipes/src/models/recipes/step_model.dart';
import 'package:cooking_recipes/src/ui/recipes/create/ingredient_creation.dart';
import 'package:flutter/material.dart';

class RecipeCreation extends StatefulWidget {

  static const routeName = "/create";

  @override
  _RecipeCreationState createState() => _RecipeCreationState();
}

class _RecipeCreationState extends State<RecipeCreation> {

  final _formKey = GlobalKey<FormState>();
  List<IngredientModel> _ingredients = [];
  List<StepModel> _steps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: ListView(
        children: <Widget>[
          _buildFrom(),
        ],
      ),
    );
  }

  Widget _buildFrom() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: 'title',
              ),
              validator: (value) {
                if (value.isEmpty)
                  return 'Please add a title';
                return null;
              },
            ),
            _buildSectionTitle("Ingredients"),
            _buildIngredientsList(),
            _buildSectionTitle("Steps"),
            _buildStepsList(),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Send data')));
                }
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildIngredientsList() {
    return Column(
      children: List<Widget>.generate(_ingredients.length + 1, (index) {
        if (index == _ingredients.length)
          return _buildAddButton('Add ingredient');
        return _buildIngredientRow(index);
      }),
    );
  }

  Widget _buildStepsList() {
    return Column(
      children: List<Widget>.generate(_steps.length + 1, (index) {
        if (index == _steps.length)
          return _buildAddButton('Add step');
        return _buildStepRow(index);
      }),
    );
  }

  Widget _buildIngredientRow(int index) {
    var model = _ingredients[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('${model.label}: ${model.quantity}${model.unit}',),
          GestureDetector(
            onTap: () => _removeIngredientField(index),
            child: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepRow(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('${_steps[index].id} - ${_steps[index].description}'),
          GestureDetector(
            onTap: () => _removeStepField(index),
            child: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addIngredientField() async {
    var result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => IngredientCreationDialog()
    );

    if (result != null) {
      setState(() {
        _ingredients.add(result);
      });
    }
  }

  void _removeIngredientField(int index) {
    setState(() {
      _ingredients.removeAt(index);
    });
  }

  void _removeStepField(int index) {
    setState(() {
      _steps.removeAt(index);
    });
  }

  Widget _buildAddButton(String actionMessage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: _addIngredientField,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueAccent
                  )
              ),
              child: Icon(
                Icons.add,
                size: 16.0,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(width: 8.0,),
            Text(
              actionMessage,
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}