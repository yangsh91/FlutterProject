import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jarada_lab/app/data/model/board/board_model.dart';
import 'package:jarada_lab/app/ui/board/board_write.dart';

const baseUri = 'http://yangsh.site';

class BoardApiClient {
  final http.Client? httpClient;

  BoardApiClient({this.httpClient});

  Dio dio = Dio();

  getBoardMonthlyList({int? num, String? searchKey}) async {
    try {
      if (num == null) num = 0;
      if (searchKey == null) searchKey = "";

      var data = {
        'type': 'board',
        'mode': 'monthlyList',
        'num': num.toString(),
        'searchKey': searchKey,
      };

      var response = await httpClient!.post(
        Uri.parse(baseUri),
        headers: {"Accept": "application/json"},
        body: data,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);

        List<BoardModel> noticeList =
            jsonResponse.map((e) => BoardModel.fromJson(e)).toList();

        return noticeList;
      }
    } catch (_) {
      print(_.toString());
    }
  }

  goActBoardWrite({
    required String user_id,
    String? subject,
    String? age,
    List<dynamic>? materialList,
    List<XFile>? imageList,
    List<dynamic>? tags,
    List<dynamic>? explain,
  }) async {
    // var tmp = [];
    // if (materialList!.isNotEmpty) {
    //   for (int i = 0; i < materialList.length; i++) {
    //     tmp.add(materialList[i].id);
    //   }
    // }

    List<MultipartFile> multipartImgList = [];

    if (imageList!.length > 0) {
      // final List<MultipartFile> _files = imageList
      //     .map((img) => MultipartFile.fromFileSync(img.path,
      //         contentType: new MediaType("image", "jpg")))
      //     .toList();

      for (int i = 0; i < imageList.length; i++) {
        var pic = await MultipartFile.fromFile(imageList[i].path,
            contentType: new MediaType('image', 'jpg'));
        multipartImgList.add(pic);
      }
    }

    FormData formData = FormData.fromMap({
      'type': 'board',
      'mode': 'boardWrite',
      'user_id': user_id,
      'subject': subject,
      'age': age,
      'materialList[]': materialList,
      'imgList[]': multipartImgList,
      'tags[]': tags,
      'explain[]': explain,
    });

    // print(formData.files);

    dio.options.contentType = 'multipart/form-data';

    final response = await dio.post(
      baseUri.toString(),
      data: formData,
    );

    print(response);
  }
}
