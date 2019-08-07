class StepModel {
  int _id;
  String _description;

  StepModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _description = json['description'];
  }

  int get id => _id;
  String get description => _description;
}