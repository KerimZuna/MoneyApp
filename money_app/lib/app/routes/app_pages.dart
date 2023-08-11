import 'package:get/get.dart';
import 'package:money_app/app/modules/ToWho/bindings/to_who_binding.dart';
import 'package:money_app/app/modules/ToWho/views/to_who_view.dart';
import '../modules/DetailsTransaction/bindings/details_transaction_binding.dart';
import '../modules/DetailsTransaction/views/details_transaction_view.dart';
import '../modules/Loan/bindings/loan_binding.dart';
import '../modules/Loan/views/loan_view.dart';
import '../modules/Pay/bindings/pay_binding.dart';
import '../modules/Pay/views/pay_view.dart';
import '../modules/TopUp/bindings/top_up_binding.dart';
import '../modules/TopUp/views/top_up_view.dart';
import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';

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
