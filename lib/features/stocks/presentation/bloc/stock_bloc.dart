import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fitpage/core/resources/data_state.dart';
import 'package:fitpage/features/stocks/domain/entities/stock.dart';
import 'package:fitpage/features/stocks/domain/usecases/get_stock.dart';
import 'package:flutter/material.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStockUseCase getStockUseCase;
  StockBloc(this.getStockUseCase) : super(const StockLoading()) {
    on< GetStocksEvents>((event, emit) async {
      emit(StockLoading());
      try {
        final response = await getStockUseCase.call();
        print(response);
        if(response is Success){
          emit(StockLoaded((response as Success).data));
        }else{
          emit(StockError( (response as Failure)));
        }
      } catch (e) {
        emit(StockError(Failure(e.toString())));
      }
    });
  }
}
