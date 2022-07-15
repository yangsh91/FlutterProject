import 'package:get/get.dart';

import 'package:paynuri/app/ui/user/login.dart';
import 'package:paynuri/app/binding/user/login_binding.dart';

import 'package:paynuri/app/ui/user/join_process.dart';
import 'package:paynuri/app/ui/user/join.dart';
import 'package:paynuri/app/binding/user/join_binding.dart';

import 'package:paynuri/app/ui/home/home.dart';
import 'package:paynuri/app/ui/payment/payment_credit.dart';
import 'package:paynuri/app/binding/payment/payment_card_binding.dart';
import 'package:paynuri/app/ui/payment/payment_request.dart';
import 'package:paynuri/app/ui/payment/transaction_list.dart';
import 'package:paynuri/app/binding/payment/payment_credit_binding.dart';
import 'package:paynuri/app/binding/payment/payment_request_binding.dart';
import 'package:paynuri/app/ui/payment/payment_card.dart';

import 'package:paynuri/app/ui/user/guides.dart';

import 'package:paynuri/app/ui/manage/manage.dart';
import 'package:paynuri/app/ui/manage/product_manage.dart';
import 'package:paynuri/app/binding/manage/product_manage_binding.dart';

import 'package:paynuri/app/ui/user/settings.dart';
import 'package:paynuri/app/binding/user/settings_binding.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => Home(),
    ),
    GetPage(
      name: Routes.login,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.join_process,
      page: () => JoinProcess(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.join,
      page: () => Join(),
      binding: JoinBindning(),
    ),
    GetPage(
      name: Routes.payment_credit,
      page: () => PaymentCredit(),
      binding: PaymentCreditBinding(),
    ),
    GetPage(
      name: Routes.payment_card,
      page: () => PaymentCard(),
      binding: PaymentCardBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.payment_request,
      page: () => PaymentRequest(),
      binding: PaymentRequestBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.tran_list,
      page: () => TransactionList(),
    ),
    GetPage(
      name: Routes.guides,
      page: () => Guides(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.manage,
      page: () => Manage(),
    ),
    GetPage(
      name: Routes.product_manage,
      page: () => ProductManage(),
      binding: ProductManageBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => Settings(),
      binding: SettingsBinding(),
      transition: Transition.downToUp,
    ),
  ];
}
