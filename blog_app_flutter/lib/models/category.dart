class CategoryModel {
  final String title;

  CategoryModel({this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(title: json['title']);
  }
}
