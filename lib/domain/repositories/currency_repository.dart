import 'package:currency_exchanger/data/model/currency_model.dart';

abstract class CurrencyRepository {
  Future<List<CurrencyModel>> getCurrencies();
  Future<List<CurrencyModel>> getCurrenciesByDate(DateTime dateTime);
}