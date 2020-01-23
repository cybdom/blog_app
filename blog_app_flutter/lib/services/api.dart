import 'dart:convert';

import 'package:blog_app_flutter/models/category.dart';
import 'package:blog_app_flutter/models/editor.dart';
import 'package:blog_app_flutter/models/post.dart';
import "package:http/http.dart" as http;

class Api {
  final String _baseUrl = "http://192.168.1.101";

  // Get all the posts
  Future<List<PostModel>> getPosts() async {
    final response = await http.get("$_baseUrl/posts");
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception(response.body);
    }
  }

  // Get all posts of a specific editor
  Future<List<PostModel>> getSpecificEditorPosts(String userId) async {
    final response = await http.post(
      '$_baseUrl/posts/user',
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
    final response = await http.post(
      '$_baseUrl/posts/id',
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
    final response = await http.post(
      '$_baseUrl/editors/id',
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
    final response = await http.get('$_baseUrl/cat');
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
