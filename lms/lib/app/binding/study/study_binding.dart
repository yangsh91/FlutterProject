import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lms/app/controller/study/study_controller.dart';
import 'package:lms/app/data/provider/study/study_api.dart';
import 'package:lms/app/data/repository/study_repository.dart';

class StudyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudyController>(() {
      return StudyController(
          repository: StudyRepository(
              studyApiClient: StudyApiClient(httpClient: http.Client())));
    });
  }
}
