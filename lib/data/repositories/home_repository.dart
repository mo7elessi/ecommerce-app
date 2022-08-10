import 'package:bloc_state_managment/data/model/home_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';

abstract class HomeRepository {
  Future<HomeModel> getHomeData();
}

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<HomeModel> getHomeData() async {
    var home = await DioHelper.getData(url: Endpoints.home);
    return HomeModel.fromJson(home.data);
  }
}
