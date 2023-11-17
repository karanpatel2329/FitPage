


import 'package:fitpage/features/stocks/data/data_sources/stock_service.dart';
import 'package:fitpage/features/stocks/domain/repository/stock_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart' as dio;

@GenerateMocks([
  StockRepository,
  StockService,
], customMocks: [
  
],)
void main() {}