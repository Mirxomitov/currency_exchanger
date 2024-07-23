import 'package:currency_exchanger/data/model/currency_model.dart';

import '../../utils/language.dart';

abstract class CurrencyRepository {
  Future<List<CurrencyModel>> getCurrencies();

  Future<List<CurrencyModel>> getCurrenciesByDate(DateTime dateTime);

  Future<int> getColorIndex();

  Future<void> setColorIndex(int index);

  Future<void> setLanguage(Language lang);
}
