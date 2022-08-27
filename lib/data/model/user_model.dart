class UserResponse {
  bool? status;
  String? message;
  UserModel? data;

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = UserModel.fromJson(json['data']);
    }
  }
}

class UserModel {
  dynamic id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? image;
  dynamic points;
  dynamic credit;
  String? token;

  UserModel(this.name, this.email, this.password, this.phone);

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
