import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/controller/board/board_monthly_controller.dart';
import 'package:jarada_lab/app/data/provider/board/board_api.dart';
import 'package:jarada_lab/app/data/repository/board/board_repository.dart';

class BoardMonthlyBinding implements Bindings {
  @override
  void dependencies() {
    /*
    Get.lazyPut<BoardMonthlyController>(() {
      return BoardMonthlyController(
          boardRepository: BoardRepository(
              boardApiClient: BoardApiClient(httpClient: http.Client())));
    });
    */

    Get.put(BoardMonthlyController(
        boardRepository: BoardRepository(
            boardApiClient: BoardApiClient(httpClient: http.Client()))));
  }
}
