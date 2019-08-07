import 'package:cooking_recipes/src/models/recipes/step_model.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {

  StepModel _model;

  StepItem(StepModel model) {
    _model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: _buildItem(),
    );
  }

  Widget _buildItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0,),
      child: Row(
        children: <Widget>[
          _buildStepId(),
          SizedBox(width: 16.0,),
          Flexible(
            child: Text("${_model.description}"),
          ),
        ],
      ),
    );
  }

  Widget _buildStepId() {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
          color: Colors.blueAccent
        )
      ),
      child: Text(
        "${_model.id}",
        style: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}