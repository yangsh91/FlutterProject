import 'package:image_picker/image_picker.dart';
import 'package:jarada_lab/app/data/provider/board/board_api.dart';

class BoardRepository {
  final BoardApiClient? boardApiClient;

  BoardRepository({this.boardApiClient}) : assert(boardApiClient != null);

  getBoardMonthlyList({int? num, String? searchKey}) {
    return boardApiClient?.getBoardMonthlyList(num: num, searchKey: searchKey);
  }

  goActBoardWrite(
      {required String user_id,
      String? subject,
      String? age,
      List<dynamic>? materialList,
      List<XFile>? imageList,
      List<dynamic>? tags,
      List<dynamic>? explain}) {
    return boardApiClient?.goActBoardWrite(
        user_id: user_id,
        subject: subject,
        age: age,
        materialList: materialList,
        imageList: imageList,
        tags: tags,
        explain: explain);
  }
}
