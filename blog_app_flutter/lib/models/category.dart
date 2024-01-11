class CategoryModel {
  final String title;

  CategoryModel({required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(title: json['title']);
  }
}
