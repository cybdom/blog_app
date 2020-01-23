import 'package:blog_app_flutter/global.dart';
import 'package:blog_app_flutter/models/category.dart';
import 'package:blog_app_flutter/models/editor.dart';
import 'package:blog_app_flutter/models/post.dart';
import 'package:blog_app_flutter/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditorNotifier extends ChangeNotifier {
  Api _api = Api();
  EditorModel _editor;
  List<PostModel> _posts;
  List<CategoryModel> _categories;
  Status _status;

  List<PostModel> get posts => _posts;
  EditorModel get editorInfo => _editor;
  List<CategoryModel> get categories => _categories;

  get status => _status;

  getEditor(String id) async {
    _status = Status.loading;
    notifyListeners();
    _posts = await _api.getSpecificEditorPosts(id);
    _editor = await _api.getEditor(id);
    _categories = await _api.getCategories();
    _status = Status.done;
    print(_status);
    notifyListeners();
  }
}
