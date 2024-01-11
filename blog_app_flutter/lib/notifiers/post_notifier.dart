import 'package:blog_app_flutter/global.dart';
import 'package:blog_app_flutter/models/post.dart';
import 'package:blog_app_flutter/services/api.dart';
import 'package:flutter/material.dart';

class PostNotifier extends ChangeNotifier {
  late List<PostModel> _posts;
  late PostModel _singlePost;
  late Status _status;
  Api _api = Api();

  List<PostModel> get posts => _posts;
  PostModel get singlePost => _singlePost;
  Status get status => _status;

  getPosts() async {
    _status = Status.loading;
    notifyListeners();
    _posts = await _api.getPosts();
    _status = Status.done;
    notifyListeners();
  }

  getSinglePost(String id) async {
    _status = Status.loading;
    notifyListeners();
    _singlePost = await getSinglePost(id);
    _status = Status.done;
    notifyListeners();
  }
}
