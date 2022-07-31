import 'package:bloc_state_managment/data/model/category_model/category_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';

abstract class CategoryRepository {
  Future<CategoryModel> getCategories();
}

class CategoryRepositoryImplementation extends CategoryRepository {
  @override
  Future<CategoryModel> getCategories() async {
    var categories = await DioHelper.getData(url: Endpoints.categories);
    return CategoryModel.fromJson(categories.data);
  }
}
