import 'package:dio/dio.dart';
import 'package:fitpage/config/routes/api_routes.dart';

class StockService {
 
  static Future getStockData() async {
    try {
       final Dio dio = Dio();
      final response = await dio.get(ApiRoutes.getStocks);
      return response.data;
    } catch (e) {
      throw Exception('Failed to get stock data: $e');
    }
  }
}
