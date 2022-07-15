import 'package:get/get.dart';

class TransactionListController extends GetxController {
  final List<Map<String, dynamic>> list = [
    {
      "id": "1",
      "date": "2022-06-01",
      "tran_tm": "09:30:48",
      "tran_type": "대면결제",
      "customer": "김유미",
      "amt": "143,000",
      "status": "완료",
    },
    {
      "id": "2",
      "date": "2022-06-02",
      "tran_tm": "11:00:20",
      "tran_type": "URL결제",
      "customer": "김유미",
      "amt": "143,000",
      "status": "완료",
    },
    {
      "id": "3",
      "date": "2022-06-04",
      "tran_tm": "19:55:22",
      "tran_type": "URL결제",
      "customer": "김유미",
      "amt": "143,000",
      "status": "완료",
    },
    {
      "id": "4",
      "date": "2022-06-15",
      "tran_tm": "09:00:02",
      "tran_type": "URL결제",
      "customer": "김유미",
      "amt": "143,000",
      "status": "진행중",
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
