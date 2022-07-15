import 'package:lms/app/data/provider/user/login_api.dart';
import 'package:meta/meta.dart';

class LoginRepository {
  final LoginApiClient? loginApiClient;

  LoginRepository({@required this.loginApiClient})
      : assert(loginApiClient != null);

  goActLogin({@required String? user_id, @required String? user_pw}) {
    return loginApiClient?.goActLogin(user_id: user_id, user_pw: user_pw);
  }
}
