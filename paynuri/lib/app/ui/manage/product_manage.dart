import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/controller/manage/product_manage_controller.dart';

class ProductManage extends GetView<ProductManageController> {
  const ProductManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('상품관리'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
          actions: [
            TextButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    title: const Text('상품등록관리'),
                    //message: const Text('message'),
                    actions: <CupertinoActionSheetAction>[
                      CupertinoActionSheetAction(
                          onPressed: () =>
                              _showModalBottomSheet(context, 'group'),
                          child: const Text('그룹등록')),
                      CupertinoActionSheetAction(
                          onPressed: () =>
                              _showModalBottomSheet(context, 'product'),
                          child: const Text('상품등록')),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                          print("cancel...");
                          Get.back();
                        },
                        child: const Text('취소')),
                  ),
                );
              },
              child: const Text(
                '등록',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('그룹'),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 40.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.group_list.length,
                    itemBuilder: (BuildContext context, int item) {
                      return GestureDetector(
                        onTap: () => _showDialog(context, '삭제하시겠습니까?', item),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            height: 30.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 1.5,
                                color: Colors.black,
                              ),
                            ),
                            child:
                                Text('${controller.group_list[item]['name']}'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text('상품 목록'),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 55,
                        ),
                        itemCount: controller.product_list.length,
                        itemBuilder: (BuildContext context, int item) => Card(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: controller.product_list[item]['use'] == "Y"
                                  ? Colors.blueAccent
                                  : Colors.amber,
                              border: Border.all(
                                width: 2.0,
                                color: Colors.black,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${controller.product_list[item]['name']}',
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    '${controller.product_list[item]['amt']}원',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, String type) {
    showModalBottomSheet(
      constraints: BoxConstraints.loose(
        Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.9),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        if (type == 'group') {
          return _bottomGroupSheet(context);
        } else {
          return _bottomProductSheet(context);
        }
      },
    );
  }

  Widget _bottomGroupSheet(context) {
    return Obx(
      () => Container(
        height: 250.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('그룹명'),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 35.0,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: TextField(
                          controller: controller.group_name,
                          onTap: () {},
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(22, 54, 105, 1),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.amber,
                                width: 4.0,
                              ),
                            ),
                            hintText: '그룹명을 입력하세요.',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 13.0,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () => controller.addGroup(),
                    child: Container(
                      height: 35.0,
                      width: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        '추가',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text('그룹 목록'),
              Container(
                height: 40.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.group_list.length,
                  itemBuilder: (BuildContext context, int item) {
                    return GestureDetector(
                      onTap: () => _showDialog(context, '삭제하시겠습니까?', item),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          height: 30.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Text('${controller.group_list[item]['name']}'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomProductSheet(context) {
    return Obx(
      () => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: 550.0,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('그룹'),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 40.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.group_list.length,
                    itemBuilder: (BuildContext context, int item) {
                      return GestureDetector(
                        onTap: () => controller.selectGrouping(
                            '${controller.group_list[item]['id']}'),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                          child: Container(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            height: 30.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: controller.strGroup.value ==
                                      controller.group_list[item]['id']
                                          .toString()
                                  ? Colors.blueAccent
                                  : Colors.grey,
                            ),
                            child:
                                Text('${controller.group_list[item]['name']}'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(child: const Text('상품명')),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(child: const Text('금액')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 35.0,
                        child: TextField(
                          controller: controller.product_name,
                          onTap: () {},
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(22, 54, 105, 1),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.amber,
                                width: 4.0,
                              ),
                            ),
                            hintText: '상품명을 입력하세요.',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 13.0,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 35.0,
                        child: TextField(
                          controller: controller.product_amt,
                          onTap: () {},
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(22, 54, 105, 1),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.amber,
                                width: 4.0,
                              ),
                            ),
                            hintText: '금액을 입력하세요.',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 13.0,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.strGroup.value == "") {
                      _showSnackBar(context, '그룹을 선택해 주세요.');
                      return;
                    }

                    if (controller.product_name.text == "") {
                      _showSnackBar(context, '상품명을 입력해 주세요.');
                      return;
                    }

                    if (controller.product_amt.text == "") {
                      _showSnackBar(context, '금액을 입력해 주세요.');
                      return;
                    }

                    controller.addProductInfo();
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(22, 54, 105, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '추가',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showDialog(BuildContext context, String msg, @required int num) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          // title: Text('접근불가'),
          content: Text(msg),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                controller.removeGroup(num);
                if (controller.removeResult.value == true) {
                  Navigator.pop(context);
                } else {
                  print('실패');
                }
              },
              isDefaultAction: true,
              child: const Text('확인'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              isDefaultAction: true,
              child: const Text(
                '취소',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
