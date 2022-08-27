import 'package:bloc_state_managment/data/model/notification_model.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';

import 'category_model.dart';
import 'favorite_model.dart';

class MyResponse<T> {
  bool? status;
  String? message;
  Pagination<T>? data;

  MyResponse({this.status, this.message, this.data});

  MyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Pagination.fromJson(json['data']) : null;
  }
}

class Pagination<T> {
  List<T>? items;
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      items = <T>[];
      json['data'].forEach((value) {
        items!.add(Generic.fromJson<T>(value));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class Generic {
  static T fromJson<T>(dynamic json) {
    if (T == FavoriteModel) {
      return FavoriteModel.fromJson(json) as T;
    } else if (T == CategoryModel) {
      return CategoryModel.fromJson(json) as T;
    } else if (T == ProductModel) {
      return ProductModel.fromJson(json) as T;
    } else if (T == NotificationModel) {
      return NotificationModel.fromJson(json) as T;
    } else {
      throw Exception("Unknown class");
    }
  }
}
