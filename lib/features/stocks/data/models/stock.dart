import 'package:fitpage/features/stocks/domain/entities/stock.dart';
class CriteriaModel {
  List<CriteriaItem> criteria;

  CriteriaModel({required this.criteria});

  factory CriteriaModel.fromJson( List<dynamic> json) {
    List<CriteriaItem> criteria = json
        .map((item) => CriteriaItem.fromJson(item))
        .toList();
        print("criteria length ${criteria.length}");
    return CriteriaModel(criteria: criteria);
  }
}

class CriteriaItem {
  String type;
  String text;
  Variable? variable;

  CriteriaItem({required this.type, required this.text, required this.variable});

  factory CriteriaItem.fromJson(Map<String, dynamic> json) {
    return CriteriaItem(
      type: json['type'],
      text: json['text'],
      variable: json['variable']!=null?Variable.fromJson(json['variable']):null,
    );
  }
}

class Variable {
  Map<String, ValueVariable> variables;

  Variable({required this.variables});

  factory Variable.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> variablesJson = json;
    Map<String, ValueVariable> variables = variablesJson.map(
      (key, value) => MapEntry(key, ValueVariable.fromJson(value)),
    );

    return Variable(variables: variables);
  }
}

class ValueVariable {
  String type;
  List<dynamic> values;
  String? parameter_name;
  int? min_value;
  int? max_value;
  int? default_value;

  ValueVariable({required this.type, required this.values, this.default_value, this.max_value,this.min_value,this.parameter_name,});

  factory ValueVariable.fromJson(Map<String, dynamic> json) {
    return ValueVariable(
      type: json['type'],
      values: json['values']??[],
      parameter_name: json['parameter_name'],
      min_value: json['min_value'],
      max_value: json['max_value'],
      default_value: json['default_value'],
    );
  }
}

class StockModel extends StockEntity{
   StockModel({
     int? id,
     String? name,
     String? tag,
     String? color,
     String? type,
     String? text,
     required CriteriaModel criteria,
  }):super(
    id: id,
    name: name,
    tag: tag,
    color: color,
    type: type,
    text: text,
    criteria: criteria
  );
  
  factory StockModel.fromJson(Map<String,dynamic> map){
    return StockModel(
      id: map['id'],
      name: map['name'],
      tag: map['tag'],
      color: map['color'],
      type: map['type'],
      text: map['text'],
      criteria: CriteriaModel.fromJson(map['criteria']),
    );
  }
}