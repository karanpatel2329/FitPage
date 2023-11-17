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
  late MockStockRepository mockStockRepository;


 setUp(() {
    mockStockRepository = MockStockRepository();
  });

 

  group('Test Repo', () { 

    test('Get Stock Success', () async {
      when(mockStockRepository.getStocks()).thenAnswer((_) async => Success(<StockEntity>[]));
      final result = await mockStockRepository.getStocks();
      expect(result, isA<Success>());
    });


     test('Get Stock Failue', () async {
      when(mockStockRepository.getStocks()).thenAnswer((_) async => Failure("Error"));
      final result = await mockStockRepository.getStocks();
      expect(result, isA<Failure>());
    });
  });
}