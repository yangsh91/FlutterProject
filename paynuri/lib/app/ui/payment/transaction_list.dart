import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:paynuri/app/controller/payment/transaction_list_controller.dart';

class TransactionList extends GetView<TransactionListController> {
  @override
  final TransactionListController controller =
      Get.put(TransactionListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('거래내역'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 40.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80.0,
                          height: 40.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: const Text(
                            '사용여부',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 40.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: const Text(
                              '2022-06-01',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 40.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: const Text(
                              '2022-06-30',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                width: double.infinity,
                height: 40.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80.0,
                          height: 40.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: const Text(
                            '조회조건',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 40.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: const Text(
                              '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 40.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: const Text(
                              '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      columns: const [
                        DataColumn2(
                          label: Text('거래일'),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: Text('결제\n구분'),
                        ),
                        DataColumn(
                          label: Text('고객명'),
                        ),
                        DataColumn(
                          label: Text('거래\n금액'),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text('상태'),
                          numeric: true,
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          controller.list.length,
                          (index) => DataRow(cells: [
                                DataCell(
                                  Text(
                                    controller.list[index]['date'],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                    Text(controller.list[index]['tran_type'])),
                                DataCell(
                                    Text(controller.list[index]['customer'])),
                                DataCell(Text(controller.list[index]['amt'])),
                                DataCell(
                                    Text(controller.list[index]['status'])),
                              ]))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
