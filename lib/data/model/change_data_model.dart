class ChangeDataModel{
  late bool status;
  late String message;

  ChangeDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}