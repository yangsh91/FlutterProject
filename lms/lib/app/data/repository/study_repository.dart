import 'package:meta/meta.dart';
import 'package:lms/app/data/provider/study/study_api.dart';

class StudyRepository {
  final StudyApiClient? studyApiClient;

  StudyRepository({@required this.studyApiClient})
      : assert(studyApiClient != null);

  getTestList({String? user_id}) {
    return studyApiClient?.getTestList(user_id: user_id);
  }
}
