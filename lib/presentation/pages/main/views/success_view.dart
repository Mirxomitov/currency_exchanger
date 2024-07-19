import 'package:currency_exchanger/data/model/currency_model.dart';
import 'package:currency_exchanger/presentation/pages/main/components/currency_item.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  final List<CurrencyModel> currencies;
  const SuccessView({super.key, required this.currencies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currencies.length,
      itemBuilder: (BuildContext context, int index) {
        return CurrencyItem(currency: currencies[index]);
      },
    );
  }
}
