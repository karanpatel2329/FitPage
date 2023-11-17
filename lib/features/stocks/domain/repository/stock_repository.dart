import 'package:fitpage/core/resources/data_state.dart';
import 'package:fitpage/features/stocks/domain/entities/stock.dart';

abstract class StockRepository {
  Future<DataState> getStocks();
}