import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/data/repository/manage/manage_repository.dart';

enum UseYn { Y, N }

class ProductManageController extends GetxController {
  final ManageRepository? manageRepository;

  ProductManageController({required this.manageRepository})
      : assert(manageRepository != null);

  late TextEditingController group_name, product_name, product_amt;
  var strGroup = ''.obs;
  late RxBool removeResult, isSelect;

  var group_list = [
    {"id": "1", "name": "커피"},
    {"id": "2", "name": "라떼"},
    {"id": "3", "name": "스무디"},
    {"id": "4", "name": "쥬스"},
    {"id": "4", "name": "치"},
  ].obs;

  var product_list = [
    {"p_id": "p1", "id": "1", "name": "아메리카노", "amt": "1,500", "use": "Y"},
    {"p_id": "p2", "id": "1", "name": "헤이즐넛", "amt": "2,700", "use": "Y"},
    {"p_id": "p3", "id": "1", "name": "카푸치노", "amt": "2,700", "use": "N"},
    {"p_id": "p4", "id": "1", "name": "에스프레소", "amt": "1,500", "use": "Y"},
    {"p_id": "p5", "id": "1", "name": "카라멜마끼아또", "amt": "3,700", "use": "Y"},
    {"p_id": "p6", "id": "1", "name": "카페모카", "amt": "3,900", "use": "N"},
    {"p_id": "p7", "id": "2", "name": "카페라떼", "amt": "2,900", "use": "N"},
    {"p_id": "p7", "id": "2", "name": "바닐라라떼", "amt": "3,400", "use": "Y"},
    {"p_id": "p7", "id": '2', "name": "연유라떼", "amt": "3,900", "use": "Y"},
    {"p_id": "p7", "id": "2", "name": "티라미수라떼", "amt": "3,900", "use": "Y"},
  ].obs;

  @override
  void onInit() {
    super.onInit();
    group_name = TextEditingController();
    product_name = TextEditingController();
    product_amt = TextEditingController();

    removeResult = false.obs;
    isSelect = false.obs;

    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      print('Keyboard is visible.');
    } else {
      print('Keyboard is not visible.');
    }
  }

  void addGroup() async {
    var group_cnt = group_list.length + 1;
    var name = group_name.text;

    group_list.add({
      "id": group_cnt.toString(),
      "name": name.toString(),
    });
  }

  removeGroup(@required int num) async {
    group_list.remove(group_list[num]) == true
        ? removeResult.value = true
        : removeResult.value = false;
  }

  void selectGrouping(String id) {
    print("id ::: $id");

    print("$num == $strGroup");

    isSelect.value = true;
    strGroup.value = id;
  }

  void addProductInfo() async {
    String _product_group = strGroup.value;
    String _product_name = product_name.text;
    String _product_amt = product_amt.text;
    String _p_id = (product_list.length + 1).toString();

    product_list.add({
      "p_id": _p_id,
      "id": _product_group,
      "name": _product_name,
      "amt": _product_amt,
      "use": "Y",
    });
  }

  void removeProductInfo() async {}
}
