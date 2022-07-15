import 'package:meta/meta.dart';
import 'package:lms/app/data/provider/user/user_api.dart';

class UserRepository {
  final UserApiClient? userApiClient;

  UserRepository({@required this.userApiClient})
      : assert(userApiClient != null);

  goActUserPass({@required String? no, @required String? new_pass}) {
    return userApiClient?.goActUserPass(no: no, new_pass: new_pass);
  }
}
