part of 'main_bloc.dart';

abstract class MainEvent {}

final class RefreshEvent extends MainEvent {}

final class LoadCurrencies extends MainEvent {}

final class ChangeDate extends MainEvent {
  final DateTime dateTime;

  ChangeDate({required this.dateTime});
}

final class ChangeLanguage extends MainEvent {
  final Language language;

  ChangeLanguage({required this.language});
}

final class HideItem extends MainEvent {}

final class ShowItem extends MainEvent {
  final int itemID;

  ShowItem({required this.itemID});
}

final class CalculateEvent extends MainEvent {}

final class DialogShown extends MainEvent {}