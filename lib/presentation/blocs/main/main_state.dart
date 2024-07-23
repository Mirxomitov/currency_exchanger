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
  final List<Color> colors = const [
    Color(0xFF1A237E),
    Color(0xFFD32F2F),
    Color(0xFF388E3C),
    Color(0xFF1976D2),
    Color(0xFFC2185B),
    Color(0xFF7B1FA2),
    Color(0xFFFFA000),
    Color(0xFF0288D1),
  ];
  final int chosenColorIndex;

  factory MainState.initial() {
    return MainState(
      chosenCurrencyID: -1,
      refresh: false,
      currencies: const [],
      date: DateTime.now(),
      language: SharedPreferencesHelper.getLanguage(),
      status: Status.loading,
      errorMessage: '',
      isItemOpened: true,
      calculate: false,
      chosenColorIndex: SharedPreferencesHelper.getColorIndex(),
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
    required this.chosenColorIndex,
  });

  @override
  String toString() {
    return 'MainState(language: $language, date: $date, currencies: $currencies, status: $status, errorMessage: $errorMessage, refresh: $refresh, chosenCurrency: $chosenCurrencyID, isItemOpened: $isItemOpened, calculate: $calculate, chosenColorIndex: $chosenColorIndex)';
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
    int? chosenColorIndex,
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
      chosenColorIndex: chosenColorIndex ?? this.chosenColorIndex,
    );
  }
}
