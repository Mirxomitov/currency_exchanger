import 'package:currency_exchanger/data/model/currency_model.dart';
import 'package:currency_exchanger/data/source/remote/response/currency_response.dart';

class ModelConverter {
  static CurrencyModel responseToUIData(CurrencyResponse response) =>
      CurrencyModel(
        id: response.id,
        code: response.code,
        ccy: response.ccy,
        ccyNmRu: response.ccyNmRu,
        ccyNmUz: response.ccyNmUz,
        ccyNmUzc: response.ccyNmUzc,
        ccyNmEn: response.ccyNmEn,
        nominal: response.nominal,
        rate: response.rate,
        diff: response.diff,
        date: response.date,
      );
}
