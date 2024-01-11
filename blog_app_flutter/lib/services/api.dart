import 'dart:convert';

import 'package:blog_app_flutter/models/category.dart';
import 'package:blog_app_flutter/models/editor.dart';
import 'package:blog_app_flutter/models/post.dart';
import "package:http/http.dart" as http;

class Api {
  final String _baseUrl = "192.168.1.102";

  // Get all the posts
  Future<List<PostModel>> getPosts() async {
    final Uri path = Uri.http(_baseUrl, "/posts");
    final response = await http.get(path);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception(response.body);
    }
  }

  // Get all posts of a specific editor
  Future<List<PostModel>> getSpecificEditorPosts(String userId) async {
    final Uri path = Uri.http(_baseUrl, "/posts/user");
    final response = await http.post(
      path,
      body: json.encode(
        {'id': '$userId'},
      ),
      headers: {'Content-Type': "application/json"},
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception(response.body);
    }
  }

  // Get single post by ID
  Future<PostModel> getSinglePost(String id) async {
    final Uri path = Uri.http(_baseUrl, "/posts/id");
    final response = await http.post(
      path,
      body: json.encode(
        {'id': '$id'},
      ),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode == 200) {
      return PostModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception(response.body);
    }
  }

  // Get Single Editor
  Future getEditor(String id) async {
    final Uri path = Uri.http(_baseUrl, "/editors/id");
    final response = await http.post(
      path,
      body: json.encode(
        {'id': '$id'},
      ),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode == 200) {
      return EditorModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  // Get All Categories
  Future getCategories() async {
    final Uri path = Uri.http(_baseUrl, "/cat");
    final response = await http.get(path);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<CategoryModel>((json) => CategoryModel.fromJson(json))
          .toList();
    } else {
      throw Exception(response.body);
    }
  }
}
