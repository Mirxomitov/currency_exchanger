part of 'main_bloc.dart';

class MainState {
  final Language language;
  final DateTime date;
  final List<CurrencyModel> currencies;
  final Status status;
  final String errorMessage;
  final bool refresh;
  final bool isItemOpened;
  final int chosenCurrencyID;
  final bool calculate;

  factory MainState.initial() {
    return MainState(
      chosenCurrencyID: -1,
      refresh: false,
      currencies: const [],
      date: DateTime.now(),
      language: Language.uzbekLatin,
      status: Status.loading,
      errorMessage: '',
      isItemOpened: true,
      calculate: false,
    );
  }

  const MainState({
    required this.refresh,
    required this.language,
    required this.date,
    required this.currencies,
    required this.status,
    required this.errorMessage,
    required this.chosenCurrencyID,
    required this.isItemOpened,
    required this.calculate,
  });

  @override
  String toString() {
    return 'MainState(language: $language, date: $date, currencies: $currencies, status: $status, errorMessage: $errorMessage, refresh: $refresh, chosenCurrency: $chosenCurrencyID, isItemOpened: $isItemOpened, calculate: $calculate)';
  }

  MainState copyWith({
    Language? language,
    DateTime? date,
    List<CurrencyModel>? currencies,
    Status? status,
    String? errorMessage,
    bool? refresh,
    int? chosenCurrencyID,
    bool? isItemOpened,
    bool? calculate,
  }) {
    return MainState(
      language: language ?? this.language,
      date: date ?? this.date,
      currencies: currencies ?? this.currencies,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      refresh: refresh ?? this.refresh,
      chosenCurrencyID: chosenCurrencyID ?? this.chosenCurrencyID,
      isItemOpened: isItemOpened ?? this.isItemOpened,
      calculate: calculate ?? this.calculate,
    );
  }
}
