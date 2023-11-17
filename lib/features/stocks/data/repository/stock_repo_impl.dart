import 'package:fitpage/core/resources/data_state.dart';
import 'package:fitpage/features/stocks/data/data_sources/stock_service.dart';
import 'package:fitpage/features/stocks/data/models/stock.dart';
import 'package:fitpage/features/stocks/domain/repository/stock_repository.dart';

class StockRepositoryImpl extends StockRepository{
  @override
  Future<DataState> getStocks() async{
    try{
      final stocks = await StockService.getStockData();
      final List<StockModel> stockList = [];
      for(var i in stocks??[]){
        StockModel stock = StockModel.fromJson(i);
        stockList.add(stock);
      }
      return Success(stockList);
    }catch(e){
      return Failure(e.toString());
    }
  }
}