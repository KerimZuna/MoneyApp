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
        tip: tipTransakcije.UPLATA,
        iznos: iznosZaUplatiti,
        naziv: recipientName,
        datum: DateTime.now()));
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
        iznos: 18.99,
        datum: DateTime.now().subtract(const Duration(days: 1)),
        naziv: 'Konzum',
      ),
      Transakcije(
        tip: tipTransakcije.UPLATA,
        iznos: 175.00,
        datum: DateTime.now().subtract(const Duration(days: 1)),
        naziv: 'Sport Vision',
      ),
      Transakcije(
        tip: tipTransakcije.UPLATA,
        iznos: 21.75,
        datum: DateTime.now().subtract(const Duration(days: 1)),
        naziv: 'Udemy',
      ),
    ];
  }

  String formatDate(DateTime datum) {
    if (DateTime.now().difference(datum).inDays == 0) {
      return 'TODAY';
    } else if (DateTime.now().difference(datum).inDays == 1) {
      return 'YESTERDAY';
    } else {
      return DateFormat('d MMMM').format(datum);
    }
  }
  void splitTheBill(double newAmount) {
    if (transakcije.isNotEmpty) {
      double originalAmount = transakcije[0].iznos;
      double splitFactor = newAmount / originalAmount;

      for (var transaction in transakcije) {
        transaction.iznos *= splitFactor;
      }

      iznos.value = newAmount;
    }
  }
}
