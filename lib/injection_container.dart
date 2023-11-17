
import 'package:dio/dio.dart';
import 'package:fitpage/features/stocks/data/repository/stock_repo_impl.dart';
import 'package:fitpage/features/stocks/domain/repository/stock_repository.dart';
import 'package:fitpage/features/stocks/domain/usecases/get_stock.dart';
import 'package:fitpage/features/stocks/presentation/bloc/stock_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<StockRepository>(
    StockRepositoryImpl()
  );
  
  //UseCases
  sl.registerSingleton<GetStockUseCase>(
    GetStockUseCase(sl())
  );

  //Blocs
  sl.registerFactory<StockBloc>(
    ()=> StockBloc(sl())
  );

}