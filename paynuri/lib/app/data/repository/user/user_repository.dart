import 'package:paynuri/app/data/provider/user/user_api.dart';

class UserRepository {
  final UserApiClient? userApiClient;

  UserRepository({required this.userApiClient}) : assert(userApiClient != null);

  getLogin({required String user_id, required String user_pw}) {
    return userApiClient?.getLogin(user_id: user_id, user_pw: user_pw);
  }
}
