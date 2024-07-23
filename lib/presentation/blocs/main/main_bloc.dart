import 'package:currency_exchanger/data/local/shared_preferences_helper.dart';
import 'package:currency_exchanger/data/model/currency_model.dart';
import 'package:currency_exchanger/data/repositories/currency_repository_impl.dart';
import 'package:currency_exchanger/domain/repositories/currency_repository.dart';
import 'package:currency_exchanger/utils/language.dart';
import 'package:currency_exchanger/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final CurrencyRepository _repository = CurrencyRepositoryImpl();

  MainBloc() : super(MainState.initial()) {
    on<RefreshEvent>((event, emit) => _onRefresh(event, emit));
    on<LoadCurrencies>((event, emit) => _onLoadCurrencies(event, emit));
    on<ChangeDate>((event, emit) => _onChangeDate(event, emit));
    on<ChangeLanguage>((event, emit) => _onChangeLanguage(event, emit));
    on<HideItem>((event, emit) => _onHideItem(event, emit));
    on<ShowItem>((event, emit) => _onShowItem(event, emit));
    on<CalculateEvent>((event, emit) => _onCalculate(event, emit));
    on<DialogShown>((event, emit) => _onDialogShown(event, emit));
    on<ChangeColorEvent>((event, emit) => _onChangeColor(event, emit));
  }

  void _onHideItem(HideItem event, Emitter<MainState> emit) {
    emit(state.copyWith(isItemOpened: false, chosenCurrencyID: -1));
  }

  void _onShowItem(ShowItem event, Emitter<MainState> emit) {
    emit(state.copyWith(isItemOpened: true, chosenCurrencyID: event.itemID));
  }

  void _onRefresh(RefreshEvent event, Emitter<MainState> emit) {
    add(LoadCurrencies());
    emit(state.copyWith(refresh: true));
  }

  void _onChangeDate(ChangeDate event, Emitter<MainState> emit) {
    emit(state.copyWith(date: event.dateTime));
    add(LoadCurrencies());
  }

  void _onChangeLanguage(ChangeLanguage event, Emitter<MainState> emit) {
    debugPrint('language changed to ${event.language}');
    emit(state.copyWith(language: event.language));
    _repository.setLanguage(event.language);
  }

  void _onLoadCurrencies(LoadCurrencies event, Emitter<MainState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final currencies = await _repository.getCurrenciesByDate(state.date);
      print('bloc data : $currencies');

      emit(state.copyWith(
        status: Status.success,
        currencies: currencies,
        refresh: false,
      ));

      print('bloc loaded and status is : ${state.status} ');
      emit(state.copyWith(status: Status.success));
    } on DioException catch (e) {
      print('bloc dio exception');

      emit(state.copyWith(
        status: Status.fail,
        errorMessage: e.message,
        refresh: false,
      ));
    }
  }

  _onCalculate(CalculateEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(calculate: true));
  }

  _onDialogShown(DialogShown event, Emitter<MainState> emit) {
    emit(state.copyWith(calculate: false));
  }

  _onChangeColor(ChangeColorEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(chosenColorIndex: event.index));
    _repository.setColorIndex(event.index);
  }
}
