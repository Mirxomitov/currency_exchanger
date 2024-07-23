import 'package:currency_exchanger/presentation/blocs/main/main_bloc.dart';
import 'package:currency_exchanger/presentation/pages/main/components/change_color_dialog.dart';
import 'package:currency_exchanger/presentation/pages/main/components/language_dialog.dart';
import 'package:currency_exchanger/presentation/pages/main/views/fail_view.dart';
import 'package:currency_exchanger/presentation/pages/main/views/loading_view.dart';
import 'package:currency_exchanger/presentation/pages/main/views/success_view.dart';
import 'package:currency_exchanger/utils/commons.dart';
import 'package:currency_exchanger/utils/language.dart';
import 'package:currency_exchanger/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/currency_model.dart';
import 'components/calculate_dialog.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state.calculate) {
            _showCalculateDialog(context);
            context.read<MainBloc>().add(DialogShown());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Commons.circular12,
                  bottomRight: Commons.circular12,
                ),
              ),
              title: Text(
                _getTitle(context),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
              actions: [
                IconButton(
                    onPressed: () => _onChangeColor(context),
                    icon: const Icon(
                      Icons.color_lens,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () => _onChangeDate(context),
                    icon: const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    )),
                IconButton(
                  onPressed: () => _onChangeLanguage(
                    context: context,
                    onClick: (Language language) {
                      context.read<MainBloc>().add(ChangeLanguage(language: language));
                    },
                    selectedLanguage: context.read<MainBloc>().state.language,
                  ),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: switch (state.status) {
              Status.success => SuccessView(currencies: state.currencies),
              Status.fail => FailView(errorMessage: state.errorMessage),
              Status.loading => const LoadingView(),
            },
          );
        },
      ),
    );
  }

  Future<void> _onChangeDate(BuildContext context) async {
    final chosenDate = await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (chosenDate == null || !context.mounted) return;
    context.read<MainBloc>().add(ChangeDate(dateTime: chosenDate));
  }

  Future<void> _onChangeColor(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return BlocProvider.value(
          value: context.read<MainBloc>(),
          child: const ChangeColorDialog(),
        );
      },
    );
  }

  Future<void> _onChangeLanguage({
    required BuildContext context,
    required void Function(Language language) onClick,
    required Language selectedLanguage,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return BlocProvider.value(
          value: context.read<MainBloc>(),
          child: LanguageDialog(
            onClick: onClick,
          ),
        );
      },
    );
  }

  String _getTitle(BuildContext context) {
    return switch (context.read<MainBloc>().state.language) {
      Language.uzbekKirill => 'Валюта',
      Language.uzbekLatin => 'Valyuta',
      Language.english => 'Currency',
      Language.russian => 'Валюта',
    };
  }

  Future<void> _showCalculateDialog(
    BuildContext context,
  ) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return CalculateDialog(
          ccyName: _getCurrencyName(context),
          conversionFactor: double.parse(_getCurrentCurrency(context).rate ?? '1'),
        );
      },
    );
  }

  String _getCurrencyName(BuildContext context) {
    final currency = _getCurrentCurrency(context);

    return switch (context.read<MainBloc>().state.language) {
      Language.english => currency.ccyNmEn ?? '',
      Language.uzbekKirill => currency.ccyNmUzc ?? '',
      Language.uzbekLatin => currency.ccyNmUz ?? '',
      Language.russian => currency.ccyNmRu ?? '',
    };
  }

  CurrencyModel _getCurrentCurrency(BuildContext context) {
    return context
        .read<MainBloc>()
        .state
        .currencies
        .firstWhere((e) => context.read<MainBloc>().state.chosenCurrencyID == e.id);
  }
}
