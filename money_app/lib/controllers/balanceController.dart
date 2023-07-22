import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_app/models/modelTransaction.dart';

class iznosController extends GetxController{
  var iznos = 0.0.obs;
  var transakcije = <Transakcije>[].obs;

  @override
  void onInit() {
    super.onInit();
    iznos.value = 150.25;
    transakcije.value = _getDummyTransactions();
  }

  void dodajIznos(double iznosZaDodati){
    iznos.value += iznosZaDodati;
    _dodajTransakciju(
      Transakcije(
        tip: tipTransakcije.DEPOSIT, 
        iznos: iznos.value, 
        datum: DateTime.now(),
    ));
  }

  void updateiznos(double noviIznos){
    iznos.value = noviIznos;
  }


  void _dodajTransakciju(Transakcije transakcija) {
    transakcije.insert(0, transakcija);
  }

  List<Transakcije> _getDummyTransactions() {
    return [
      Transakcije(
        tip: tipTransakcije.UPLATA,
        iznos: 45.99,
        datum: DateTime.now().subtract(Duration(days: 2)),
        naziv: 'Coffee Shop',
      ),
      Transakcije(
        tip: tipTransakcije.UPLATA,
        iznos: 25.00,
        datum: DateTime.now().subtract(Duration(days: 1)),
        naziv: 'Supermarket',
      ),
      Transakcije(
        tip: tipTransakcije.DEPOSIT,
        iznos: 100.00,
        datum: DateTime.now().subtract(Duration(hours: 2)),
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