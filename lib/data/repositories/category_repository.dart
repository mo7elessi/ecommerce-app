import 'package:bloc_state_managment/data/model/category_model.dart';
import 'package:bloc_state_managment/data/model/home_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';

import '../model/product_model.dart';

abstract class CategoryRepository {
  Future<CategoryModel> getCategories();

  Future<ProductModel> getProductsByCategory({required int categoryId});
}

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<CategoryModel> getCategories() async {
    var categories = await DioHelper.getData(url: Endpoints.categories);
    return CategoryModel.fromJson(categories.data);
  }

  @override
  Future<ProductModel> getProductsByCategory({required int categoryId}) async {
    var products = await DioHelper.getData(
      url: "${Endpoints.categories}/$categoryId",
    );
    return ProductModel.fromJson(products.data);
  }
}
