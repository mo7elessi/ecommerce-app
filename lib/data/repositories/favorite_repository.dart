import 'package:bloc_state_managment/data/model/favorite_model.dart';

abstract class FavoriteRepository{
  Future<FavoriteModel> getFavorite();
}
 class FavoriteRepositoryImpl extends FavoriteRepository{
  @override
  Future<FavoriteModel> getFavorite() {
    // TODO: implement getFavorite
    throw UnimplementedError();
  }
}