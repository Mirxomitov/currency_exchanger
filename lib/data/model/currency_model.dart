class CurrencyModel {
  int? id;
  String? code;
  String? ccy;
  String? ccyNmRu;
  String? ccyNmUz;
  String? ccyNmUzc;
  String? ccyNmEn;
  String? nominal;
  String? rate;
  String? diff;
  String? date;

  CurrencyModel({
    required this.id,
    required this.code,
    required this.ccy,
    required this.ccyNmRu,
    required this.ccyNmUz,
    required this.ccyNmUzc,
    required this.ccyNmEn,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
  });

  @override
  String toString() {
    return 'CurrencyModel(id: $id, code: $code, ccy: $ccy, ccyNmRu: $ccyNmRu, ccyNmUz: $ccyNmUz, ccyNmUzc: $ccyNmUzc, ccyNmEn: $ccyNmEn, nominal: $nominal, rate: $rate, diff: $diff, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrencyModel &&
        other.id == id &&
        other.code == code &&
        other.ccy == ccy &&
        other.ccyNmRu == ccyNmRu &&
        other.ccyNmUz == ccyNmUz &&
        other.ccyNmUzc == ccyNmUzc &&
        other.ccyNmEn == ccyNmEn &&
        other.nominal == nominal &&
        other.rate == rate &&
        other.diff == diff &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        ccy.hashCode ^
        ccyNmRu.hashCode ^
        ccyNmUz.hashCode ^
        ccyNmUzc.hashCode ^
        ccyNmEn.hashCode ^
        nominal.hashCode ^
        rate.hashCode ^
        diff.hashCode ^
        date.hashCode;
  }
}
