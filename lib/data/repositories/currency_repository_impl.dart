import 'package:currency_exchanger/data/model/currency_model.dart';
import 'package:currency_exchanger/data/source/remote/service/api_currency.dart';
import 'package:currency_exchanger/data/source/remote/service/api_currency_impl.dart';
import 'package:currency_exchanger/domain/converter/model_converter.dart';
import 'package:currency_exchanger/domain/repositories/currency_repository.dart';
import 'package:dio/dio.dart';

class CurrencyRepositoryImpl extends CurrencyRepository {
  final ApiCurrency _apiCurrency = ApiCurrencyImpl();

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    try {
      return (await _apiCurrency.getCurrency()).map((e) => ModelConverter.responseToUIData(e)).toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyModel>> getCurrenciesByDate(DateTime dateTime) async {
    try {
      return (await _apiCurrency.getCurrencyByDate(dateTime)).map((e) => ModelConverter.responseToUIData(e)).toList();
    } on DioException {
      rethrow;
    }
  }
}