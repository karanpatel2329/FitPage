import 'package:fitpage/core/resources/data_state.dart';
import 'package:fitpage/core/usecases/usecase.dart';
import 'package:fitpage/features/stocks/domain/entities/stock.dart';
import 'package:fitpage/features/stocks/domain/repository/stock_repository.dart';

class GetStockUseCase implements UseCase<DataState,void>{
  
  late final StockRepository stockRepository;

  GetStockUseCase(this.stockRepository);
  
  @override
  Future<DataState> call({void params}) {
    return stockRepository.getStocks();
  }
  
}