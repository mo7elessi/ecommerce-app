class NotificationModel {
  int? id;
  String? title;
  String? message;

  NotificationModel({this.id, this.title, this.message});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['message'] = message;
    return data;
  }
}
