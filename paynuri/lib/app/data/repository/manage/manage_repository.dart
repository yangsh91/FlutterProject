import 'package:paynuri/app/data/provider/manage/manage_api.dart';

class ManageRepository {
  final ManageApiClient? manageApiClient;

  ManageRepository({required this.manageApiClient})
      : assert(manageApiClient != null);
}
