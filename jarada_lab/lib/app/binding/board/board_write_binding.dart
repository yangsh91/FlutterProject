import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/controller/board/board_write_controller.dart';
import 'package:jarada_lab/app/data/provider/board/board_api.dart';
import 'package:jarada_lab/app/data/repository/board/board_repository.dart';

class BoardWriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoardWriteController>(() {
      return BoardWriteController(
          boardRepository: BoardRepository(
              boardApiClient: BoardApiClient(httpClient: http.Client())));
    });

    //Get.put(BoardWriteController());
  }
}
