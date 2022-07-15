import 'package:jarada_lab/app/data/provider/home/home_api.dart';

class HomeRepository {
  final HomeApiClient? homeApiClient;

  HomeRepository({required this.homeApiClient}) : assert(homeApiClient != null);
}
