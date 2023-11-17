part of 'stock_bloc.dart';

abstract class StockState extends Equatable {
  const StockState();
   
  @override
  List<Object> get props => [];
}

class StockLoading extends StockState {
  const StockLoading() : super();
}

class StockLoaded extends StockState {
  final List<StockEntity> stocks;
  const StockLoaded(this.stocks);
   @override
  List<Object> get props => [stocks];
}

class StockError extends StockState {
  
  final Failure error;
  const StockError( this.error);
  @override
  List<Object> get props => [error];
}
 
