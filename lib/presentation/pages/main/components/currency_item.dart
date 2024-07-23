import 'package:currency_exchanger/data/model/currency_model.dart';
import 'package:currency_exchanger/presentation/blocs/main/main_bloc.dart';
import 'package:currency_exchanger/utils/commons.dart';
import 'package:currency_exchanger/utils/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CurrencyItem extends StatelessWidget {
  final CurrencyModel currency;

  const CurrencyItem({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.read<MainBloc>().state.isItemOpened) {
          context.read<MainBloc>().add(HideItem());
        } else {
          context.read<MainBloc>().add(ShowItem(itemID: currency.id ?? -1));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Commons.circular12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color with opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: const Offset(0, 3), // Offset in x and y direction
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          _getCurrency(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold, height: 0),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          currency.diff.toString(),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: !(currency.diff ?? '-').startsWith('-')
                                    ? Colors.green
                                    : Colors.red,
                                height: 0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '1 ${currency.ccy} => ${currency.rate} UZS\t|\t',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Icon(
                          Icons.calendar_today_rounded,
                          size: 18,
                        ),
                        Text(
                          "\t${DateFormat('yyyy.MM.dd').format(
                            context.read<MainBloc>().state.date,
                          )}",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ],
                ),
                currency.id == context.read<MainBloc>().state.chosenCurrencyID &&
                        context.read<MainBloc>().state.isItemOpened
                    ? const Icon(Icons.keyboard_arrow_up_rounded)
                    : const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
            const SizedBox(height: 8),
            Visibility(
              visible: currency.id == context.read<MainBloc>().state.chosenCurrencyID &&
                  context.read<MainBloc>().state.isItemOpened,
              child: Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.read<MainBloc>().add(CalculateEvent());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      margin: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calculate,
                            size: 18,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _getCalculateText(context),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getCurrency(BuildContext context) {
    return switch (context.read<MainBloc>().state.language) {
      Language.uzbekKirill => currency.ccyNmUzc ?? '',
      Language.uzbekLatin => currency.ccyNmUz ?? '',
      Language.english => currency.ccyNmEn ?? '',
      Language.russian => currency.ccyNmRu ?? '',
    };
  }

  String _getCalculateText(BuildContext context) {
    return switch (context.read<MainBloc>().state.language) {
      Language.uzbekKirill => 'Хисоблаш',
      Language.uzbekLatin => 'Hisoblash',
      Language.english => 'Calculate',
      Language.russian => 'Рассчитать',
    };
  }
}
