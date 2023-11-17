import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:fitpage/core/resources/data_state.dart';
import 'package:fitpage/features/stocks/domain/entities/stock.dart';
import 'package:fitpage/features/stocks/domain/usecases/get_stock.dart';
import 'package:fitpage/features/stocks/presentation/bloc/stock_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late StockBloc stockBloc;
  late GetStockUseCase getStockUseCase;
  late MockStockRepository mockStockRepository;
  late MockStockService mockStockService;

  List<StockEntity> stocks = [StockEntity(
        name: "Stock 1",
        tag: "Symbol 1",
        text: '',
      ),
      StockEntity(
        name: "Stock 2",
        tag: "Symbol 2",
        text: '',
      )];

  setUp(() {
    mockStockRepository = MockStockRepository();
    getStockUseCase = GetStockUseCase(mockStockRepository);
    stockBloc = StockBloc(getStockUseCase);
    mockStockService = MockStockService();
  });

  group("Stock Bloc Test", () {
    test("Initial state should be StockLoading", () async {
      expect(stockBloc.state, const StockLoading());
    });

    blocTest<StockBloc, StockState>(
      'Should emit [StockLoading, StockLoaded] when data is gotten successfully with empty list',
      build: () {
        when(getStockUseCase.call()).thenAnswer((realInvocation)async => Success(<StockEntity>[]));
        return stockBloc;
      },
      act: (bloc) => bloc.add(const GetStocksEvents()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
         const StockLoading(),
        const StockLoaded( []),
      ],
    );

    blocTest<StockBloc, StockState>(
      'Should emit [StockLoading, StockLoaded] when data is gotten successfully with non empty list',
      build: () {
        when(getStockUseCase.call()).thenAnswer((realInvocation)async => Success(stocks));
        return stockBloc;
      },
      act: (bloc) => bloc.add(const GetStocksEvents()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
         const StockLoading(),
        StockLoaded( stocks),
      ],
    );

     blocTest<StockBloc, StockState>(
      'Should emit [StockLoading, StockError] when error occured',
      build: () {
        when(getStockUseCase.call()).thenAnswer((realInvocation)async =>Failure( "Error"));
        return stockBloc;
      },
      act: (bloc) => bloc.add(const GetStocksEvents()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
         const StockLoading(),
         StockError(Failure("Error")),
      ]
    );
  
  });
    
}
