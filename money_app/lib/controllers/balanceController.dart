import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_app/models/modelTransaction.dart';

class iznosController extends GetxController {
  var iznos = 0.0.obs;
  var transakcije = <Transakcije>[].obs;

  @override
  void onInit() {
    super.onInit();
    iznos.value = 150.25;
    transakcije.value = _getDummyTransactions();
  }

  void dodajIznos(double iznosZaDodati) {
    iznos.value += iznosZaDodati;
    _dodajTransakciju(Transakcije(
      tip: tipTransakcije.DEPOSIT,
      iznos: iznosZaDodati,
      datum: DateTime.now(),
    ));
  }

  void uplatiIznos(double iznosZaUplatiti, String recipientName) {
    iznos.value -= iznosZaUplatiti;
    _dodajTransakciju(Transakcije(
        tip: tipTransakcije.UPLATA, iznos: iznosZaUplatiti, naziv: recipientName,  datum: DateTime.now()));
  }

  void loanIznos(double iznosZaPosuditi) {
    iznos.value += iznosZaPosuditi;
    _dodajTransakciju(Transakcije(
      tip: tipTransakcije.LOAN,
      iznos: iznosZaPosuditi,
      datum: DateTime.now(),
    ));
  }

  void _dodajTransakciju(Transakcije transakcija) {
    transakcije.insert(0, transakcija);
  }

  List<Transakcije> _getDummyTransactions() {
    return [
      Transakcije(
        tip: tipTransakcije.UPLATA,
        iznos: 45.99,
        datum: DateTime.now().subtract(const Duration(days: 2)),
        naziv: 'Konzum',
      ),
      Transakcije(
        tip: tipTransakcije.UPLATA,
        iznos: 25.00,
        datum: DateTime.now().subtract(const Duration(days: 1)),
        naziv: 'Udemy',
      ),
      Transakcije(
        tip: tipTransakcije.DEPOSIT,
        iznos: 100.00,
        datum: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];
  }

  String formatDate(DateTime datum) {
    if (DateTime.now().difference(datum).inDays == 0) {
      return 'DANAS';
    } else if (DateTime.now().difference(datum).inDays == 1) {
      return 'JUČER';
    } else {
      return DateFormat('d MMMM').format(datum);
    }
  }
}
