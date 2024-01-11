import 'package:blog_app_flutter/global.dart';
import 'package:blog_app_flutter/models/category.dart';
import 'package:blog_app_flutter/services/api.dart';
import 'package:flutter/material.dart';

class CategoryNotifier extends ChangeNotifier {
  Api api = Api();
  late List<CategoryModel> _categoryModel;
  late Status _status;

  Status get status => _status;
  List<CategoryModel> get categories => _categoryModel;

  getcategories() async {
    _status = Status.loading;
    _categoryModel = await api.getCategories();
    _status = Status.done;
    notifyListeners();
  }
}
