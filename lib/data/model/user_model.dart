class UserModel {
  bool? status;
  String? message;
  UserData? data;

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = UserData.fromJson(json['data']);
    }
  }
}

class UserData {
  dynamic id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? image;
  dynamic points;
  dynamic credit;
  String? token;

  UserData(this.name, this.email, this.password, this.phone);

  UserData.fromJson(Map<String, dynamic> json) {
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
