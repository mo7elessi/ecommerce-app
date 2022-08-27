class CategoryModel {
  int? id;
  String? name;
  String? image;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
