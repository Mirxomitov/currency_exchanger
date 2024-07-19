import 'package:currency_exchanger/data/source/remote/response/currency_response.dart';

abstract class ApiCurrency {
  Future<List<CurrencyResponse>> getCurrency();
  Future<List<CurrencyResponse>> getCurrencyByDate(DateTime dateTime);
}
