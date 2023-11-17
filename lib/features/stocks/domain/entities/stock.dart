import 'package:equatable/equatable.dart';
import 'package:fitpage/features/stocks/data/models/stock.dart';

class StockEntity extends Equatable {
  int? id;
  String? name;
  String? tag;
  String? color;
  String? type;
  String? text;
  CriteriaModel? criteria;

  StockEntity({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.type,
    this.text,
    this.criteria,
  });

  @override
  List<Object?> get props => [id, name, tag, color, type, text, criteria];
}
