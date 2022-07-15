import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lms/app/data/model/attendance/attendance_model.dart';
import 'package:lms/app/data/repository/attendance_repository.dart';
import 'package:lms/app/routes/app_pages.dart';

class AttendanceController extends GetxController {
  final AttendanceRepository? repository;

  AttendanceController({@required this.repository})
      : assert(repository != null);

  SharedPreferences? logindata;
  String? no, user_id;
  String? atd_dt;

  @override
  void onInit() async {
    logindata = await SharedPreferences.getInstance();
    this.no = logindata!.getString('no');
    this.user_id = logindata!.getString('user_id');

    // print("==attendance==");
    // getList();
    // print("==attendance==");
    super.onInit();
  }

  final _postList = <AttendanceModel>[].obs;
  get postList => this._postList.value;
  set postList(value) => this._postList.value = value;

  getList() async {
    logindata = await SharedPreferences.getInstance();
    this.no = logindata!.getString('no');
    this.user_id = logindata!.getString('user_id');

    repository?.getList(user_id: user_id).then((data) {
      _postList.addAll(data);
    });
  }

  final _detailPost = <AttendanceModel>[].obs;
  get detailPost => this._detailPost.value;
  set detailPost(value) => this._detailPost.value = value;

  getDetail() async {
    _detailPost.clear();

    logindata = await SharedPreferences.getInstance();
    this.no = logindata!.getString('no');
    this.user_id = logindata!.getString('user_id');

    repository?.getDetail(user_id: user_id, atd_dt: atd_dt).then((data) {
      _detailPost.addAll(data);
    });
  }
}
