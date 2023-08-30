import 'package:get/get.dart';
import 'package:money_app/app/modules/to_who/bindings/to_who_binding.dart';
import 'package:money_app/app/modules/to_who/views/to_who_view.dart';
import '../modules/details_transaction/bindings/details_transaction_binding.dart';
import '../modules/details_transaction/views/details_transaction_view.dart';
import '../modules/loan/bindings/loan_binding.dart';
import '../modules/loan/views/loan_view.dart';
import '../modules/pay/bindings/pay_binding.dart';
import '../modules/pay/views/pay_view.dart';
import '../modules/top_up/bindings/top_up_binding.dart';
import '../modules/top_up/views/top_up_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.pay,
      page: () => PayView(),
      binding: PayBinding(),
    ),
    GetPage(
      name: _Paths.topUp,
      page: () => TopUpView(),
      binding: TopUpBinding(),
    ),
    GetPage(
      name: _Paths.loan,
      page: () => LoanView(),
      binding: LoanBinding(),
    ),
    GetPage(
      name: _Paths.detailsTransaction,
      page: () => DetailsTransactionView(transaction: null,),
      binding: DetailsTransactionBinding(),
    ),
    GetPage(
      name: _Paths.toWho,
      page: () => ToWhoView(),
      binding: ToWhoBinding(),
    ),
  ];
}
