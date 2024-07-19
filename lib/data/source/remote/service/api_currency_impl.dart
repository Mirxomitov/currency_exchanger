import 'package:currency_exchanger/data/source/remote/response/currency_response.dart';
import 'package:currency_exchanger/data/source/remote/service/api_currency.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ApiCurrencyImpl extends ApiCurrency {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://cbu.uz/uz/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
      //headers: {'bearer token' : 'sgddsgfsdf'},
      //queryParameters: {'code' : 2}
    ),
  );

  @override
  Future<List<CurrencyResponse>> getCurrency() async {
    try {
      final response = await _dio.get('arkhiv-kursov-valyut/json');
      return (response.data as List).map((value) => CurrencyResponse.fromJson(value)).toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyResponse>> getCurrencyByDate(DateTime dateTime) async {
    try {
      final response = await _dio.get('arkhiv-kursov-valyut/json/all/${DateFormat('yyyy-MM-dd').format(dateTime)}');
      return (response.data as List).map((value) => CurrencyResponse.fromJson(value)).toList();
    } on DioException {
      rethrow;
    }
  }
}
