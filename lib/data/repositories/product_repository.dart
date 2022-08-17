import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';

abstract class ProductRepository {
  Future<ProductModel> search({required String text});

  Future<ProductModel> productsByCategory({required int categoryId});

  Future<ProductModel> productDetails({required int productId});
}

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<ProductModel> search({required String text}) async {
    var result = await DioHelper.postData(
      url: Endpoints.search,
      data: {'text': text},
    );
    return ProductModel.fromJson(result.data);
  }

  @override
  Future<ProductModel> productsByCategory({required int categoryId}) async {
    var result = await DioHelper.getData(
      url: Endpoints.categories,
      query: {'category_id': categoryId},
    );
    return ProductModel.fromJson(result.data);
  }

  @override
  Future<ProductModel> productDetails({required int productId}) async {
    var result = await DioHelper.getData(
      url: "${Endpoints.products}/$productId",
    );
    throw UnimplementedError();
  }
}
