// ignore: camel_case_types
enum tipTransakcije {
  // ignore: constant_identifier_names
  UPLATA,
  // ignore: constant_identifier_names
  DEPOSIT,
  // ignore: constant_identifier_names
  LOAN,
}

class Transakcije {
  late final tipTransakcije tip;
  late final double iznos;
  late final DateTime datum;
  late final String naziv;
  Transakcije({
    required this.tip,
    required this.iznos,
    required this.datum,
    this.naziv = '',
  });
}
